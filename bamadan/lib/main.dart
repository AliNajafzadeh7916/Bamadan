// mian package :
import 'package:bamadan/Screens/Navigation/Pages/my_cv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Logic/Providers/Language/language_provider.dart';
import 'Logic/Providers/Theme/theme_provider.dart';

import 'Screens/Auth/auth.dart';
import 'Screens/Auth/login.dart';
import 'Screens/Auth/register.dart';
import 'Screens/Navigation/Pages/discount.dart';
import 'Screens/Navigation/Pages/guide.dart';
import 'Screens/Navigation/Pages/info.dart';
import 'Screens/Navigation/Pages/invite.dart';
import 'Screens/Navigation/Pages/my_project.dart';
import 'Screens/Navigation/Pages/my_request.dart';
import 'Screens/Navigation/Pages/my_shelf.dart';
import 'Screens/Navigation/Pages/offers_state.dart';
import 'Screens/Navigation/Pages/support.dart';
import 'Screens/Navigation/Pages/update.dart';
import 'Screens/Navigation/Pages/wallet.dart';
import 'Screens/Navigation/add_request.dart';
import 'Screens/Navigation/home.dart';
import 'Screens/Navigation/navigation.dart';
import 'Screens/Navigation/profile.dart';
import 'Screens/Navigation/serach.dart';
import 'Screens/Side/intro.dart';

import 'Screens/Side/splash.dart';
import 'Theme/theme.dart';

// main app :
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
      return MaterialApp(
        builder: EasyLoading.init(),
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', 'IR'),
          Locale('ar', 'SA'),
        ],
        locale: languageProvider.localeMode,
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashScreen(),
          //
          "/intro": (context) => IntroScreen(),
          "/navigation": (context) => Navigation(),
          //
          "/home": (context) => HomeScreen(),
          "/search": (context) => SearchScreen(),
          //
          "/auth": (context) => AuthScreen(),
          "/login": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
          // "/adent": (context) => AdentScreen(phoneNumber: '09XXXXXXXXX'),
          //
          "/profile": (context) => ProfileScreen(),
          "/invite": (context) => InviteScreen(),
          "/discount": (context) => DiscountScreen(),
          "/update": (context) => UpdateScreen(),
          "/support": (context) => SupportScreen(),
          "/guide": (context) => GuideScreen(),
          "/info": (context) => InfoScreen(),
          //

          "/addRequest": (context) => AddRequestScreen(),
          //
          "/my_project": (context) => MyProjectScreen(),
          "/my_request": (context) => MyRequestScreen(),
          "/my_shelf": (context) => MyShelfScreen(),
          "/offers_state": (context) => OffersStateScreen(),
          "/my_cv": (context) => MyCvScreen(),
          "/wallet": (context) => WalletScreen(),
        },
      );
    });
  }
}
