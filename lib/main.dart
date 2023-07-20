import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splashScreen.dart';

import 'auth/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform
  );
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
      home: SplashScreen()
    );
  }
}


