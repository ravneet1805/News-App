import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback toggle;
  CustomButton({Key? key, required this.text, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: toggle,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        // style: ButtonStyle(
        //   backgroundColor: Colors.yellowAccent
        // ),
      ),
    );
  }
}
