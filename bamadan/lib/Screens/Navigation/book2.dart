import 'package:flutter/material.dart';

import '../../Data/App/dynamic_data_app.dart';

class Book2Screen extends StatefulWidget {
  const Book2Screen({super.key});

  @override
  State<Book2Screen> createState() => _Book2ScreenState();
}

class _Book2ScreenState extends State<Book2Screen> {
  bool signRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('کتاب خوان'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 100),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0XFFA2DE96),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('موضوع پروژه : '),
                    const SizedBox(height: 10),
                    Text('زمان تحویل : '),
                    const SizedBox(height: 10),
                    Text('نوع فایل : '),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 120),
                        ElevatedButton(
                          onPressed: () {
                            if (userData == null) {
                              Navigator.pushNamed(context, '/auth');
                            } else {
                              Navigator.pushNamed(context, '/addRequest');
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0XFF3CA59E))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'انجام میدم',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
