import 'package:bamadan/Data/App/dynamic_data_app.dart';
import 'package:flutter/material.dart';

class Book1Screen extends StatefulWidget {
  const Book1Screen({super.key});

  @override
  State<Book1Screen> createState() => _Book1ScreenState();
}

class _Book1ScreenState extends State<Book1Screen> {
  bool signRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('کتاب خواه'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 100,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'آماده ای که در کمترین زمان ممکن کتاب مورد نظرت رو بخونی ؟',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 2.2,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userData == null) {
                      Navigator.pushNamed(context, '/auth');
                    } else {
                      Navigator.pushNamed(context, '/addRequest');
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0XFF3CA59E))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Text(
                      'ثبت درخواست',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 150),
            child: Image(
              image: AssetImage('assets/images/booki.png'),
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
