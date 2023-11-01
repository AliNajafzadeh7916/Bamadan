import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  bool isUpdate = false;

  timer() {
    var durtion = const Duration(seconds: 1);
    return Timer(durtion, update);
  }

  update() {
    setState(() {
      isUpdate = true;
    });
    timer().cancel();
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  void dispose() {
    super.dispose();
    timer().cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بروزرسانی برنامه'),
        centerTitle: true,
      ),
      body: Center(
        child: isUpdate
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Lottie.asset(
                      'assets/images/update.json',
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text(
                    'شما بروز هستید',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'در حال حاضر از آخرین نسخه بامادان استفاده می‌کنید',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).primaryColor,
                      size: 150,
                    ),
                  ),
                  const Text(
                    'در حال بررسی وجود بروزرسانی ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}
