import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';

import 'loginorRegister.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          print(snapshot);
          if(snapshot.hasData){
            return HomeScreen();
          }
          else{
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
