import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  late Function goToTab;

  Future<void> onDonePress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('intro', '1');
    Navigator.pushNamed(context, '/navigation');
  }

  Widget renderPrevBtn() {
    return const Text('قبلی');
  }

  Widget renderNextBtn() {
    return const Text('بعدی');
  }

  Widget renderDoneBtn() {
    return const Text(' بزن بریم ');
  }

  ButtonStyle myButtonStyle1() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x00000000)),
      foregroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF328322)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xFFC1E2BA)),
    );
  }

  ButtonStyle myButtonStyle2() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFC1E2BA)),
      foregroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF328322)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xFF6ED459)),
    );
  }

  ButtonStyle myButtonStyle3() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 158, 226, 144)),
      foregroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF328322)),
      overlayColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 58, 216, 27)),
    );
  }

  List<Widget> generateListCustomTabs() {
    return List.generate(
      3,
      (index) => SizedBox(
        //decoration: BoxDecoration(color: Colors.amber),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
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
                  const SizedBox(height: 10),
                  const Image(
                    image: AssetImage('assets/icon/logo.png'),
                    height: 100,
                    width: 100,
                  ),
                  if (index == 0)
                    const Image(
                      image: AssetImage('assets/images/intro1.png'),
                    ),
                  if (index == 1)
                    const Image(
                      image: AssetImage('assets/images/intro2.png'),
                      height: 350,
                    ),
                  if (index == 2)
                    const Image(
                      image: AssetImage('assets/images/intro3.png'),
                      height: 350,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    index == 0
                        ? 'سلام\nبه بامادان خوش اومدین'
                        : index == 1
                            ? 'با هم رشد کنیم'
                            : 'درآمد و تجربه کسب کنین',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textAlign: TextAlign.center,
                    index == 0
                        ? 'با ما دانایی هاتون رو ارتقاء بدین'
                        : index == 1
                            ? 'اینجا قراره ما به جای شما کتاب بخونیم \n و شما چیزای جدید یاد بگیرین'
                            : 'در سریع ترین زمان ممکن کتاب میخونی\n و حتی میتونی درآمد کسب کنی ',
                    style: const TextStyle(
                      fontSize: 15.0,
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

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      isShowSkipBtn: false,

      key: UniqueKey(),

      // Prev button
      renderPrevBtn: renderPrevBtn(),
      prevButtonStyle: myButtonStyle1(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle2(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle3(),

      // Indicator
      indicatorConfig: const IndicatorConfig(
        colorIndicator: Color(0XFF3CA59E),
        sizeIndicator: 8,
        typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
      ),

      // Custom tabs
      listCustomTabs: generateListCustomTabs(),

      refFuncGoToTab: (refFunc) {
        goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: const AlwaysScrollableScrollPhysics(),
    );
  }
}
