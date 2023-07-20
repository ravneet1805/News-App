import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//---------------------------C O L O R S----------------------

const Color kPrimaryColor = Color(0xffDDE6ED);
const Color kSecondaryColor = Color(0xff27374D);
const Color kContainerColor = Color(0xff9DB2BF);



//--------------------------S T Y L E S-----------------------

TextStyle kHeadingStyle = GoogleFonts.playfairDisplay(
     fontSize:24,
     fontWeight: FontWeight.w800
);

TextStyle kDescriptionStyle = GoogleFonts.inconsolata(
    fontSize:24,
    fontWeight: FontWeight.w800
);

TextStyle kLogoStyle = GoogleFonts.bebasNeue(
    fontSize:52,
    fontWeight: FontWeight.w600,
  color: kContainerColor

);