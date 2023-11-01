import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جوایز و تخفیف ها'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: Opacity(
                opacity: 1,
                child: Lottie.asset(
                  'assets/images/discount.json',
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              ' در حال حاضر \nجایزه و تخفیفی وجود ندارد ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
