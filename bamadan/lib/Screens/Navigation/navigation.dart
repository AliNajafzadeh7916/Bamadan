import 'dart:io';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:bamadan/Data/App/dynamic_data_app.dart';
import 'package:bamadan/Screens/Auth/auth.dart';
import 'package:bamadan/Screens/Navigation/book1.dart';
import 'package:bamadan/Screens/Navigation/book2.dart';

import 'package:bamadan/Screens/Navigation/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../../Data/Api/api.dart';
import '../../Theme/theme.dart';
import 'shop.dart';
import 'home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  PageController pageController = PageController(initialPage: 2);
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 2);

  @override
  void initState() {
    super.initState();
  }

  Future sendCode({required String phone}) async {
    Api api = Api();

    Response response = await api.sendCodeToPhone(phone: phone);

    print(response.data);

    if (response.data['Status'] == 200) {
    } else if (response.data['Status'] == 901) {
    } else if (response.data['Status'] == 900) {
    } else {}
  }

  back() {
    setState(() {
      notchBottomBarController.index = 2;
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  Future<bool> backApp() async {
    return (await back()) ?? false;
  }

  Future<bool> exitApp() async {
    return (await showDialog(
          barrierColor: const Color.fromARGB(97, 178, 216, 218),
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('خروج از برنامه'),
            content: const Text('آیا می خواهید از برنامه خارج شوید؟'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('خیر'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('بله'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    //
    List<Widget> bottomBarPages = [
      userData == null ? AuthScreen() : ProfileScreen(),
      Book1Screen(),
      HomeScreen(),
      Book2Screen(),
      ShopScreen(),
    ];

    return WillPopScope(
      onWillPop: notchBottomBarController.index == 2 ? exitApp : backApp,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: PageView(
          reverse: true,
          controller: pageController,
          physics: const AlwaysScrollableScrollPhysics(),
          children: List.generate(
            bottomBarPages.length,
            (index) => bottomBarPages[index],
          ),
          onPageChanged: (index) {
            setState(() {
              notchBottomBarController.index = index;
            });
          },
        ),
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: notchBottomBarController,
          color: MyThemes.primeryColor,
          showLabel: false,
          notchColor: MyThemes.secondaryColor,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(FontAwesomeIcons.user, color: Colors.white),
              activeItem: Icon(FontAwesomeIcons.user),
              itemLabel: 'حساب کاربری',
            ),

            ///svg example
            BottomBarItem(
              inActiveItem: Icon(Icons.book_outlined, color: Colors.white),
              activeItem: Icon(Icons.book_outlined),
              itemLabel: 'جست و جو',
            ),
            BottomBarItem(
              inActiveItem: Icon(CupertinoIcons.home, color: Colors.white),
              activeItem: Icon(CupertinoIcons.home),
              itemLabel: 'صفحه اصلی',
            ),

            BottomBarItem(
              inActiveItem:
                  Icon(CupertinoIcons.book, size: 27, color: Colors.white),
              activeItem: Icon(CupertinoIcons.book, size: 27),
              itemLabel: 'تالار گفتگو',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.shopping_bag_outlined,
                  size: 27, color: Colors.white),
              activeItem: Icon(Icons.shopping_bag_outlined, size: 27),
              itemLabel: 'فروشگاه',
            ),
          ],
          onTap: (index) {
            setState(() {
              notchBottomBarController.index = index;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            });
          },
        ),
      ),
    );
  }
}
