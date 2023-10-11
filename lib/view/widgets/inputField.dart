import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class InputField extends StatefulWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  const InputField(
      {Key? key,
      required this.passwordcontroller,
      required this.emailcontroller})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.emailcontroller,
          decoration: InputDecoration(
            hintText: 'Email',
            fillColor: Colors.transparent,
            filled: true,
            prefixIcon: const Icon(
              Icons.email,
              color: kTextColor,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextFormField(
            controller: widget.passwordcontroller,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              fillColor: Colors.transparent,
              filled: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: kTextColor,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility),
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
        ),
      ],
    );
  }
}
