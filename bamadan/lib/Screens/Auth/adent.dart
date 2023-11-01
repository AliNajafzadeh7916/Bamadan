// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';

import 'package:quiver/async.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../Data/Api/api.dart';
import '../../Data/App/dynamic_data_app.dart';

class AdentScreen extends StatefulWidget {
  AdentScreen({super.key, required this.phoneNumber});

  String phoneNumber;

  @override
  State<AdentScreen> createState() =>
      AdentScreenState(phoneNumber: this.phoneNumber);
}

class AdentScreenState extends State<AdentScreen> {
  AdentScreenState({required this.phoneNumber});
  String phoneNumber;
  String? code;
  TextEditingController? contorller;
  int fulTime = 90;
  int time = 90;
  bool stop = false;

  startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: fulTime),
      const Duration(seconds: 1),
    );

    var timer = countDownTimer.listen(null);
    timer.onData((duration) {
      setState(() {
        time = fulTime - duration.elapsed.inSeconds;
      });
      if (stop) {
        timer.cancel();
        Navigator.of(context).pop(true);
      }
    });

    timer.onDone(() {
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future checkCode({
    required String phone,
    required String code,
  }) async {
    Api api = Api();

    Response response = await api.checkVerifyCode(phone: phone, code: code);

    print(response.data);

    phoneNumber1 = phone;
    if (response.data['Status'] == 200) {
      Navigator.of(context).pushNamed('/navigation');
    } else if (response.data['Status'] == 201) {
      Navigator.of(context).pushNamed('/register');
    } else if (response.data['Status'] == 901) {
    } else if (response.data['Status'] == 900) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text('کد وارد شده اشتباه است'),
            ],
          ),
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
      );
    }
  }

  Future<bool> edit() async {
    return (await showDialog(
          context: context,
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
                    stops: [0.0, 0.39, 0.40, 1.0],
                  ),
                  blur: 2.5,
                  elevation: 3.0,
                  isFrostedGlass: false,
                  shadowColor: Colors.purple.withOpacity(0.20),
                ),
              ),
              AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: const Text('ویرایش شماره '),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'آیا می خواهید شماره خود را ویرایش کنید ؟',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '+98 ${phoneNumber.substring(1, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7, 11)}',
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'در صورتی که شماره بالا درست است لطفاً منتظر کد تایید بمانید.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('بستن'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      time < 1
                          ? Navigator.of(context).pop(true)
                          : setState(() {
                              stop = true;
                            });
                    },
                    child: const Text('ویرایش'),
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
          context: context,
          builder: (context) => Stack(children: [
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
                  stops: [0.0, 0.39, 0.40, 1.0],
                ),
                blur: 2.5,
                elevation: 3.0,
                isFrostedGlass: false,
                shadowColor: Colors.purple.withOpacity(0.20),
              ),
            ),
            AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Text('بازگشت به صفحه قبل'),
              content:
                  const Text('آیا از متوقف کردن فرایند احراز هویت مطمئنید؟ '),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('بستن'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    time < 1
                        ? Navigator.of(context).pop(true)
                        : setState(() {
                            stop = true;
                          });
                  },
                  child: const Text('تایید'),
                ),
              ],
            ),
          ]),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitApp,
      child: SafeArea(
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
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
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: PinInputTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9۰۱۲۳۴۵۶۷۸۹]'))
                        ],
                        controller: contorller,
                        cursor: Cursor(
                            color: Colors.grey,
                            enabled: true,
                            height: 30,
                            width: 1),
                        pinLength: 6,
                        decoration: UnderlineDecoration(
                            lineHeight: 3,
                            lineStrokeCap: StrokeCap.round,
                            colorBuilder: PinListenColorBuilder(
                                Colors.blue, Colors.grey)),
                        onChanged: (value) {
                          setState(() {
                            code = value;
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: edit,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'شماره را اشتباه وارد کرده‌اید ؟',
                          style: TextStyle(
                              color: Colors.blue[500],
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('کد را دریافت نکردید ؟ '),
                            Text(
                              time > 0 ? '$time ثانیه' : 'دریافت مجدد',
                              style: TextStyle(
                                  color: time > 0 ? null : Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (time < 1) {
                          startTimer();

                          var snackBar = const SnackBar(
                            content: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text('کد تایید جدید برای شما ارسال شد'),
                              ],
                            ),
                            backgroundColor: Color.fromARGB(255, 37, 192, 42),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    ElevatedButton(
                      autofocus: true,
                      onPressed: code == null || code!.length < 6
                          ? null
                          : () {
                              checkCode(phone: phoneNumber, code: code!);
                            },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    SizedBox(height: 50),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.055,
                  child: const Image(
                    image: AssetImage('assets/images/adent.png'),
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
