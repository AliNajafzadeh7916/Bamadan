import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دعوت از دوستان'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Opacity(
                    opacity: 0.1,
                    child: Image(
                      image: AssetImage(
                        'assets/icon/logo.png',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Lottie.asset(
                    'assets/images/invite.json',
                  ),
                ),
              ],
            ),
            const Text(
              'دعوت و معرفی به دوستان',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: const Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'دوستان خود را به',
                    style: TextStyle(fontSize: 13),
                  ),
                  TextSpan(
                    text: ' بامادان ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  TextSpan(
                      text:
                          'دعوت کنید تا از امکانات ویژه ای که بامادان برای شما فراهم کرده است استفاده کنند و '),
                ]),
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: Theme.of(context).primaryColor,
              strokeWidth: 2,
              dashPattern: const [5, 5],
              strokeCap: StrokeCap.round,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(' کد دعوت :  '),
                    Text(
                      'A6RD5I',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: '',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.copy)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
