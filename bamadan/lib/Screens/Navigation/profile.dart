import 'package:awesome_icons/awesome_icons.dart';
import 'package:bamadan/Data/App/dynamic_data_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Logic/Providers/Language/language_provider.dart';
import '../../Logic/Providers/Theme/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حساب کاربری'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          CupertinoIcons.person,
                          size: 60,
                          color: Colors.black,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData!['Name'] + ' ' + userData!['Family'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('پروژه های در دست اقدام : 0 عدد'),
                    Text('امتیاز من : 0 '),
                  ],
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0XFF56B87F),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(55),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0XFFA2DE96),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(55),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/my_shelf');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFFDFFA4),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.info_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'قفسه من',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'خلاصه هایی که خریدی رو همه رو اینجا داری',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/my_request');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFFDFFA4),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.info_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'درخواست های من',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'پروژه هایی که ثبت کردی رو اینجا داری ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/my_project');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFBCEAF4),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.info_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'پروژه های من',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'کارهایی که قبول کردی انجام بدی رو اینجا داری ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/offers_state');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFBCEAF4),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.info_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'وضعیت پیشنهاد ها',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'درخواست دادی که انجام بدی ولی هنوز تایید نشده ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/my_cv');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF2C3C6),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.info_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'نمونه کارهای من',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'تمام هایی که تا الان در بامادان ثبت کردی ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/wallet');
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.width * 0.38,
                                width: MediaQuery.of(context).size.width * 0.38,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF2C3C6),
                                  borderRadius: BorderRadius.circular(45),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'کیف پول',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'هر زمان بخوای میتونی شارژش کنی',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.userCircle,
                size: 35,
              ),
              title: Text(
                'اطلاعات کاربری',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: Text(
                'مشاهده و ویرایش اطلاعات کاربری',
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                CupertinoIcons.paintbrush,
                size: 35,
              ),
              title: const Text(
                'نمایش برنامه',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'حالت شب و روز',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () async {
                if (isDark) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(ThemeMode.light);
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(ThemeMode.dark);
                }
                isDark = !isDark;
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                Icons.translate_outlined,
                size: 35,
              ),
              title: const Text(
                'زبان برنامه',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'تغییر زبان برنامه',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .toggleLocale();
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                CupertinoIcons.rocket,
                size: 35,
              ),
              title: const Text(
                'بروزرسانی',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'بررسی نسخه برنامه',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/update');
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                CupertinoIcons.gift,
                size: 35,
              ),
              title: const Text(
                'جوایز و تخفیف ها',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'فعالیت بیشتر ، جایزه بیشتر',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/discount');
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                CupertinoIcons.person_2,
                size: 35,
              ),
              title: const Text(
                'دعوت از دوستان',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'دریافت هدیه و تخفیف با دعوت دوستان',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/invite');
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                Icons.support_agent_rounded,
                size: 38,
              ),
              title: const Text(
                'پشیتبانی',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'گفتگو با پشتیبانی',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/support');
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(
                CupertinoIcons.question_circle,
                size: 38,
              ),
              title: const Text(
                'راهنما',
                style: TextStyle(fontSize: 17),
              ),
              subtitle: const Text(
                'راهنما و سوالات متداول',
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/guide');
              },
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Image(
                width: 40,
                image: AssetImage('assets/icon/logo.png'),
              ),
              title: const Text(
                'درباره ما',
                style: TextStyle(fontSize: 17),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              ),
              style: ListTileStyle.drawer,
              onTap: () {
                Navigator.pushNamed(context, '/info');
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
