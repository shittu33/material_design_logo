library materialdesignlogo;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:materialdesignlogo/assets/style.dart';
import 'package:materialdesignlogo/basic.dart';
import 'package:materialdesignlogo/widget_type.dart';
import 'assets/strings.dart';

class MdiLogo extends StatelessWidget {
  MdiLogo.plainText({
    this.fontSize,
    this.fontColor,
    this.text,
    this.textStyle,
    this.textSpans,
    this.letterSpacing,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.padding,
    this.textShadows,
    this.textAlign,
    PlainText textData,
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null,
        logo = textData ??
            PlainText(
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                textShadows: textShadows,
                text: text,
                textStyle: textStyle,
                textAlign: textAlign,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontColor: fontColor,
                fontStyle: fontStyle,
                textSpan: textSpans,
                padding: padding),
        plainLogo = true,
        width = null,
        widget = null,
        height = null,
        fullText = false,
        logoGradient = null,
        logoShape = null,
        decoration = null,
        shapeRadius = null,
        borderColor = null,
        borderWidth = null,
        shapeColor = null,
        shapeShadow = null;

  MdiLogo.shapedTextLogo({
    this.height,
    this.width,
    this.fontColor,
    this.logoGradient,
    this.text,
    this.textStyle,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.textShadows,
    this.logoShape,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.textSpans,
    this.borderWidth,
    this.shapeShadow,
    this.fontSize,
    this.letterSpacing,
    this.textAlign,
    this.padding,
    this.shapeColor,
    this.textHeight,
    TextShapeLogo textShapeData,
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        logo = textShapeData ??
            TextShapeLogo(
              height,
              width,
              textHeight,
              decoration,
              logoShape,
              shapeRadius,
              borderColor,
              shapeColor,
              borderWidth,
              logoGradient,
              shapeShadow ??
                  [
                    BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
                  ],
              PlainText(
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                textShadows: textShadows,
                text: text,
                textStyle: textStyle,
                textAlign: textAlign,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontColor: fontColor,
                fontStyle: fontStyle,
                textSpan: textSpans,
                padding: padding ??
                    (isCircle(logoShape) && text.length > 2
                        ? EdgeInsets.all(16)
                        : EdgeInsets.zero),
              ),
            ),
        widget = null,
        fullText = false,
        plainLogo = false;

  MdiLogo.shapeWidget({
    this.height,
    this.width,
    this.logoGradient,
    this.logoShape: BoxShape.circle,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.borderWidth,
    this.shapeShadow,
    this.padding,
    this.widget,
    this.shapeColor,
  })  : logo = WidgetShapeLogo(
            widget,
            height,
            width,
            padding,
            decoration,
            shapeRadius ?? BorderRadius.circular(5),
            borderColor,
            shapeColor,
            borderWidth,
            logoGradient,
            shapeShadow ?? ShadowAsset.singleShadow(),
            logoShape),
        plainLogo = false,
        text = null,
        this.textHeight = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textSpans = null,
        this.textStyle = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.fullText = false,
        this.fontFamily = null,
        this.textShadows = null,
        this.fontSize = null,
        this.letterSpacing = null,
        this.textAlign = null,
        fontColor = null;

  MdiLogo.shapedIconLogo({
    this.logoGradient,
    this.logoShape: BoxShape.rectangle,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.borderWidth,
    this.shapeShadow,
    this.padding,
    this.shapeColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    IconShapeLogo logoData,
  })  : logo = logoData ??
            IconShapeLogo(
                icon: icon ?? MdiIcons.whatsapp,
                iconColor: iconColor,
                iconSize: iconSize,
                padding: padding,
                decoration: decoration,
                shapeRadius: shapeRadius ?? BorderRadius.circular(10),
                borderColor: borderColor,
                shapeColor: shapeColor,
                borderWidth: borderWidth,
                shapeGradient: logoGradient,
                shapeShadow: shapeShadow ??
                    [
                      BoxShadow(
                          color: Colors.grey[700], offset: Offset(-1.5, 2)),
                    ],
                shape: logoShape),
        plainLogo = false,
        text = null,
        this.textSpans = null,
        this.textStyle = null,
        this.textHeight = null,
        this.width = null,
        this.height = null,
        this.fontWeight = null,
        this.widget = null,
        this.fontStyle = null,
        this.fullText = false,
        this.fontFamily = null,
        this.textShadows = null,
        this.fontSize = null,
        this.letterSpacing = null,
        this.textAlign = null,
        fontColor = null;

  ///This is a static MdiLogo function that receives Strings of [text], and map of
  /// of text properties to provide unique style, specify different properties
  /// and shapes for each letter of the text
  ///
  /// Consider this example of BBC logo, where each letter is shaped with a rectanglar,
  /// box, and each text has the same [fontColor],[fontSize], and [shapeColor]
  ///
  /// ```dart
  ///   Center(
  ///      child: Container(
  ///          width: 230,
  ///          child: MdiLogo.autoShapeText(
  ///            text: 'BBC',
  ///            fontColor: {'BBC':Colors.white},
  ///            shapeColor: {'BBC':Colors.black},
  ///            fontSize: {'BBC': 34.0, },
  ///         )),
  ///    ),
  /// ```
  ///
  /// Consider another specification where we have to specify a unique
  /// [logoShape], [fontColor],[fontSize], and [shapeColor] for each letter
  /// in the given text,
  ///
  /// ```dart
  ///   Center(
  ///      child: Container(
  ///          width: 230,
  ///          child: MdiLogo.autoShapeText(
  ///            text: 'BBC',
  ///            //let's use the combination of letters and index to
  ///            // differentiate between the first B and the second B
  ///            //the 'B' represent the first B in the text and '1'
  ///            //represent the index of the second 'B'
  ///            fontColor: {'B':Colors.white,1:Colors.green,'C':Colors.pinkAccent},
  ///            shapeColor: {'B':Colors.black,1:Colors.yellow,'C':Colors.blue},
  ///            fontSize: {'B': 24.0,1: 24.0,'C': 24.0, },
  ///         )),
  ///    ),
  /// ```
  ///
  static Widget multiShapedTextLogo({
    String text: 'TEXT',

    /// How much space to place between children in a run in the main axis.
    double letterSpacing: 2.0,

    /// How much space to place between the runs themselves in the cross axis.
    ///
    /// For example, if [runSpacing] is 10.0, the runs will be spaced at least
    /// 10.0 logical pixels apart in the cross axis.
    double runSpacing: 1.0,
    WrapAlignment alignment: WrapAlignment.center,
    Map<dynamic, TextStyle> textStyle,
    Map<dynamic, double> height,
    Map<dynamic, double> width,
    Map<dynamic, double> textHeight,
    Map<dynamic, double> fontSize,
    Map<dynamic, Color> fontColor,
    Map<dynamic, double> spanLetterSpacing,
    Map<dynamic, Gradient> logoGradient,
    Map<dynamic, FontWeight> fontWeight,
    Map<dynamic, FontStyle> fontStyle,
    Map<dynamic, String> fontFamily,
    Map<dynamic, List<Shadow>> textShadows,
    Map<dynamic, BoxShape> logoShape,
    Map<dynamic, BoxDecoration> decoration,
    Map<dynamic, BorderRadius> shapeRadius,
    Map<dynamic, Color> borderColor,
    Map<dynamic, double> borderWidth,
    Map<dynamic, List<BoxShadow>> shapeShadow,
    Map<dynamic, Color> shapeColor,
  }) {
    height = height.splitKeysToIndexes(text);
    width = width.splitKeysToIndexes(text);
    textHeight = textHeight.splitKeysToIndexes(text);
    textStyle = textStyle.splitKeysToIndexes(text);
    fontSize = fontSize.splitKeysToIndexes(text);
    fontColor = fontColor.splitKeysToIndexes(text);
    spanLetterSpacing = spanLetterSpacing.splitKeysToIndexes(text);
    logoGradient = logoGradient.splitKeysToIndexes(text);
    fontWeight = fontWeight.splitKeysToIndexes(text);
    fontStyle = fontStyle.splitKeysToIndexes(text);
    fontFamily = fontFamily.splitKeysToIndexes(text);
    textShadows = textShadows.splitKeysToIndexes(text);
    logoShape = logoShape.splitKeysToIndexes(text);
    decoration = decoration.splitKeysToIndexes(text);
    shapeRadius = shapeRadius.splitKeysToIndexes(text);
    borderColor = borderColor.splitKeysToIndexes(text);
    borderWidth = borderWidth.splitKeysToIndexes(text);
    shapeShadow = shapeShadow.splitKeysToIndexes(text);
    shapeColor = shapeColor.splitKeysToIndexes(text);
    return Wrap(
      spacing: letterSpacing,
      runSpacing: runSpacing,
      alignment: alignment,
      children: [
        for (int i = 0; i < text.length; i++)
          MdiLogo.shapedTextLogo(
            height: height[i],
            width: width[i],
            textHeight: textHeight[i],
            fontColor: fontColor[i],
            logoGradient: logoGradient[i],
            textStyle: textStyle[i],
            letterSpacing: spanLetterSpacing[i],
            fontWeight: fontWeight[i],
            fontStyle: fontStyle[i],
            fontFamily: fontFamily[i],
            textShadows: textShadows[i],
            logoShape: logoShape[i] ?? BoxShape.rectangle,
            decoration: decoration[i],
            shapeRadius: shapeRadius[i],
            borderColor: borderColor[i],
            borderWidth: borderWidth[i],
            shapeShadow: shapeShadow[i] ?? ShadowAsset.singleShadow(),
            text: text[i],
            fontSize: fontSize[i],
            shapeColor: shapeColor[i] ?? Colors.grey[800],
          ),
      ],
    );
  }

  ///This is a static helper function that receives Strings of [text], and map of
  /// text properties to provide unique style and specify different properties
  /// for each letter of the text like [Text.rich()] constructor,but in a simpler way.
  ///
  ///
  static Widget richTextLogo<T>({
    String text: 'TEXT',
    double letterSpacing,
    TextAlign textAlign,
    Map<dynamic, double> spanLetterSpacing,
    Map<dynamic, double> decorationThickness,
    Map<dynamic, double> textHeight,
    Map<dynamic, TextStyle> textStyle,
    Map<dynamic, double> fontSize,
    Map<dynamic, Color> fontColor,
    Map<dynamic, FontWeight> fontWeight,
    Map<dynamic, FontStyle> fontStyle,
    Map<dynamic, String> fontFamily,
    Map<dynamic, TextDecoration> textDecoration,
    Map<dynamic, TextDecorationStyle> textDecorationStyle,
    Map<dynamic, List<Shadow>> textShadows,
  }) {
    decorationThickness = decorationThickness.splitKeysToIndexes(text);
    textHeight = textHeight.splitKeysToIndexes(text);
    spanLetterSpacing = spanLetterSpacing.splitKeysToIndexes(text);
    textStyle = textStyle.splitKeysToIndexes(text);
    fontSize = fontSize.splitKeysToIndexes(text);
    fontColor = fontColor.splitKeysToIndexes(text);
    fontWeight = fontWeight.splitKeysToIndexes(text);
    fontStyle = fontStyle.splitKeysToIndexes(text);
    fontFamily = fontFamily.splitKeysToIndexes(text);
    textShadows = textShadows.splitKeysToIndexes(text);
    textDecoration = textDecoration.splitKeysToIndexes(text);
    textDecorationStyle = textDecorationStyle.splitKeysToIndexes(text);
    return MdiLogo.plainText(
      textAlign: textAlign,
      letterSpacing: letterSpacing,
      textSpans: [
        for (int i = 0; i < text.length; i++)
          TextSpan(
            text: text[i],
            style: textStyle[i] ??
                TextStyle(
                  height: textHeight[i],
                  decorationThickness: decorationThickness[i],
                  decorationStyle: textDecorationStyle[i],
                  decoration: textDecoration[i],
                  letterSpacing: spanLetterSpacing[i],
                  fontSize: fontSize[i],
                  color: fontColor[i],
                  fontWeight: fontWeight[i],
                  fontStyle: fontStyle[i],
                  fontFamily: fontFamily[i],
                  shadows: textShadows[i],
                ),
          )
      ],
    );
  }

  static Widget fedX({
    String text: "FedEx",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<String, List<Shadow>> textShadows,
  }) {
    var firstPart = 0.to(3);
    var secondPart = 3.to(5);
    return richTextLogo(
      textAlign: textAlign,

      ///Here we create a map of key text index and value of
      ///spanLetterSpacing,and use  extension  function 'to' and operator[]  to
      /// to define the range of letter indexes all extension functions and operators
      /// are decleared declared below this [materialdesignlogo] file
      ///With default text: 'FedEx', spanLetterSpacing value is the same thing as
      ///```dart
      ///         spanLetterSpacing: spanLetterSpacing ?? {'Fed' : -5.8, 'Ex': -2},
      /// ```
      spanLetterSpacing:
          spanLetterSpacing ?? {firstPart: -5.8, secondPart: -2.0},
      text: text,
      textStyle: textStyle,

      /// Here we use the extension unary operator '~' declared below this [materialdesignlogo]
      /// file to map each letter with the same value '40.0'
      ///With default text: 'FedEx', fontSize value is the same thing as
      ///```dart
      ///         fontSize: fontSize ?? {'FedEx' : 40,},
      /// ```
      fontSize: fontSize ?? ~40.0,
      fontColor:
          fontColor ?? {firstPart: Colors.deepPurple, secondPart: Colors.red},
      fontWeight: fontWeight ?? ~FontWeight.w600,
      fontStyle: fontStyle,
      fontFamily: fontFamily ?? ~'JosefinSans',
      textShadows: textShadows ?? ~ShadowAsset.singleShadow(),
    );
  }

  static Widget bbc({
    String text: "BBC",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, Color> shapeColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<String, List<Shadow>> textShadows,
  })=>multiShapedTextLogo(
     text: text??"BBC",
     letterSpacing:letterSpacing,
     spanLetterSpacing:spanLetterSpacing,
     textStyle:textStyle,
     fontSize:fontSize??~34.0,
     fontColor:fontColor?? ~Colors.white,
     fontWeight:fontWeight,
     fontStyle:fontStyle,
     fontFamily:fontFamily,
    shapeColor: shapeColor??~Colors.black,
     textShadows:textShadows,
  );
  static Widget mdiLogoText({
    String text: "MdiLogo",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<String, List<Shadow>> textShadows,
  }) {
    var firstPart = 0.to(3);
    var secondPart = 3.to(6);
    return richTextLogo(
      textAlign: textAlign,
      spanLetterSpacing:
          spanLetterSpacing ?? {firstPart: -3.8, secondPart: -2.0},
      text: text,
      textStyle: textStyle,
      fontSize: fontSize ?? {firstPart: 60.0, secondPart: 70},
      fontColor:
          fontColor ?? {firstPart: Colors.deepPurple, secondPart: Colors.red},
      fontWeight: fontWeight ?? ~FontWeight.w600,
      fontStyle: fontStyle,
      fontFamily: fontFamily ?? ~'Piedra',
      textShadows: textShadows ?? ~ShadowAsset.singleShadow(),
    );
  }

  static Widget nestle({
    String text: "Nestle",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<dynamic, TextDecoration> textDecoration,
    Map<dynamic, TextDecorationStyle> textDecorationStyle,
    Map<String, List<Shadow>> textShadows,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      text: text,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: textDecoration ??
          {
            [1, 2, lastIndex]: TextDecoration.overline
          },
      fontColor: fontColor ?? ~Colors.red,
      fontWeight: fontWeight ?? ~FontWeight.w400,
      fontFamily: fontFamily ?? ~'Roboto',
      fontSize: fontSize ??
          {
            [0, 3, 4]: 76.0,
            1.to(2): 57,
            lastIndex: 58
          },
      spanLetterSpacing: spanLetterSpacing ?? {0: -8.4, 1.to(2): -4.0, 4: -9},
    );
  }

  static Widget nescafe({
    String text: "Nescafe",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<dynamic, TextDecoration> textDecoration,
    Map<dynamic, TextDecorationStyle> textDecorationStyle,
    Map<String, List<Shadow>> textShadows,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      text: text,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: textDecoration ??
          {'escaf': TextDecoration.overline, lastIndex: TextDecoration.none},
      fontColor: fontColor ?? ~Colors.black,
      fontWeight: fontWeight ?? ~FontWeight.w400,
      fontFamily: fontFamily ?? ~'Roboto',
      fontSize: fontSize ??
          {
            [0]: 76.0,
            1.to(5): 57,
            lastIndex: 58
          },
      spanLetterSpacing: spanLetterSpacing ?? {0: -8.8, 1.to(5): -4.0, 6: -8},
    );
  }


  static Widget ferrari({
    String text: "Ferrari",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<dynamic, TextDecoration> textDecoration,
    Map<dynamic, TextDecorationStyle> textDecorationStyle,
    Map<String, List<Shadow>> textShadows,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      text: text,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: textDecoration ??
          {'errari': TextDecoration.overline,},
      decorationThickness: ~2.2,
      fontColor: fontColor ?? ~Colors.black,
      fontWeight: fontWeight ?? ~FontWeight.w200 &{'errari':FontWeight.w300},
      fontFamily: fontFamily ?? ~'Roboto',
      fontSize: fontSize ??
          {
            [0]: 76.0,
            1.to(lastIndex): 55.4,
          },
      spanLetterSpacing: spanLetterSpacing ?? {0: -8.8, 1.to(5): -4.0, 6: -8},
    );
  }

  static Widget ebay({
    String text: "ebay",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<String, List<Shadow>> textShadows,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      textAlign: textAlign ?? TextAlign.center,
      text: text,
      letterSpacing: letterSpacing ?? -5,
      fontColor: fontColor ??
          {
            0: Colors.red,
            1: Colors.blueAccent,
            2: Colors.yellow,
            3: Colors.lightGreen,
          },
      textShadows: ~ShadowAsset.singleShadow(),
      fontWeight:
          fontWeight ?? {0: FontWeight.w500, 1.to(lastIndex): FontWeight.w600},
      fontSize: fontSize ?? {0: 96, 1.to(lastIndex): 82.0},
    );
  }

  static Widget google({
    String text: "Google",
    double letterSpacing,
    TextAlign textAlign,
    Map<String, double> spanLetterSpacing,
    Map<String, TextStyle> textStyle,
    Map<String, double> fontSize,
    Map<String, Color> fontColor,
    Map<String, FontWeight> fontWeight,
    Map<String, FontStyle> fontStyle,
    Map<String, String> fontFamily,
    Map<String, List<Shadow>> textShadows,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      textAlign: textAlign ?? TextAlign.center,
      text: text,
      letterSpacing: letterSpacing ?? -4,
      textShadows: ~ShadowAsset.singleShadow(),
      fontColor: fontColor ??
          {
            0: Colors.blueAccent,
            1: Colors.red,
            2: Colors.yellow,
            3: Colors.blueAccent,
            4: Colors.green,
            5: Colors.red,
          },
      fontFamily: fontFamily ?? {0: 'JosefinSans', 1.to(5): 'JosefinSans'},
      fontWeight:
          fontWeight ?? {0: FontWeight.w400, 1.to(lastIndex): FontWeight.w500},
      fontSize: fontSize ?? {0: 86, 1.to(lastIndex): 72.0},
    );
  }

  static MdiLogo netflix({
    double fontSize,
    fontColor,
    double letterSpacing,
    fontWeight,
    textShadows,
    PlainText textData,
  }) =>
      textData ??
      MdiLogo.plainText(
        fontSize: fontSize ?? 66,
        fontColor: fontColor ?? Colors.redAccent,
        text: 'NETFLIX',
        letterSpacing: letterSpacing ?? 3.8,
        fontWeight: fontWeight ?? FontWeight.w800,
        fontFamily: 'JosefinSans',
        textShadows: textShadows ?? ShadowAsset.singleShadow(),
      );


  static MdiLogo facebook({
    bool plainLogo: false,
    double fontSize,
    fontColor,
    double letterSpacing,
    textShadows,
    logoShape: BoxShape.rectangle,
    fullText: false,
    borderColor,
    double borderWidth,
    shapeShadow,
    shapeColor,
    PlainText textData,
    TextShapeLogo textShapeData,
  }) {
    var inferTextSize = TextShapeLogo.calculateTextSize(
        fontSize, null, null, isCircle(logoShape));
    return plainLogo
        ? MdiLogo.plainText(
            textData: textData,
            fontSize: fontSize,
            fontColor: fontColor,
            text: TextAsset.fbLong,
            letterSpacing: letterSpacing,
            textShadows: textShadows ?? ShadowAsset.singleShadow(),
          )
        : textShapeData ??
            MdiLogo.shapedTextLogo(
              textHeight: (isCircle(logoShape) ? 0.001 : null),
              fontColor: fontColor,
              logoGradient: null,
              textShadows: textShadows,
              logoShape: logoShape,
              shapeRadius: BorderRadius.circular(10),
              borderColor: borderColor,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.singleShadow(),
              text: (isCircle(logoShape) || !fullText
                  ? TextAsset.fbShort
                  : TextAsset.fbLong),
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              padding: (isCircle(logoShape)
                  ? EdgeInsets.only(top: inferTextSize - 2, left: 2)
                  : EdgeInsets.only(top: inferTextSize * 0.08)),
              shapeColor: shapeColor,
            );
  }

  static MdiLogo linkedln({
    plainLogo: false,
    double fontSize,
    fontColor,
    double letterSpacing,
    textShadows,
    logoShape: BoxShape.rectangle,
    fullText: false,
    borderColor,
    double borderWidth,
    shapeShadow,
    shapeColor,
    PlainText textData,
    TextShapeLogo textShapeData,
  }) =>
      textData ?? plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: TextAsset.linkedlnLong,
              letterSpacing: letterSpacing,
              textShadows: textShadows ?? ShadowAsset.singleShadow(),
            )
          : MdiLogo.shapedTextLogo(
              fontColor: fontColor,
              logoGradient: null,
              textShadows: textShadows,
              logoShape: logoShape,
              shapeRadius: BorderRadius.circular(10),
              borderColor: borderColor,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.singleShadow(),
              text: (isCircle(logoShape) || !fullText
                  ? TextAsset.linkedlnShort
                  : TextAsset.linkedlnLong),
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              shapeColor: shapeColor,
            );

  static MdiLogo cocacola({
    double fontSize,
    fontColor,
    double letterSpacing,
    fontWeight,
    textShadows,
    PlainText textData,
  }) =>
      textData ??
      MdiLogo.plainText(
        fontSize: fontSize,
        fontColor: fontColor,
        text: 'Coca.Cola',
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontFamily: 'cocacola',
        textShadows: textShadows ?? ShadowAsset.singleShadow(),
      );

  static MdiLogo whatsApp(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.whatsapp,
          shapeColor: Colors.green,
          logoData: logoData);

  static MdiLogo instagram(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.instagram,
          shapeColor: Colors.pinkAccent,
          logoData: logoData);

  static MdiLogo twitter(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.twitter,
          shapeColor: Colors.blueAccent,
          logoData: logoData);

  static MdiLogo microsoftWindows(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.microsoftWindowsClassic,
          shapeColor: Colors.blueAccent,
          logoData: logoData);

  static MdiLogo snapChat(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.snapchat,
          shapeColor: Colors.amber,
          logoData: logoData);

  static MdiLogo apple(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.black,
          icon: MdiIcons.apple,
          logoData: logoData);

  static MdiLogo android(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.green.shade400,
          icon: MdiIcons.android,
          logoData: logoData);

  static MdiLogo youtube(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.red,
          icon: MdiIcons.youtube,
          logoData: logoData);

  static MdiLogo yahoo(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.yahoo,
          logoData: logoData);

  static MdiLogo googleChrome(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.googleChrome,
          logoData: logoData);

  static MdiLogo googleDrive(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoGradient: MdiStyle.mix2GradientSample(
              start: Colors.yellow, end: Colors.blue),
          logoShape: shape,
          iconColor: Colors.indigo,
          icon: MdiIcons.googleDrive,
          logoData: logoData);

  static MdiLogo googleMaps(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.googleMaps,
          logoData: logoData);

  static MdiLogo github(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.black,
          icon: MdiIcons.github,
          logoData: logoData);

  static MdiLogo gitlab(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.gitlab,
          logoData: logoData);

  static MdiLogo facebookMessenger(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.facebookMessenger,
          logoData: logoData);

  static MdiLogo weChat(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.wechat,
          logoData: logoData);

  static MdiLogo wordPress(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.wordpress,
          logoData: logoData);

  static MdiLogo email(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.red,
          borderColor: Colors.red,
          shapeColor: Colors.white,
          icon: MdiIcons.email,
          logoData: logoData);

  static MdiLogo safari(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.green,
          borderColor: Colors.green,
          shapeColor: Colors.white,
          icon: MdiIcons.appleSafari,
          logoData: logoData);

  static MdiLogo abjadArabic(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.red,
          borderColor: Colors.red,
          shapeColor: Colors.white,
          icon: MdiIcons.abjadArabic,
          logoData: logoData);

  static MdiLogo scriptText(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.scriptText,
          logoData: logoData);

  static MdiLogo ubuntu(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.ubuntu,
          logoData: logoData);

//x360,
  static MdiLogo oralB(
          {BoxShape shape, double borderWidth, IconShapeLogo logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.black,
          icon: MdiIcons.apple,
          logoData: logoData);

  static Widget combinedLogo({
    LeadGravity leadGravity,
    EdgeInsetsGeometry padding,
    Widget lead,
    Widget content,
    double gap,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) =>
      CombinedLogo(
        leadGravity,
        padding,
        lead,
        content,
        gap: gap,
        mainAxisAlignment: mainAxisAlignment,
      );

  static Widget microsoftXBox(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
                fontFamily: 'x360',
                text: TextAsset.xBox,
                fontSize: 43,
                textShadows: ShadowAsset.singleShadow(
                    shadowColor: Colors.grey[700], dx: -1, dy: 1.4),
                fontWeight: FontWeight.w400,
                fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              icon: MdiIcons.microsoftXbox,
              iconColor: Colors.white,
              shapeColor: Colors.green,
            ),
      );

  static Widget microsoftCombined(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
                fontSize: 30,
                textShadows: ShadowAsset.singleShadow(
                    shadowColor: Colors.grey[700], dx: -1, dy: 1),
                text: TextAsset.microsoft,
                fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              icon: MdiIcons.microsoftWindowsClassic,
              iconColor: Colors.green,
              shapeColor: Colors.white,
            ),
      );

  static Widget adobe(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.top,
        content: content ??
            MdiLogo.plainText(text: TextAsset.adobe, fontColor: Colors.black),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              icon: MdiIcons.adobe,
              iconColor: Colors.red,
              shapeColor: Colors.white,
              iconSize: 53,
            ),
      );

  static Widget androidCombine(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap ?? 0,
        leadGravity: LeadGravity.top,
        content: content ??
            MdiLogo.plainText(
              textShadows: ShadowAsset.singleShadow(),
              text: 'ANDROID',
              fontColor: Colors.white,
              fontFamily: 'Droid',
            ),
        lead: lead ??
            Icon(
              MdiIcons.android,
              color: Colors.green,
              size: 53,
            ),
      );

  static Widget mdiLogo(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
              textAlign: TextAlign.start,
              textSpans: TextSpanAsset.mdiLogoTexts(),
            ),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              icon: MdiIcons.materialDesign,
              shapeColor: Colors.pink,
              borderWidth: 1,
              logoShape: BoxShape.rectangle,
              shapeRadius: BorderRadius.circular(8),
              shapeShadow: [
                BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
              ],
            ),
      );

  static Widget linkedlnCombine(
          {MdiLogo content,
          MdiLogo lead,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          double gap,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.end,
        content: content ??
            MdiLogo.plainText(
              text: 'Linked',
              fontSize: 43,
              fontColor: Colors.black,
            ),
        lead: lead ??
            MdiLogo.linkedln(
              fontSize: 37,
              plainLogo: false,
              borderWidth: 1,
            ),
      );

  static Widget facebookCombine(
          {MdiLogo content,
          MdiLogo lead,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          double gap,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.facebook(plainLogo: true, fontColor: Colors.black),
        lead: lead ??
            MdiLogo.facebook(
fontSize: 45,
              plainLogo: false,
              borderWidth: 1,
            ),
      );

  static Widget instagramCombine(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
              fontColor: Colors.black,
              fontWeight: FontWeight.w200,
              fontSize: 43,
              fontFamily: 'Billabong',
              fontStyle: FontStyle.normal,
              text: "Instagram",
              textShadows: ShadowAsset.singleShadow(),
              textAlign: TextAlign.center,
            ).padOnly(top: 18),
        lead: lead ?? MdiLogo.instagram(),
      );

  static Widget combineMdiSample(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.combinedLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.start,
        content: content ??
            combinePlainTextSample(
              decorationThickness: 1.2,
            ).padOnly(top: 0),
        lead: lead ?? combineTextShapeSample(),
      );

  static MdiLogo combinePlainTextSample({
    text: 'Design',
    List<Shadow> textShadows,
    double fontSize: 28.0,
    double height: 2.0,
    double letterSpacing: -2,
    fontFamily: 'JosefinSans',
    fontWeight: FontWeight.w500,
    fontColor,
    textDecorationStyle: TextDecorationStyle.double,
    decorationThickness: 1.0,
    textDecoration: TextDecoration.underline,
  }) {
    final textColor = fontColor ?? Colors.grey[900];
    return MdiLogo.plainText(
      text: text,
      textStyle: TextStyle(
        height: height,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        decoration: textDecoration,
//        shadows:
//            textShadows ?? ShadowAsset.singleShadow(shadowColor: Colors.black,dx:-2,dy:4),
        decorationThickness: decorationThickness,
        fontWeight: fontWeight,
        decorationStyle: textDecorationStyle,
        decorationColor: textColor,
        color: textColor,
      ),
    );
  }

  static MdiLogo combineTextShapeSample(
      {double height,
      double width,
      padding,
      shapeShadow,
      double fontSize,
      double letterSpacing,
      fontFamily,
      text,
      FontWeight fontWeight,
      fontColor,
      shapeColor,
      List<Shadow> textShadows,
      shape}) {
    var logoShape = shape ?? BoxShape.circle;
    var isCircleShape = logoShape == BoxShape.circle;
    return MdiLogo.shapeWidget(
      padding: padding ?? EdgeInsets.only(top: 8, left: 6),
      width: width ?? (isCircleShape ? null : 100),
      height: height ?? (isCircleShape ? null : 50),
      shapeShadow: shapeShadow ??
          ShadowAsset.singleShadow(dx: -1, dy: 2, shadowColor: Colors.black26),
      widget: MdiLogo.plainText(
          textShadows: textShadows,
          fontSize: fontSize ?? isCircleShape ? 30 : 36,
          letterSpacing: letterSpacing ?? -1.2,
          fontFamily: fontFamily ?? 'Marvel',
          text: text ?? (isCircleShape ? 'LOGO' : 'MdiLOGO'),
          fontWeight: fontWeight ?? FontWeight.w500,
          fontColor: fontColor ?? Colors.white),
      shapeColor: shapeColor ?? Colors.red,
      logoShape: logoShape,
    );
  }

  final LogoProvider logo;
  final String text;
  final TextStyle textStyle;
  final List<InlineSpan> textSpans;
  final bool plainLogo;
  final double height;
  final double width;
  final double fontSize;
  final Color fontColor;
  final Gradient logoGradient;
  final double letterSpacing;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;
  final List<Shadow> textShadows;
  final BoxShape logoShape;
  final Decoration decoration;
  final BorderRadiusGeometry shapeRadius;
  final Color borderColor;
  final Color shapeColor;
  final double borderWidth;
  final List<BoxShadow> shapeShadow;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final Widget widget;
  final bool fullText;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double textHeight;

  static bool isCircle(BoxShape logoShape) => logoShape == BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return logo is ShapeLogo
        ? (logo as ShapeLogo).shapedWidget()
        : (logo.alignment() == TextAlign.center
            ? Center(child: logo.child())
            : logo.child());
  }
}

extension AutoShapeExt1<T> on TextRange {
  T operator [](String key) {
    if (this != null) {
      return this[key];
    } else {
      return {"": null}[key];
    }
  }
}

extension AutoShape4<V, T, X> on Map<V, T> {
  Map<dynamic, T> operator &(Map<X, T> otherMap) {
    Map<dynamic, T> result = {};
    result.addAll(this);
    result.addAll(otherMap);
    return result;
  }

  Map<V, T> splitKeysToIndexes(String text) {
    Map<V, T> result = {};
    if (this != null) {
      for (V mapKey in this.keys) {
        var length = (mapKey is String) ? mapKey.length : 1;
        print('length is $length');
        if (mapKey is List<int>) {
          for (int i in mapKey) {
            result[i as V] = this[mapKey];
          }
        } else if (length > 1) {
          if (mapKey == ALL_TEXT_KEY) {
            for (int x = 0; x < text.length; x++) {
              result[x as V] = this[mapKey];
            }
          } else
            for (var i = 0; i < length; i++) {
              var char = (mapKey as String)[i];
              for (int x = 0; x < text.length; x++) {
                int no = text.indexOf(char, x);
                if (no != -1) {
                  V index = no as V;
                  result[index] = this[mapKey];
                } else {
                  break;
                }
              }
            }
        } else {
          if (mapKey is String)
            result[text.indexOf(mapKey) as V] = this[mapKey];
          else
            result[mapKey] = this[mapKey];
        }
      }
    }
    return result;
  }
}

extension AutoShapeExt2<T> on String {
  /// this extension method will get key of the map based on whether
  /// the key is the of type int(index) or type String(text) itself
  getKey(int i, T) {
    return i;
  }
}
//  Text richText(
//          {TextStyle textStyle,
//          double fontSize,
//          double letterSpacing,
//          List<Shadow> textShadows,
//          TextAlign textAlign,
//          FontWeight fontWeight,
//          String fontFamily,
//          Color fontColor,
//          FontStyle fontStyle,
//          List<InlineSpan> textSpans}) =>
//      Text.rich(TextSpan(
//          style: fontStyle ??
//              TextStyle(
//                shadows: textShadows,
//                color: fontColor,
//                fontSize: fontSize,
//                fontWeight: fontWeight ?? FontWeight.bold,
//                fontStyle: fontStyle ?? FontStyle.normal,
//                fontFamily: fontFamily,
//                letterSpacing: letterSpacing,
//              )));
//
//  InlineSpan textSpan(
//          {TextStyle textStyle,
//          double fontSize,
//          double letterSpacing,
//          List<Shadow> textShadows,
//          TextAlign textAlign,
//          FontWeight fontWeight,
//          String fontFamily,
//          Color fontColor,
//          FontStyle fontStyle,
//          List<InlineSpan> children}) =>
//      TextSpan(
//          style: fontStyle ??
//              TextStyle(
//                shadows: textShadows,
//                color: fontColor,
//                fontSize: fontSize,
//                fontWeight: fontWeight ?? FontWeight.bold,
//                fontStyle: fontStyle ?? FontStyle.normal,
//                fontFamily: fontFamily,
//                letterSpacing: letterSpacing,
//              ));
//}

extension AutoShapeExt4<T, V> on T {
  Map<dynamic, T> forUnit<V>(V key) {
    Map<dynamic, T> map = {};
    if (key is List<int>) {
      for (int i in key) {
        map[i] = this;
      }
    } else
      map = {key: this};
    print(map);
    return map;
  }
}

extension IntRange on int {
  List<int> to(int end) {
    var start = this;
    var list = List.generate((end - start) + 1, (index) => (start + index));
    print(list);
    return list;
  }

  List<int> operator [](int end) {
    var start = this;
    var list = List.generate((end - start) + 1, (index) => (start + index));
    print(list);
    return list;
  }
}

extension MapExtDouble<V> on Map<V, double> {
  Map<V, double> operator -() {
    return {this.keys.toList()[0]: -this.values.toList()[0]};
  }
}

extension MapIntExt<V> on Map<V, int> {
  Map<V, int> operator -() {
    return {this.keys.toList()[0]: -this.values.toList()[0]};
  }
}

extension MapAnyExt<T> on T {
  Map<String, T> operator ~() {
    return {ALL_TEXT_KEY: this};
  }
}

extension ListWidgetExt on List<Widget> {
  Row row({MainAxisAlignment mainAxisAlignment})=> Row(mainAxisAlignment:mainAxisAlignment,children: this,);
}
extension WidgetExt on Widget {
  Widget get center {
    return Center(child: this);
  }

  Widget get centerRight {
    return Align(alignment: Alignment.centerRight, child: this);
  }

  Widget get centerLeft {
    return Align(alignment: Alignment.centerLeft, child: this);
  }

  Widget get topRight {
    return Align(alignment: Alignment.topRight, child: this);
  }

  Widget get topLeft {
    return Align(alignment: Alignment.topLeft, child: this);
  }

  Widget get topCenter {
    return Align(alignment: Alignment.topCenter, child: this);
  }

  Widget get bottomCenter {
    return Align(alignment: Alignment.bottomCenter, child: this);
  }

  Widget get bottomRight {
    return Align(alignment: Alignment.bottomRight, child: this);
  }

  Widget get bottomLeft {
    return Align(alignment: Alignment.bottomLeft, child: this);
  }

  Widget size({double width, double height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget padOnly(
      {double start: 0.0, double end: 0, double top: 0, double bottom: 0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: start, right: end, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget padSymmetric({
    double horizontal: 0,
    double vertical: 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget operator >(int frequency) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < frequency; i++) this,
      ],
    );
  }

  Widget operator |(int frequency) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < frequency; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: this,
          ),
      ],
    );
  }
}

const ALL_TEXT_KEY = '&#*/@%*)(_+_)#*&@#@';
