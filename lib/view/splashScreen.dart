import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/auth/mainPage.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 1500,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Lottie.asset('assets/images/astromoon.json')),
            const SizedBox(
              height: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "COMET",
                  style: kLogoStyle,
                ),
                Text(
                  "NEWS",
                  style: kSubLogoStyle,
                ),
              ],
            ),
          ],
        ),
        nextScreen: const MainPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: kSecondaryColor);
  }
}
