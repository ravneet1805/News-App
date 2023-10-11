import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/view/login/signupPage.dart';
import 'package:newsapp/view/onBoard/widget/fade_comet.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function()? onTap;
  const WelcomeScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 50,),
            const FadeComet(),
            Text(
              'Your Cosmic Connection\n to the Latest Headlines.',
              style: GoogleFonts.raleway(
                  fontSize: 26,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                  (route) => false, // This line clears the existing route stack
                );
              },
              child: Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                      child: Text(
                    'Continue',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'By continuing you agree to ',
                  style: GoogleFonts.cabin(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'CometNews\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Privacy Policy and Terms & Conditions',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
