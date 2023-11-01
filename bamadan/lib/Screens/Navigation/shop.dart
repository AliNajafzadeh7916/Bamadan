import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var slider = ['assets/images/slider1.jpg', 'assets/images/slider2.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فروشگاه'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 220,
              enlargeCenterPage: true,
            ),
            items: slider.map((slide) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: 220,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(slide), fit: BoxFit.fill),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'برترین خلاصه های متنی',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('بیشتر...')),
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: 210,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.symmetric(horizontal: 5)),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      FlipCard(
                        fill: Fill
                            .fillBack, // Fill the back side of the card to make in the same size as the front.
                        direction: FlipDirection.HORIZONTAL, // default
                        side: CardSide.FRONT, // The side to initially display.
                        front: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
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
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('title'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text('30000 تومان')]),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'برترین خلاصه های صوتی',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('بیشتر...')),
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: 210,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                // padding: const EdgeInsets.symmetric(horizontal: 5)),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      FlipCard(
                        fill: Fill
                            .fillBack, // Fill the back side of the card to make in the same size as the front.
                        direction: FlipDirection.HORIZONTAL, // default
                        side: CardSide.FRONT, // The side to initially display.
                        front: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
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
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('title'),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text('30000 تومان')]),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 100),
        ]),
      ),
    );
  }
}
