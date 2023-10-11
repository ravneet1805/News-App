import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/ads/ads.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/login/loginPage.dart';
import 'package:newsapp/view/login/passReset.dart';
import 'package:newsapp/view/login/signupPage.dart';
import 'package:newsapp/view/onBoard/welcome.dart';
import 'package:newsapp/view/splashScreen.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:newsapp/data/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UnityAds.init(
    gameId: (defaultTargetPlatform == TargetPlatform.android)
        ? '5410249'
        : '5410248',
    testMode: false,
    onComplete: () => print('Initialization Complete'),
    onFailed: (error, message) =>
        print('Initialization Failed: $error $message'),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comet News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen(),
      initialRoute: '/splash', //isLoggedIn ? '/home' : '/splash',
      routes: {
        '/onboard': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/ads': (context) => const BannerAd(),
        '/signup': (context) => const SignupPage(),
        '/login': (context) => const LoginPage(),
        '/reset': (context) => const PasswordReset(),
        '/ad': (context) => const BannerAd(),
      },
    );
  }
}
