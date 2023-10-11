import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/utils/constants.dart';

//import '../auth/auth_service.dart'

import '../widgets/inputField.dart';
import 'loginPage.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onTap;

  const SignupPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final usernameController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords donot match!")));
      return;
    }
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Center(
              child: Lottie.asset('assets/images/loader.json', height: 60));
        });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
                  'Signup',
                  style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: kTextColor,
                      fontWeight: FontWeight.w800),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Create your Account',
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
                      emailcontroller: emailController),
                ),
                TextFormField(
                  obscureText: passwordVisible,
                  controller: confirmController,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: kTextColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: kTextColor,
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kTextColor,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kTextColor,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    signUp();
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
                          'Signup',
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
                        'Already a member?',
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
                                  builder: (context) => const LoginPage()));
                        },
                        child: Text(
                          ' Login',
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
