import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('درباره بامادان'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/icon/logo.png'),
                ),
              ),
            ),
            Text(
              'بامادان',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('تماس با ما '),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
