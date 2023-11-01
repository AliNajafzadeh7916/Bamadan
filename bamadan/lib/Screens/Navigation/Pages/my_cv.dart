import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MyCvScreen extends StatefulWidget {
  const MyCvScreen({super.key});

  @override
  State<MyCvScreen> createState() => _MyCvScreenState();
}

class _MyCvScreenState extends State<MyCvScreen> {
  bool signRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نمونه کارهای من'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            side: CardSide.FRONT, // The side to initially display.
            front: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              width: 110,
              child: const Image(
                image: AssetImage('assets/images/book1.png'),
              ),
              decoration: BoxDecoration(
                //border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            back: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              width: 110,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/book1.png'),
                  ),
                  GlassContainer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.40),
                        Colors.white.withOpacity(0.40),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    blur: 2,
                    elevation: 2,
                    isFrostedGlass: false,
                    shadowColor: Colors.white,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'نویسنده : \nعلی نجف زاده',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'انتشارات پندار',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '240 صفحه',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'خلاصه شده در 12 صفحه',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'توسط آردی',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          );
        },
      ),
    );
  }
}
