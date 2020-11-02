import 'dart:ui';

import 'package:flutter/material.dart';

class TextAsset {
  static String fbShort = "f";
  static String fbLong = "facebook";
  static String linkedlnShort = "in";
  static String linkedlnLong = "Linkedln";
  static String googleShort = "G";
  static String  xBox = "XBOX";
  static String  material = "MATERIAL";
  static String  design = "Design";
  static String microsoft ="Microsoft";
  static String adobe = "Adobe";
  static String android = "anDROID";

}

class ShadowAsset {
  static List<BoxShadow> singleShadow({
    Color shadowColor,
    double dx,
    double dy,
  }) {
    return [
      BoxShadow(
          color: shadowColor ?? Colors.grey[900],
          offset: Offset(dx ?? -0.5, dy ?? 0.5)),
    ];
  }
}

class TextSpanAsset {
  static List<InlineSpan> googleTexts() {
    var fontFamily = 'JosefinSans';
    return [
      TextSpan(
          text: "G",
          style: TextStyle(
            fontSize: 86,
            fontFamily:'Poppins',
            fontWeight: FontWeight.w200,
            color: Colors.blue,
          )),
      TextSpan(
          text: "o",
          style: TextStyle(
            color: Colors.red,
            fontFamily:fontFamily,
            fontSize: 72,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: "o",
              style: TextStyle(
                fontFamily:fontFamily,
                color: Colors.yellow,
              ),
            ),
            TextSpan(
              text: "g",
              style: TextStyle(
                fontFamily:fontFamily,
                color: Colors.blueAccent,
              ),
            ),
            TextSpan(
              text: "l",
              style: TextStyle(
                fontFamily:fontFamily,

                color: Colors.green,
              ),
            ),
            TextSpan(
              text: "e",
              style: TextStyle(
                fontFamily:fontFamily,
                color: Colors.red,
              ),
            ),
          ]),
    ];
  }

  static List<InlineSpan> nestleTexts() {
    var fontFamily = 'Roboto';
    var fontWeight = FontWeight.w200;
    return [
      TextSpan(
          text: "N",
          style: TextStyle(
            fontSize: 76,
            fontFamily: fontFamily,
            letterSpacing: -5.8,
            fontWeight: fontWeight,
            color: Colors.red,
          )),
      TextSpan(
        text: "es",
        style: TextStyle(
          fontFamily: fontFamily,
          color: Colors.red,
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.overline,
          letterSpacing: -2,
          fontSize: 50,
          fontWeight: fontWeight,
        ),
      ),
      TextSpan(
        text: "tl",
        style: TextStyle(
          fontFamily: fontFamily,
          color: Colors.red,
          fontSize: 76,
          letterSpacing: -4,
          fontWeight: fontWeight,
        ),
      ),
      TextSpan(
        text: "e",
        style: TextStyle(
          fontFamily: fontFamily,
          decoration: TextDecoration.overline,
          fontSize: 53,
          fontWeight: fontWeight,
          color: Colors.red,
        ),
      ),
    ];
  }

  static List<InlineSpan> fedX() {
    return [
      TextSpan(
          text: "Fed",
          style: TextStyle(
            fontFamily:'JosefinSans',
            fontSize: 66,
            letterSpacing: -5.8,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple,
          )),
      TextSpan(
        text: "Ex",
        style: TextStyle(
          fontFamily:'JosefinSans',
          color: Colors.redAccent,
          letterSpacing: -2,
          fontSize: 66,
          fontWeight: FontWeight.w600,
        ),
      ),
    ];
  }


  static List<InlineSpan> ebayTexts() {
    return [
      TextSpan(
          text: "e",
          style: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          )),
      TextSpan(
          text: "b",
          style: TextStyle(
            fontSize: 82,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: "a",
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
            TextSpan(
              text: "y",
              style: TextStyle(
                color: Colors.lightGreen,
              ),
            ),
          ]),
    ];
  }

  static List<InlineSpan> mdiLogoTexts() {
    return [
      TextSpan(
          text: "M",
          style: TextStyle(
            fontSize: 56,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            color: Colors.blueAccent,
          )),
      TextSpan(
          text: "di",
          style: TextStyle(
            fontSize: 32,
            color: Colors.deepOrangeAccent,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w200,
          ),
          children: [
            TextSpan(
              text: "logo",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 62,
              ),
            ),
          ]),
    ];
  }
}

