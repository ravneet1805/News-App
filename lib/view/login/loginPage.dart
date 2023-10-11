import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/view/login/passReset.dart';
import 'package:newsapp/view/login/signupPage.dart';

import '../widgets/inputField.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Center(
              child: Lottie.asset('assets/images/loader.json', height: 60));
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      //showErrorMessage(e.code);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'COMET\nNews',
                      style: kLogoStyle,
                    ),
                    Image.asset(
                      'assets/images/moon.png',
                      height: 100,
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                    child: Text(
                  'Login',
                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: kTextColor,
                      fontWeight: FontWeight.w800),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Enter Your Email and Password',
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: kTextColor,
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: InputField(
                    passwordcontroller: passwordController,
                    emailcontroller: emailController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordReset(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    signIn();
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
                          'login',
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                        child: Text(
                          ' Signup',
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              color: kTextColor,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
