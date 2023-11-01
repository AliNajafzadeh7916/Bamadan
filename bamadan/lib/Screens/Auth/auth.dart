import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
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
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 80),
                    Text(
                      'هنوز عضو خانواده بامادان نشدی ؟',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('همراه ما باش و بیشتر بخون و درآمد کسب کن'),
                  ],
                ),
                const Image(
                  image: AssetImage('assets/images/auth.png'),
                  height: 260,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0XFF3CA59E)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Text(
                    'همین حالا به ما بپیوندید',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
