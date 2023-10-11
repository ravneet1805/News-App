import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//---------------------------C O L O R S----------------------

const Color kPrimaryColor = Color(0xffDDE6ED);
const Color kSecondaryColor = Color(0xffF1F0E8);
const Color kContainerColor = Color(0xff9DB2BF);
const Color kTextColor = Colors.black;

//--------------------------S T Y L E S-----------------------

TextStyle kHeadingStyle = GoogleFonts.robotoMono(
    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500);

TextStyle kSubHeadStyle = GoogleFonts.overlock(
    fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900);

TextStyle kSubHeadLStyle = GoogleFonts.raleway(
    fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900);

TextStyle kDescriptionStyle =
    GoogleFonts.martel(fontSize: 12, color: Colors.black54);

TextStyle kCardDescriptionStyle =
    GoogleFonts.martel(fontSize: 16, color: Colors.black87);

TextStyle kLogoStyle = GoogleFonts.adventPro(
    fontSize: 60, fontWeight: FontWeight.w900, color: Colors.black);

TextStyle kSubLogoStyle = GoogleFonts.robotoCondensed(
    fontSize: 16,
    height: 0.5,
    //fontWeight: FontWeight.w900,
    color: Colors.black54);

TextStyle kLabelStyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle kUnselectedLabelStyle = GoogleFonts.adventPro(
  fontSize: 16,
);
