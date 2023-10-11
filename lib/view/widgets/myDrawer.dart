import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  Future<void> signOut(BuildContext context) async {
  showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Center(
              child: Lottie.asset('assets/images/loader.json', height: 60));
        });

  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}


  @override
  Widget build(BuildContext context) {
    print(
      user.email?.split("@")[0],
    );
    return Drawer(
      child: Container(
        color: kSecondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 41, 40, 40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        (user.email?.split("@")[0]).toString(),
                        style: GoogleFonts.raleway(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        user.email.toString(),
                        style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: kTextColor),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: kTextColor),
                    title: const Text("Logout"),
                    onTap: () {
                      signOut(context);
                    },
                  ),
                  // Add more items here if needed
                ],
              ),
            ),
            ListTile(
              //leading: const Icon(Icons.mail_rounded, color: kTextColor),
              title: const Text("Contact Us"),
              subtitle: Text(
                "codecrew061@gmail.com",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              // onTap: () {
              //   signOut(context);
              // },
            ),
          ],
        ),
      ),
    );
  }
}
