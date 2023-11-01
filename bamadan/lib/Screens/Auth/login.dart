import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../Data/Api/api.dart';
import 'adent.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String? tel = '';
  TextEditingController? contorller = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future sendCode({required String phone}) async {
    Api api = Api();

    Response response = await api.sendCodeToPhone(phone: phone);

    print(response.data);

    if (response.data['Status'] == 200) {
      Navigator.of(context).pop(false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdentScreen(
            phoneNumber: tel!,
          ),
        ),
      );
    } else if (response.data['Status'] == 901) {
    } else if (response.data['Status'] == 900) {
    } else if (response.data['Status'] == 402) {
      Navigator.of(context).pop(false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdentScreen(
            phoneNumber: tel!,
          ),
        ),
      );
    } else {}
  }

  Future<bool> checkPhone() async {
    return (await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: GlassContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.purpleAccent.withOpacity(0.05),
                      Colors.purpleAccent.withOpacity(0.60),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  blur: 4,
                  elevation: 3.0,
                  isFrostedGlass: false,
                  shadowColor: Colors.purple.withOpacity(0.20),
                ),
              ),
              AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: const Text('تایید شماره'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('آیا این شماره درست است ؟'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '+98 ${tel!.substring(1, 4)} ${tel!.substring(4, 7)} ${tel!.substring(7, 11)}',
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('ویرایش'),
                  ),
                  TextButton(
                    onPressed: () {
                      sendCode(phone: tel!);
                    },
                    child: const Text('بله'),
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0XFFA2DE96),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(50),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      'تایید شماره همراه',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9۰۱۲۳۴۵۶۷۸۹]'))
                      ],
                      controller: contorller,
                      maxLength: 11,
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.phone,
                      minLines: 1,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        hintTextDirection: TextDirection.ltr,
                        counterText: '',
                        hintText: '09 _ _  _ _ _  _ _ _ _',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                        label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone_enabled_rounded,
                                color: Colors.grey[600],
                              ),
                              const Text(
                                ' شماره همراه ',
                              ),
                            ]),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(
                          () {
                            tel = value;
                            if (tel!.length == 11 &&
                                tel![0] == '0' &&
                                tel![1] == '9') {
                              checkPhone();
                            }
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    autofocus: true,
                    onPressed:
                        tel!.length == 11 && tel![0] == '0' && tel![1] == '9'
                            ? () {
                                tel ??= '09xxxxxxxxx';
                                if (tel!.length < 11) tel = '09xxxxxxxxx';
                                checkPhone();
                              }
                            : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        'ثبت',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                child: const Image(
                  image: AssetImage('assets/images/login.png'),
                  width: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
