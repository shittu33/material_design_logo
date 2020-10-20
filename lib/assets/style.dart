import 'package:flutter/material.dart';
class FbStyle {
   static Color appIconColor = Colors.cyan[900];
   static Color accent = Colors.blue[500];
   static Color white = Colors.white;
   static Color logo = Colors.blue[600];
   static Color logo2 = Colors.blue[300];
   static Color logo3 = Colors.blue[400];
   static Color logo4 = Colors.blue[500];
   static Color logo5 = Colors.blue[600];
   static Color logo6 = Colors.blue[700];
   static Color logo7 = Colors.blue[700];
   static Color logo8 = Colors.blue[800];
   static Color red = Colors.redAccent.shade400;
  static Color iconGrey = Colors.grey[600];
//  static Color iconGrey = Colors.grey[600];
  static Color iconBlack = Colors.black;
}

LinearGradient faceBookGradient() {
   return LinearGradient(colors: [
      Colors.blue.shade200,
      Colors.blue.shade300,
      FbStyle.logo2,
      FbStyle.logo3,
      FbStyle.logo4,
      FbStyle.logo5,
      FbStyle.logo6
   ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}