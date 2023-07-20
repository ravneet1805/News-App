import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  void signOut(){
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    print(user.email?.split("@")[0],);
    return Drawer(
      child: Container(
        color: kContainerColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kSecondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      (user.email?.split("@")[0]).toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 24),
                  ),
                  Text(
                    user.email.toString(),
                    style: TextStyle(color: kContainerColor),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: kSecondaryColor),
              title: Text("Home"),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: kSecondaryColor),
              title: Text("Settings"),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: kSecondaryColor),
              title: Text("Logout"),
              onTap: () {
               signOut();

              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
