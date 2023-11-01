import 'package:bamadan/Data/App/dynamic_data_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Api/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String gender = '1';

  Future register({
    required String phone,
    required String name,
    required String family,
    required int gender,
  }) async {
    Api api = Api();

    Response response = await api.userRegistration(
      phone: phone,
      name: name,
      family: family,
      gender: gender,
    );

    print(response.data);
    if (response.data['Status'] == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('session', response.data['User']['Session']);
      userData = response.data['User'];
      Navigator.of(context).pushNamed('/navigation');
    } else if (response.data['Status'] == 901) {
    } else if (response.data['Status'] == 900) {
    } else if (response.data['Status'] == 400) {
    } else if (response.data['Status'] == 401) {
    } else if (response.data['Status'] == 405) {
    } else {}
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
                    Navigator.of(context).pop(false);
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
                      height: MediaQuery.of(context).size.height * 0.20,
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
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 25),
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0XFFE8F4F4),
                        borderRadius: BorderRadius.circular(20),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'نام',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextField(
                                        controller: controller1,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 15)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'نام خانوادگی',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: TextField(
                                      controller: controller2,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15)),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'جنسیت',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 55,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: DropdownButton(
                                          underline: Container(),
                                          alignment: Alignment.center,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: gender,
                                          icon: const Icon(
                                              Icons.arrow_drop_down_rounded),
                                          items: [
                                            DropdownMenuItem(
                                              value: '1',
                                              child: Center(
                                                child: const Text(' مرد '),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '2',
                                              child: Center(
                                                child: const Text(' زن '),
                                              ),
                                            ),
                                          ],
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              gender = newValue!;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                autofocus: true,
                                onPressed: () {
                                  register(
                                      phone: phoneNumber1!,
                                      name: controller1.text,
                                      family: controller2.text,
                                      gender: gender == '1' ? 1 : 2);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  child: Text(
                                    'ثبت',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
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
                    child: Icon(
                      CupertinoIcons.person,
                      size: 90,
                    ),
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
