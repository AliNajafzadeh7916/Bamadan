import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:glass_kit/glass_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('assets/images/tree.png'),
        ),
        title: Text(
          'بامادان',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            tooltip: 'جستجو',
            icon: const Icon(
              Icons.search_rounded,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
        ],
        toolbarHeight: 69,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0XFFA2DE96),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 5,
                        bottom: 15,
                        child: Image(
                          width: MediaQuery.of(context).size.width * 0.55,
                          image: const AssetImage('assets/images/home.png'),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text(
                                      'با ما بدان . . . \nاینجا قراره از زمان جلو بزنیم',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                                    child: Text(
                                      'هم به دانش خودت اضافه کن\nهم درآمد داشته باش',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(
                                      'بیشترین یادگیری در کمترین زمان',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'چه کارهایی\nمی‌توانیم\nانجام دهیم؟',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                        Image(
                          width: 70,
                          image: AssetImage('assets/images/intro2.png'),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0XFF3CA59E),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(26),
                            bottom: Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
                            child: Icon(
                              CupertinoIcons.book_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0XFFA2DE96),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(5)),
                            ),
                            child: const Text('خلاصه متنی'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0XFF3CA59E),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(26),
                            bottom: Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
                            child: Icon(
                              CupertinoIcons.waveform_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0XFFA2DE96),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(5)),
                            ),
                            child: const Text('خلاصه صوتی'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0XFF3CA59E),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(26),
                            bottom: Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 15),
                            child: Icon(
                              CupertinoIcons.bubble_left_bubble_right,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0XFFA2DE96),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(5)),
                            ),
                            child: const Text('تالار گفتمان'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'نویسنده مینی بوک های ما باشید',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    // padding: const EdgeInsets.symmetric(horizontal: 5)),
                    itemBuilder: ((context, index) {
                      return FlipCard(
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
                                  )
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'راوی مینی بوک های ما باشید',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    // padding: const EdgeInsets.symmetric(horizontal: 5)),
                    itemBuilder: ((context, index) {
                      return FlipCard(
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 90),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.28 - 25,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0XFF56B87F)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'کتابخوان',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0XFF56B87F)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'کتاب خواه',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
