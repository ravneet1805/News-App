import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class FadeComet extends StatelessWidget {
  const FadeComet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: kSecondaryColor, // Background color
        ),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, kSecondaryColor, Colors.transparent],
              stops: [0.0, 0.5, 1.0], // Adjust the stops as needed
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Column(
            children: [
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black12,
                          fontWeight: FontWeight.w900))),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black26,
                          fontWeight: FontWeight.w900))),
              Transform(
                alignment: Alignment.topCenter, // Shrink from the top
                transform: Matrix4.identity()
                  ..scale(1.0, 0.8), // Adjust the scale factor as needed
                child: Text(
                  'COMET',
                  style: GoogleFonts.archivoBlack(
                    height: 0.9,
                    fontSize: 65,
                    color: Colors.black38,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black,
                          fontWeight: FontWeight.w900))),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black45,
                          fontWeight: FontWeight.w900))),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black38,
                          fontWeight: FontWeight.w900))),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black26,
                          fontWeight: FontWeight.w900))),
              Transform(
                  alignment: Alignment.topCenter, // Shrink from the top
                  transform: Matrix4.identity()
                    ..scale(1.0, 0.8), // Adjust the scale factor as needed
                  child: Text('COMET',
                      style: GoogleFonts.archivoBlack(
                          height: 0.9,
                          fontSize: 65,
                          color: Colors.black12,
                          fontWeight: FontWeight.w900))),
            ],
          ),
        ));
  }
}
