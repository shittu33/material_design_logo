library materialdesignlogo;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:materialdesignlogo/assets/style.dart';
import 'package:materialdesignlogo/basic.dart';
import 'package:materialdesignlogo/widget_type.dart';
import 'assets/strings.dart';

class MdiLogo extends StatelessWidget {
  ///a predefined named constructor  that just behave like normal Text() widget, but have all the style properties of text exposed inside it constructor.
  /// below is an example of it usage to create a simple facebook text Logo
  ///```dart
  ///static MdiLogo  facebookLogo(){
  ///    return MdiLogo.plainText(
  ///       fontSize: 50,
  ///       fontColor: Colors.blue[500],
  ///       text: 'facebook',
  ///       letterSpacing: -1.2,
  ///     )
  /// }
  ///```
  ///
  MdiLogo.plainText({
    this.fontSize,
    this.fontColor,
    this.text,
    this.width,
    this.height,
    this.textStyle,
    this.textSpans,
    this.letterSpacing,
    this.textHeight,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    String package,
    this.padding,
    this.textShadows,
    this.textAlign,
    PlainTextLogo plainTextData,
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        logo = PlainTextLogo(
          package: plainTextData?.package ?? package,
          fontSize: plainTextData?.fontSize ?? fontSize,
          letterSpacing: plainTextData?.letterSpacing ?? letterSpacing,
          textShadows: plainTextData?.textShadows ?? textShadows,
          text: plainTextData?.text ?? text,
          width: plainTextData?.width ?? width,
          height: plainTextData?.height ?? height,
          textHeight: plainTextData?.textHeight ?? textHeight,
          textStyle: plainTextData?.textStyle ?? textStyle,
          textAlign: plainTextData?.textAlign ?? textAlign,
          fontWeight: plainTextData?.fontWeight ?? fontWeight,
          fontFamily: plainTextData?.fontFamily ?? fontFamily,
          fontColor: plainTextData?.fontColor ?? fontColor,
          fontStyle: plainTextData?.fontStyle ?? fontStyle,
          textSpan: plainTextData?.textSpan ?? textSpans,
          padding: plainTextData?.padding ?? padding,
        ),
        plainLogo = true,
        widget = null,
        this.inkWellGesture = null,
        leadGravity = null,
        lead = null,
        content = null,
        fullText = false,
        logoGradient = null,
        logoShape = null,
        decoration = null,
        shapeRadius = null,
        borderColor = null,
        borderWidth = null,
        shapeColor = null,
        shadowColor = null;

  ///This is a named constructor that behaves as
  ///normal Text.rich() constructor of flutter Text() widget,but this function help you define varying properties (e.g colors,fonts...)
  ///in a very intuitive and simple way unlike nested TextSpans widget in Text.rich.
  /// let's see how we use it in designing Google Logo.
  ///```dart
  ///static Widget  googleLogo(){
  ///  String text='Google';
  ///  var lastIndex = text.length - 1;
  ///  return MdiLogo.richTextLogo(
  ///      text: text,
  ///      letterSpacing:  -4,
  ///      fontColor: {
  ///            [0,3]: Colors.blueAccent,
  ///            1: Colors.red,
  ///            2: Colors.yellow,
  ///            4: Colors.green,
  ///            lastIndex: Colors.red,
  ///          },
  ///      fontFamily: ~'JosefinSans',
  ///      package: ~'materialdesignlogo',
  ///      fontWeight: {0: FontWeight.w400, 1.to(lastIndex): FontWeight.w500},
  ///      fontSize: {0: 86, 1.to(lastIndex): 72.0},
  ///    );
  ///}
  ///```
  MdiLogo.richTextLogo({
    this.text: 'TEXT',
    this.letterSpacing,
    this.textAlign,
    this.padding,
    Map<dynamic, double> spanLetterSpacing,
    Map<dynamic, double> decorationThickness,
    Map<dynamic, double> textHeight,
    Map<dynamic, TextStyle> textStyle,
    Map<dynamic, double> fontSize,
    Map<dynamic, Color> fontColor,
    Map<dynamic, FontWeight> fontWeight,
    Map<dynamic, FontStyle> fontStyle,
    Map<dynamic, String> fontFamily,
    Map<dynamic, String> package,
    Map<dynamic, TextDecoration> textDecoration,
    Map<dynamic, TextDecorationStyle> textDecorationStyle,
    Map<dynamic, List<Shadow>> textShadows,
    RichTextLogo richTextLogoData,
  })  : logo = RichTextLogo(
          text: richTextLogoData?.text ?? text,
          letterSpacing: richTextLogoData?.letterSpacing ?? letterSpacing,
          padding: richTextLogoData?.padding ?? padding,
          textAlign: richTextLogoData?.textAlign ?? textAlign,
          spanLetterSpacing:
              richTextLogoData?.spanLetterSpacing ?? spanLetterSpacing,
          decorationThickness:
              richTextLogoData?.decorationThickness ?? decorationThickness,
          textHeight: richTextLogoData?.textHeight ?? textHeight,
          textStyle: richTextLogoData?.textStyle ?? textStyle,
          fontSize: richTextLogoData?.fontSize ?? fontSize,
          fontColor: richTextLogoData?.fontColor ?? fontColor,
          fontWeight: richTextLogoData?.fontWeight ?? fontWeight,
          fontStyle: richTextLogoData?.fontStyle ?? fontStyle,
          fontFamily: richTextLogoData?.fontFamily ?? fontFamily,
          package: richTextLogoData?.package ?? package,
          textDecoration: richTextLogoData?.textDecoration ?? textDecoration,
          textDecorationStyle:
              richTextLogoData?.textDecorationStyle ?? textDecorationStyle,
          textShadows: richTextLogoData?.textShadows ?? textShadows,
        ),
        this.textStyle = null,
        this.textSpans = null,
        this.leadGravity = null,
        this.lead = null,
        this.content = null,
        this.plainLogo = null,
        this.height = null,
        this.width = null,
        this.fontSize = null,
        this.fontColor = null,
        this.logoGradient = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.inkWellGesture = null,
        this.fontFamily = null,
        this.textShadows = null,
        this.logoShape = null,
        this.decoration = null,
        this.shapeRadius = null,
        this.borderColor = null,
        this.shapeColor = null,
        this.borderWidth = null,
        this.shadowColor = null,
        this.widget = null,
        this.fullText = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null;

  ///  this is a named constructor that draw a shape around a Text,
  /// the following example use this constructor to create a shaped Linkedin Text Logo.
  ///```dart
  ///static MdiLogo linkedln(){
  ///  return MdiLogo.shapedTextLogo(
  ///        text: 'in'
  ///        fontColor: Colors.white ,
  ///        logoShape: LogoShape.roundedRectangle, // or LogoShape.circle for circular shape or LogoShape.bevelRectangle
  ///        borderColor: Colors.white,
  ///        borderWidth: 2,
  ///        shapeColor: Colors.blue,
  ///  );
  ///}
  ///```
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
    String package,
    bool noShape,
    this.textShadows,
    this.logoShape,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.textSpans,
    this.borderWidth,
    this.shadowColor,
    this.fontSize,
    this.letterSpacing,
    this.textAlign,
    this.padding,
    this.shapeColor,
    this.textHeight,
    double elevation,
    TextShapeLogo textShapeData,
    this.inkWellGesture,
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        logo = TextShapeLogo(
          height: textShapeData?.height ?? height,
          noShape: textShapeData?.noShape ?? noShape,
          width: textShapeData?.width ?? width,
          elevation: textShapeData?.elevation ?? elevation,
          inkWellGesture: textShapeData?.inkWellGesture ?? inkWellGesture,
          textHeight: textShapeData?.textHeight ?? textHeight,
          decoration: textShapeData?.decoration ?? decoration,
          shape: textShapeData?.shape ?? logoShape,
          shapeRadius: textShapeData?.shapeRadius ?? shapeRadius,
          borderColor: textShapeData?.borderColor ?? borderColor,
          shapeColor: textShapeData?.shapeColor ?? shapeColor,
          borderWidth: textShapeData?.borderWidth ?? borderWidth,
          shapeGradient: textShapeData?.shapeGradient ?? logoGradient,
          shadowColor: textShapeData?.shadowColor ?? shadowColor,
          plainText: PlainTextLogo(
            package: textShapeData?.plainText?.package ?? package,
            fontSize: textShapeData?.plainText?.fontSize ?? fontSize,
            letterSpacing:
                textShapeData?.plainText?.letterSpacing ?? letterSpacing,
            textShadows: textShapeData?.plainText?.textShadows ?? textShadows,
            text: textShapeData?.plainText?.text ?? text,
            textStyle: textShapeData?.plainText?.textStyle ?? textStyle,
            textAlign: textShapeData?.plainText?.textAlign ?? textAlign,
            fontWeight: textShapeData?.plainText?.fontWeight ?? fontWeight,
            fontFamily: textShapeData?.plainText?.fontFamily ?? fontFamily,
            fontColor: textShapeData?.plainText?.fontColor ?? fontColor,
            fontStyle: textShapeData?.plainText?.fontStyle ?? fontStyle,
            textSpan: textShapeData?.plainText?.textSpan ?? textSpans,
            padding: textShapeData?.plainText?.padding ??
                padding ,
          ),
        ),
        widget = null,
        fullText = false,
        leadGravity = null,
        lead = null,
        content = null,
        plainLogo = false;

  ///This is a MdiLogo named constructor that receives Strings of [text], and map of
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
  MdiLogo.multiShapedTextLogo({
    String text: 'TEXT',
    this.letterSpacing,
    double runSpacing: 1.0,
    Axis direction,
    WrapAlignment alignment: WrapAlignment.center,
    Map<dynamic, TextStyle> textStyle,
    Map<dynamic, EdgeInsetsGeometry> padding,
    Map<dynamic, double> height,
    Map<dynamic, TextAlign> childAlignment,
    Map<dynamic, bool> noShape,
    Map<dynamic, double> width,
    Map<dynamic, double> textHeight,
    Map<dynamic, double> fontSize,
    Map<dynamic, Color> fontColor,
    Map<dynamic, double> spanLetterSpacing,
    Map<dynamic, Gradient> logoGradient,
    Map<dynamic, FontWeight> fontWeight,
    Map<dynamic, FontStyle> fontStyle,
    Map<dynamic, String> fontFamily,
    Map<dynamic, String> package,
    Map<dynamic, Color> shadowColor,
    Map<dynamic, LogoShape> logoShape,
    Map<dynamic, BoxDecoration> decoration,
    Map<dynamic, BorderRadius> shapeRadius,
    Map<dynamic, Color> borderColor,
    Map<dynamic, double> borderWidth,
    Map<dynamic, double> elevation,
    Map<dynamic, Color> shapeColor,
    MultiShapedTextLogo multiShapedTextLogo,
    this.inkWellGesture,
  })  : logo = MultiShapedTextLogo(
          text: multiShapedTextLogo?.text ?? text,
          noShape: multiShapedTextLogo?.noShape ?? noShape,
          childAlignment: multiShapedTextLogo?.childAlignment ?? childAlignment,
          elevation: multiShapedTextLogo?.elevation ?? elevation,
          inkWellGesture: multiShapedTextLogo?.inkWellGesture ?? inkWellGesture,
          padding: multiShapedTextLogo?.padding ?? padding,
          direction: multiShapedTextLogo?.direction ?? direction,
          letterSpacing: multiShapedTextLogo?.letterSpacing ?? letterSpacing,
          runSpacing: multiShapedTextLogo?.runSpacing ?? runSpacing,
          widgetAlignment: multiShapedTextLogo?.widgetAlignment ?? alignment,
          textStyle: multiShapedTextLogo?.textStyle ?? textStyle,
          height: multiShapedTextLogo?.height ?? height,
          width: multiShapedTextLogo?.width ?? width,
          textHeight: multiShapedTextLogo?.textHeight ?? textHeight,
          fontSize: multiShapedTextLogo?.fontSize ?? fontSize,
          fontColor: multiShapedTextLogo?.fontColor ?? fontColor,
          spanLetterSpacing:
              multiShapedTextLogo?.spanLetterSpacing ?? spanLetterSpacing,
          logoGradient: multiShapedTextLogo?.logoGradient ?? logoGradient,
          fontWeight: multiShapedTextLogo?.fontWeight ?? fontWeight,
          fontStyle: multiShapedTextLogo?.fontStyle ?? fontStyle,
          fontFamily: multiShapedTextLogo?.fontFamily ?? fontFamily,
          package: multiShapedTextLogo?.package ?? package,
          textShadows: multiShapedTextLogo?.textShadows ?? shadowColor,
          logoShape: multiShapedTextLogo?.logoShape ?? logoShape,
          decoration: multiShapedTextLogo?.decoration ?? decoration,
          shapeRadius: multiShapedTextLogo?.shapeRadius ?? shapeRadius,
          borderColor: multiShapedTextLogo?.borderColor ?? borderColor,
          borderWidth: multiShapedTextLogo?.borderWidth ?? borderWidth,
          shadowColor: multiShapedTextLogo?.shadowColor ?? shadowColor,
          shapeColor: multiShapedTextLogo?.shapeColor ?? shapeColor,
        ),
        this.text = null,
        this.textStyle = null,
        this.textAlign = null,
        this.textSpans = null,
        this.padding = null,
        this.plainLogo = null,
        this.height = null,
        this.leadGravity = null,
        this.lead = null,
        this.content = null,
        this.width = null,
        this.fontSize = null,
        this.fontColor = null,
        this.logoGradient = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.fontFamily = null,
        this.textShadows = null,
        this.logoShape = null,
        this.decoration = null,
        this.shapeRadius = null,
        this.borderColor = null,
        this.shapeColor = null,
        this.borderWidth = null,
        this.shadowColor = null,
        this.widget = null,
        this.fullText = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null;

  ///If your logo isn't text or icon type, you can define your own widget to MdiLogo.shapeWidget()
  ///as below:
  ///```dart
  ///static Widget shapedGoogleLogo()=>
  ///    MdiLogo.shapedWidget(
  ///      width: 130,
  ///      shapeColor: Colors.white,
  ///      widget: MdiLogo.google(), // this is a predefined Google logo in MdiLogo class
  ///      shapeRadius: BorderRadius.circular(10),
  ///      borderWidth: 2,
  ///      logoShape: LogoShape.roundedRectangle,
  ///    ),
  ///```
  MdiLogo.shapedWidget({
    this.height,
    this.width,
    this.logoGradient,
    this.logoShape,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.borderWidth,
    this.shadowColor,
    double elevation,
    this.padding,
    this.widget,
    bool noShape: false,
    this.shapeColor,
    this.inkWellGesture,
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
            shadowColor,
            noShape,
            elevation,
            inkWellGesture,
            logoShape),
        plainLogo = false,
        text = null,
        this.textHeight = null,
        this.icon = null,
        leadGravity = null,
        lead = null,
        content = null,
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

  ///This is a named shapedIconLogo constructor, use to draw shape around an icon
  ///For example let's design twitter logo use this constructor:
  ///```dart
  ///static MdiLogo twitterLogo() =>
  ///    MdiLogo.shapedIconLogo(
  ///      borderWidth: 2,
  ///      logoShape: LogoShape.roundedRectangle,// or LogoShape.circle
  ///      icon: MdiIcons.twitter,
  ///      iconColor: Colors.white,
  ///      shapeColor: Colors.blueAccent,
  ///    );
  ///```
  MdiLogo.shapedIconLogo({
    this.logoGradient,
    this.logoShape,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.borderWidth,
    this.shadowColor,
    this.padding,
    this.shapeColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    bool noShape: false,
    double elevation,
    IconShapeLogoData iconLogoData,
    this.inkWellGesture,
  })  : logo = IconShapeLogoData(
            icon: iconLogoData?.icon ?? icon ?? MdiIcons.whatsapp,
            iconColor: iconLogoData?.iconColor ?? iconColor,
            iconSize: iconLogoData?.iconSize ?? iconSize,
            elevation: iconLogoData?.elevation ?? elevation,
            inkWellGesture: iconLogoData?.inkWellGesture ?? inkWellGesture,
            padding: iconLogoData?.padding ?? padding,
            decoration: iconLogoData?.decoration ?? decoration,
            shapeRadius: iconLogoData?.shapeRadius ??
                shapeRadius ??
                BorderRadius.circular(10),
            borderColor: iconLogoData?.borderColor ?? borderColor,
            shapeColor: iconLogoData?.shapeColor ?? shapeColor,
            borderWidth: iconLogoData?.borderWidth ?? borderWidth,
            shapeGradient: iconLogoData?.shapeGradient ?? logoGradient,
            shadowColor: iconLogoData?.shadowColor ?? shadowColor,
            noShape: iconLogoData?.noShape ?? noShape,
            shape: iconLogoData?.shape ?? logoShape),
        plainLogo = false,
        text = null,
        this.textSpans = null,
        this.textStyle = null,
        this.textHeight = null,
        this.width = null,
        this.height = null,
        leadGravity = null,
        lead = null,
        content = null,
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

  /// A named constructor of MdiLogo Widget that combine two logo to form a single one.
  ///  where the [lead] is the first
  /// at the side specified by [LeadGravity] and [content]  will following it.
  /// For example let's create instagram logo by combining instagram icon logo and instagram text logo.
  ///This will create an instagram logo containing 2 logo type, where the iconLogo is the first
  ///at the left hand side and plainText logo (containing instagram text) following it.
  ///The logo is defined as below:
  ///
  ///```dart
  /// static Widget instagramCombine() =>
  ///      MdiLogo.doubleLogo(
  ///        gap: 2, // the gap between the two logos
  ///        leadGravity: LeadGravity.start, // place the lead at the beginning(instagram icon logo in this case)
  ///        content:
  ///            MdiLogo.plainText(//use plainText as the main content
  ///              fontColor: Colors.black,
  ///              fontWeight: FontWeight.w200,
  ///              fontSize: 43,
  ///              fontFamily: 'Billabong',
  ///              package: ~'materialdesignlogo',
  ///              fontStyle: FontStyle.normal,
  ///              text: "Instagram",
  ///              textShadows: ShadowAsset.singleShadow(),
  ///              textAlign: TextAlign.center,
  ///            ).padOnly(top: 18),
  ///        lead:  MdiLogo.shapedIconLogo( // use shapedIconLogo with instagram icon as the first logo
  ///          icon: MdiIcons.instagram,
  ///          shapeColor: Colors.pinkAccent),
  ///      );
  ///```
  MdiLogo.doubleLogo({
    this.lead,
    this.content,
    this.width,
    this.height,
    this.leadGravity,
    EdgeInsetsGeometry padding,
    double gap,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  })  : logo = DoubleLogo(
          leadGravity: leadGravity,
          padding: padding,
          width: width,
          height: height,
          mainAxisAlignment: mainAxisAlignment,
          lead: lead,
          content: content,
          gap: gap,
        ),
        this.text = null,
        this.textStyle = null,
        this.textSpans = null,
        this.plainLogo = null,
        this.inkWellGesture = null,
        this.fontSize = null,
        this.fontColor = null,
        this.logoGradient = null,
        this.letterSpacing = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.fontFamily = null,
        this.textShadows = null,
        this.logoShape = null,
        this.decoration = null,
        this.shapeRadius = null,
        this.borderColor = null,
        this.shapeColor = null,
        this.borderWidth = null,
        this.shadowColor = null,
        this.textAlign = null,
        this.padding = null,
        this.widget = null,
        this.fullText = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null;


  ///Construct a logo with a label
  ///A common variant of Doubled Logo, where you have a Label for a Logo
  ///```dart
  /// static Widget facebookLabeled() =>
  ///               MdiLogo.labeledLogo(
  ///                 MdiLogo.facebook(),
  ///                 logoLabel: 'facebook',
  ///                 size: 70,
  ///                 logoGravity: LeadGravity.top,
  ///                 labelData: PlainTextLogo(fontColor: Colors.red),
  ///               );
  ///```
  MdiLogo.labeledLogo(
      MdiLogo logo, {
        String logoLabel,
        double size,
        PlainTextLogo labelData,
        this.inkWellGesture,
        this.padding,
        LeadGravity logoGravity,
        MainAxisAlignment mainAxisAlignment: MainAxisAlignment.center,
      })  : logo = LabeledLogo(
    logo,
    logoLabel: logoLabel,
    labelData: labelData,
    size: size,
    inkWellGesture: inkWellGesture,
    padding: padding,
    mainAxisAlignment: mainAxisAlignment,
    logoGravity: logoGravity,
  ),
        this.text = null,
        this.textStyle = null,
        this.textSpans = null,
        this.plainLogo = null,
        this.height = null,
        this.width = null,
        this.fontSize = null,
        this.fontColor = null,
        this.logoGradient = null,
        this.letterSpacing = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.fontFamily = null,
        this.textShadows = null,
        this.logoShape = null,
        this.decoration = null,
        this.shapeRadius = null,
        this.borderColor = null,
        this.shapeColor = null,
        this.borderWidth = null,
        this.shadowColor = null,
        this.textAlign = null,
        this.widget = null,
        this.fullText = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null,
        this.leadGravity = null,
        this.lead = null,
        this.content = null;

  ///This will wrap any logo type supported by materialdesignlogo Package in
  /// a single widget, it will wrap each items in a shape specified in [shape] properties,
  /// even if the item  is of type Text.
  ///Useful for creating group of Social media logos for sharing contents
  /// Note: Only MdiLogo widget is supported.
  /// see the example below:
  /// ```dart
  ///    MdiLogo.wrapLogos(
  ///      logos: [
  ///        MdiLogo.linkedln(),
  ///        MdiLogo.facebook(),
  ///        MdiLogo.twitter(),
  ///        MdiLogo.instagram(),
  ///        MdiLogo.safari(),
  ///        MdiLogo.google(),
  ///        MdiLogo.facebook(plainLogo: true),
  ///      ],
  ///      size: 33,
  ///      shapeRadius: BorderRadius.circular(12),
  ///    )
  /// ```
///
///   let's create another example to wrap labeledLogo and pass it to a dialog
///   like a normal Dialog for sharing content to other Apps on your device  we have shaped ,
///   at the top and label at the bottom:
///   ```dart
///   static Widget showShareDialog(BuildContext context) {
///     showDialog(
///         context: context,
///         builder: (c) {
///           return AlertDialog(
///               title: MdiLogo.wrapLogos(
///                 logos: [
///                   MdiLogo.labeledLogo(
///                     MdiLogo.facebook(),
///                     logoLabel: 'facebook',
///                   ),
///                   MdiLogo.labeledLogo(MdiLogo.instagram(),
///                       logoLabel: 'instagram'),
///                   MdiLogo.labeledLogo(MdiLogo.apple(),
///                       logoLabel: 'apple'),
///                   MdiLogo.labeledLogo(MdiLogo.twitter(),
///                       logoLabel: 'twitter'),
///                   MdiLogo.labeledLogo(MdiLogo.safari(),
///                       logoLabel: 'Safari'),
///                 ],
///                 size: 65,// size of each item
///                 labelLogoGravity: LeadGravity.top, // place the logo at top and label at bottom
///               ));
///         });
///   }
///
///   ```

  MdiLogo.wrapLogos({
    List<MdiLogo> logos,

    ///if specified each of the item will use the value of this  size parameter
    double size: 33,
    double runSpacing: 0,
    double spacing: 0,
    WrapAlignment alignment: WrapAlignment.start,
    Axis direction,
    double elevation,

    ///if specified each of the item will be decorated with the value of this parameter
    Decoration decoration,

    ///if specified each of the item will use the value of this  shapeRadius parameter
    BorderRadiusGeometry shapeRadius,

    ///if specified each of the item will use the value of this  borderColor parameter
    Color borderColor,

    ///if specified each of the item will use the value of this  shapeColor parameter
    Color shapeColor,

    ///if specified each of the item will use the value of this  fontColor parameter
    Color childColor,

    ///if specified each of the item will use the value of this  borderWidth parameter
    double borderWidth,

    ///if specified each of the item will use the value of this  shapeGradient parameter
    Gradient shapeGradient,

    ///if specified each of the item will use the value of this  shadowColor parameter
    Color shadowColor,

    ///if specified each of the item will use the value of this  shape parameter
    LogoShape shape,
    EdgeInsetsGeometry contPadding,
    ///the  gravity of logo in [DoubleLogo] if its present in the logo children
    LeadGravity labelLogoGravity,
    PlainTextLogo labelLogoData,

    WrapLogos wrapLogos,
    InkWellGesture Function(int index, LogoProvider logo, List<MdiLogo> logos)
        inkWellGesture,
  })  : logo = WrapLogos(
          direction: direction,
          logos: wrapLogos?.logos ?? logos,
          size: wrapLogos?.size ?? size,
          inkWellGesture: wrapLogos?.inkWellGesture ?? inkWellGesture,
          runSpacing: wrapLogos?.runSpacing ?? runSpacing,
          spacing: wrapLogos?.spacing ?? spacing,
          wrapAlignment: wrapLogos?.wrapAlignment ?? alignment,
          elevation: wrapLogos?.elevation ?? elevation,
          decoration: wrapLogos?.decoration ?? decoration,
          shapeRadius: wrapLogos?.shapeRadius ?? shapeRadius,
          borderColor: wrapLogos?.borderColor ?? borderColor,
          shapeColor: wrapLogos?.shapeColor ?? shapeColor,
          childColor: wrapLogos?.childColor ?? childColor,
          borderWidth: wrapLogos?.borderWidth ?? borderWidth,
          shapeGradient: wrapLogos?.shapeGradient ?? shapeGradient,
          shadowColor: wrapLogos?.shadowColor ?? shadowColor,
          shape: wrapLogos?.shape ?? shape,
          contPadding: wrapLogos?.contPadding ?? contPadding,
          labelLogoGravity: wrapLogos?.labelLogoGravity ?? labelLogoGravity,
          labelLogoData: wrapLogos?.labelLogoData ?? labelLogoData,
        ),
        this.text = null,
        this.textStyle = null,
        this.textSpans = null,
        this.plainLogo = null,
        this.height = null,
        this.width = null,
        this.leadGravity = null,
        this.inkWellGesture = null,
        this.lead = null,
        this.content = null,
        this.fontSize = null,
        this.fontColor = null,
        this.logoGradient = null,
        this.letterSpacing = null,
        this.fontWeight = null,
        this.fontStyle = null,
        this.fontFamily = null,
        this.textShadows = null,
        this.logoShape = null,
        this.decoration = null,
        this.shapeRadius = null,
        this.borderColor = null,
        this.shapeColor = null,
        this.borderWidth = null,
        this.shadowColor = null,
        this.textAlign = null,
        this.padding = null,
        this.widget = null,
        this.fullText = null,
        this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        this.textHeight = null;

  static MdiLogo fedX({
    String text: "FedEx",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var firstPart = 0.to(3);
    var secondPart = 3.to(5);
    return MdiLogo.richTextLogo(
      richTextLogoData: richTextLogoData,
      padding: padding,
      textAlign: textAlign,

      ///Here we create a map of key text index and value of
      ///spanLetterSpacing,and use  extension  function 'to' and operator[]  to
      /// to define the range of letter indexes all extension functions and operators
      /// are decleared declared below this [materialdesignlogo] file
      ///With default text: 'FedEx', spanLetterSpacing value is the same thing as
      ///```dart
      ///         spanLetterSpacing: spanLetterSpacing ?? {'Fed' : -5.8, 'Ex': -2},
      /// ```
      spanLetterSpacing: {firstPart: -5.8, secondPart: -2.0},
      text: text,

      /// Here we use the extension unary operator '~' declared below this [materialdesignlogo]
      /// file to map each letter with the same value '40.0'
      ///With default text: 'FedEx', fontSize value is the same thing as
      ///```dart
      ///         fontSize: fontSize ?? {'FedEx' : 40,},
      /// ```
      fontSize: ~40.0,
      fontColor: {firstPart: Colors.deepPurple, secondPart: Colors.red},
      fontWeight: ~FontWeight.w600,
      fontFamily: ~'JosefinSans',
      package: ~'materialdesignlogo',
      textShadows: ~ShadowAsset.singleShadow(),
    );
  }

  static MdiLogo bbc({
    String text: "BBC",
    double letterSpacing,
    TextAlign textAlign,
    MultiShapedTextLogo multiShapedTextLogo,
  }) =>
      MdiLogo.multiShapedTextLogo(
        text: text ?? "BBC",
        letterSpacing: letterSpacing,
        fontSize: ~34.0,
        fontColor: ~Colors.white,
        shapeColor: ~Colors.black,
        multiShapedTextLogo: multiShapedTextLogo,
      );

  static MdiLogo mdiLogoText({
    String text: "MdiLogo",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var firstPart = 0.to(3);
    var secondPart = 3.to(6);
    return MdiLogo.richTextLogo(
      richTextLogoData: richTextLogoData,
      textAlign: textAlign,
      spanLetterSpacing: {firstPart: -3.8, secondPart: -2.0},
      text: text,
      padding: padding,
      fontSize: {firstPart: 60.0, secondPart: 70},
      fontColor: {firstPart: Colors.deepPurple, secondPart: Colors.red},
      fontWeight: ~FontWeight.w600,
      fontFamily: ~'Piedra',
      package: ~'materialdesignlogo',
      textShadows: ~ShadowAsset.singleShadow(),
    );
  }

  static MdiLogo nestle({
    String text: "Nestle",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      richTextLogoData: richTextLogoData,
      text: text,
      padding: padding,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: {
        [1, 2, lastIndex]: TextDecoration.overline
      },
      fontColor: ~Colors.red,
      fontWeight: ~FontWeight.w400,
      fontFamily: ~'Roboto',
      package: ~'materialdesignlogo',
      fontSize: {
        [0, 3, 4]: 76.0,
        1.to(2): 57,
        lastIndex: 58
      },
      spanLetterSpacing: {0: -8.4, 1.to(2): -4.0, 4: -9},
    );
  }

  static MdiLogo nescafe({
    String text: "Nescafe",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      padding: padding,
      richTextLogoData: richTextLogoData,
      text: text,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: {
        'escaf': TextDecoration.overline,
        lastIndex: TextDecoration.none
      },
      fontColor: ~Colors.deepOrange,
      fontWeight: ~FontWeight.w400,
      fontFamily: ~'Roboto',
      package: ~'materialdesignlogo',
      fontSize: {
        [0]: 76.0,
        1.to(5): 57,
        lastIndex: 58
      },
      spanLetterSpacing: {0: -8.8, 1.to(5): -4.0, 6: -8},
    );
  }

  static MdiLogo ferrari({
    String text: "Ferrari",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      richTextLogoData: richTextLogoData,
      text: text,
      padding: padding,
      textAlign: textAlign ?? TextAlign.center,
      textDecoration: {
        'errari': TextDecoration.overline,
      },
      decorationThickness: ~2.2,
      fontColor: ~Colors.indigoAccent,
      fontWeight: ~FontWeight.w200 & {'errari': FontWeight.w300},
      fontFamily: ~'Roboto',
      package: ~'materialdesignlogo',
      fontSize: {
        [0]: 76.0,
        1.to(lastIndex): 55.4,
      },
      spanLetterSpacing: {0: -8.8, 1.to(5): -4.0, 6: -8},
    );
  }

  static MdiLogo ebay({
    String text: "ebay",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      padding: padding,
      richTextLogoData: richTextLogoData,
      textAlign: textAlign ?? TextAlign.center,
      text: text,
      letterSpacing: letterSpacing ?? -5,
      fontColor: {
        0: Colors.red,
        1: Colors.blueAccent,
        2: Colors.yellow,
        3: Colors.lightGreen,
      },
      textShadows: ~ShadowAsset.singleShadow(),
      fontWeight: {0: FontWeight.w500, 1.to(lastIndex): FontWeight.w600},
      fontSize: {0: 96, 1.to(lastIndex): 82.0},
    );
  }

  static MdiLogo google({
    String text: "Google",
    double letterSpacing,
    TextAlign textAlign,
    EdgeInsetsGeometry padding,
    RichTextLogo richTextLogoData,
  }) {
    var lastIndex = text.length - 1;
    return MdiLogo.richTextLogo(
      richTextLogoData: richTextLogoData,
      textAlign: textAlign ?? TextAlign.center,
      text: text,
      padding: padding,
      letterSpacing: letterSpacing ?? -4,
      textShadows: ~ShadowAsset.singleShadow(),
      fontColor: {
        0: Colors.blueAccent,
        1: Colors.red,
        2: Colors.yellow,
        3: Colors.blueAccent,
        4: Colors.green,
        5: Colors.red,
      },
      package: ~'materialdesignlogo',
      fontFamily: {0: 'JosefinSans', 1.to(5): 'JosefinSans'},
      fontWeight: {0: FontWeight.w400, 1.to(lastIndex): FontWeight.w500},
      fontSize: {0: 86, 1.to(lastIndex): 72.0},
    );
  }

  static MdiLogo netflix({
    double fontSize,
    fontColor,
    double letterSpacing,
    fontWeight,
    textShadows,
    PlainTextLogo textData,
  }) =>
      MdiLogo.plainText(
        plainTextData: textData,
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
    LogoShape logoShape: LogoShape.roundedRectangle,
    fullText: false,
    borderColor,
    double borderWidth,
    shapeShadow,
    shapeColor,
    PlainTextLogo textData,
    TextShapeLogo textShapeData,
  }) {
    var inferTextSize = TextShapeLogo.calculateTextSize(
        fontSize, null, null, isCircle(logoShape));
    return plainLogo
        ? MdiLogo.plainText(
            plainTextData: textData,
            fontSize: fontSize,
            fontColor: fontColor,
            text: TextAsset.fbLong,
            letterSpacing: letterSpacing,
            textShadows: textShadows,
          )
        : MdiLogo.shapedTextLogo(
            textShapeData: textShapeData,
            textHeight: (isCircle(logoShape) ? 0.001 : null),
            fontColor: fontColor,
            logoGradient: null,
            textShadows: textShadows,
            logoShape: logoShape,
            shapeRadius:
                textShapeData?.shapeRadius ?? BorderRadius.circular(10),
            borderColor: borderColor,
            borderWidth: borderWidth,
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

  static MdiLogo hp({
    double fontSize,
    double letterSpacing,
    textShadows,
    LogoShape logoShape: LogoShape.circle,
    borderColor,
    double borderWidth,
    shapeShadow,
    shapeColor,
    PlainTextLogo textData,
    RichTextLogo richTextLogo,
  }) {
    fontSize = fontSize ?? 45;
    var inferTextSize = TextShapeLogo.calculateTextSize(
        fontSize, null, null, isCircle(logoShape));
    return MdiLogo.shapedWidget(
      widget: MdiLogo.multiShapedTextLogo(
//        richTextLogoData: richTextLogo,
        noShape: {0.to(2): true},
        direction: Axis.horizontal,
//        textHeight: ~(isCircle(logoShape) ? 0.001 : null),
        textHeight: {
          0: (isCircle(logoShape) ? 1.00 : null),
          1: (isCircle(logoShape) ? 0.2 : null),
        },
//        package: ~'materialdesignlogo',fontFamily: ~'Marvel',
        fontColor: ~Colors.white,
//        textShadows: ~textShadows,
        childAlignment: ~TextAlign.start,
        text: 'hp',
        fontStyle: ~FontStyle.italic,
        fontSize: ~fontSize,
        padding: {
          0: (isCircle(logoShape)
              ? EdgeInsets.only(bottom: inferTextSize - 2, left: 9)
              : EdgeInsets.zero),
          1: (isCircle(logoShape)
              ? EdgeInsets.only(
                  top: inferTextSize - 2,
                )
              : EdgeInsets.zero),
        },
        letterSpacing: -2,
//        spanLetterSpacing: ~letterSpacing,
      ),
      logoGradient: null,
      logoShape: logoShape,
      borderColor: borderColor,
      borderWidth: borderWidth,
      shapeColor: shapeColor,
    );
  }

  static MdiLogo linkedln({
    plainLogo: false,
    double fontSize,
    fontColor,
    double letterSpacing,
    textShadows,
    LogoShape logoShape: LogoShape.roundedRectangle,
    fullText: false,
    borderColor,
    double borderWidth,
    shapeShadow,
    shapeColor,
    PlainTextLogo textData,
    TextShapeLogo textShapeData,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              plainTextData: textData,
              fontSize: fontSize,
              fontColor: fontColor,
              text: TextAsset.linkedlnLong,
              letterSpacing: letterSpacing,
              textShadows: textShadows ?? ShadowAsset.singleShadow(),
            )
          : MdiLogo.shapedTextLogo(
              textShapeData: textShapeData,
              fontColor: fontColor,
              logoGradient: null,
              textShadows: textShadows,
              logoShape: logoShape,
              shapeRadius:
                  textShapeData?.shapeRadius ?? BorderRadius.circular(10),
              borderColor: borderColor,
              borderWidth: borderWidth,
              shadowColor: textShadows,
              text: (isCircle(logoShape) || !fullText
                  ? TextAsset.linkedlnShort
                  : TextAsset.linkedlnLong),
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              shapeColor: shapeColor,
            );

  /// IconShape Logo Template samples
  static MdiLogo whatsApp(
          {LogoShape shape,
          double borderWidth,
          double iconSize,
          IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconSize: iconSize,
          icon: MdiIcons.whatsapp,
          shapeColor: Colors.green,
          iconLogoData: logoData);

  static MdiLogo instagram(
          {LogoShape shape,
          double borderWidth,
          double iconSize,
          IconShapeLogoData iconLogoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.instagram,
          iconSize: iconSize,
          shapeColor: Colors.pinkAccent,
          iconLogoData: iconLogoData);

  static MdiLogo twitter(
          {LogoShape shape,
          double borderWidth,
          double iconSize,
          IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconSize: iconSize,
          icon: MdiIcons.twitter,
          shapeColor: Colors.blueAccent,
          iconLogoData: logoData);

  static MdiLogo microsoftWindows(
          {LogoShape shape,
          double borderWidth,
          double iconSize,
          IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconSize: iconSize,
          icon: MdiIcons.microsoftWindowsClassic,
          shapeColor: Colors.blueAccent,
          iconLogoData: logoData);

  static MdiLogo snapChat(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          icon: MdiIcons.snapchat,
          shapeColor: Colors.amber,
          iconLogoData: logoData);

  static MdiLogo apple(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.black,
          icon: MdiIcons.apple,
          iconLogoData: logoData);

  static MdiLogo android(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.green.shade400,
          icon: MdiIcons.android,
          iconLogoData: logoData);

  static MdiLogo youtube(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.red,
          icon: MdiIcons.youtube,
          iconLogoData: logoData);

  static MdiLogo yahoo(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.yahoo,
          iconLogoData: logoData);

  static MdiLogo googleChrome(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.googleChrome,
          iconLogoData: logoData);

  static MdiLogo googleDrive(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoGradient: MdiStyle.mix2GradientSample(
              start: Colors.yellow, end: Colors.blue),
          logoShape: shape,
          iconColor: Colors.indigo,
          icon: MdiIcons.googleDrive,
          iconLogoData: logoData);

  static MdiLogo googleMaps(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.googleMaps,
          iconLogoData: logoData);

  static MdiLogo github(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.black,
          icon: MdiIcons.github,
          iconLogoData: logoData);

  static MdiLogo gitlab(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          shapeColor: Colors.redAccent,
          icon: MdiIcons.gitlab,
          iconLogoData: logoData);

  static MdiLogo facebookMessenger(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.facebookMessenger,
          iconLogoData: logoData);

  static MdiLogo weChat(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.wechat,
          iconLogoData: logoData);

  static MdiLogo wordPress(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.wordpress,
          iconLogoData: logoData);

  static MdiLogo adobe(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.red,
          borderColor: Colors.white,
          shapeColor: Colors.white,
          icon: MdiIcons.adobe,
          iconLogoData: logoData);

  static MdiLogo email(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.red,
          borderColor: Colors.red,
          shapeColor: Colors.white,
          icon: MdiIcons.email,
          iconLogoData: logoData);

  static MdiLogo safari(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.green,
          borderColor: Colors.green,
          shapeColor: Colors.white,
          icon: MdiIcons.appleSafari,
          iconLogoData: logoData);

  static MdiLogo abjadArabic(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.red,
          borderColor: Colors.red,
          shapeColor: Colors.white,
          icon: MdiIcons.abjadArabic,
          iconLogoData: logoData);

  static MdiLogo scriptText(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.scriptText,
          iconLogoData: logoData);

  static MdiLogo ubuntu(
          {LogoShape shape, double borderWidth, IconShapeLogoData logoData}) =>
      MdiLogo.shapedIconLogo(
          borderWidth: borderWidth,
          logoShape: shape,
          iconColor: Colors.blue,
          borderColor: Colors.blue,
          shapeColor: Colors.white,
          icon: MdiIcons.ubuntu,
          iconLogoData: logoData);

  ///end IconShapeLogo Template Samples

  /// DoubleLogo Template sample
  static MdiLogo microsoftXBox(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
                plainTextData: contentData,
                fontFamily: 'x360',
                package: 'materialdesignlogo',
                text: TextAsset.xBox,
                fontSize: 43,
                textShadows: ShadowAsset.singleShadow(
                    shadowColor: Colors.grey[700], dx: -1, dy: 1.4),
                fontWeight: FontWeight.w400,
                fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              iconLogoData: leadData,
              icon: MdiIcons.microsoftXbox,
              iconColor: Colors.white,
              shapeColor: Colors.green,
            ),
      );

  static MdiLogo microsoftCombined(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
                plainTextData: contentData,
                fontSize: 30,
                textShadows: ShadowAsset.singleShadow(
                    shadowColor: Colors.grey[700], dx: -1, dy: 1),
                text: TextAsset.microsoft,
                fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              iconLogoData: leadData,
              icon: MdiIcons.microsoftWindowsClassic,
              iconColor: Colors.green,
              shapeColor: Colors.white,
            ),
      );

  static MdiLogo adobeCombined(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: LeadGravity.top,
        content: content ??
            MdiLogo.plainText(
                plainTextData: contentData,
                text: TextAsset.adobe,
                fontColor: Colors.black),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              iconLogoData: leadData,
              icon: MdiIcons.adobe,
              iconColor: Colors.red,
              shapeColor: Colors.white,
              iconSize: 53,
            ),
      );

  static MdiLogo androidCombine(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          gap: gap ?? 0,
          leadGravity: LeadGravity.top,
          content: content ??
              MdiLogo.plainText(
                plainTextData: contentData,
                textShadows: ShadowAsset.singleShadow(),
                text: 'ANDROID',
                fontColor: Colors.white,
                fontFamily: 'Droid',
                package: 'materialdesignlogo',
              ),
          lead: lead ??
              MdiLogo.shapedIconLogo(
                noShape: true,
                icon: leadData?.icon ?? MdiIcons.android,
                iconColor: leadData?.iconColor ?? Colors.green,
                iconSize: leadData?.iconSize ?? 53,
              ));

  static MdiLogo mdiLogo(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
              plainTextData: contentData,
              textAlign: TextAlign.start,
              textSpans: TextSpanAsset.mdiLogoTexts(),
            ),
        lead: lead ??
            MdiLogo.shapedIconLogo(
              iconLogoData: leadData,
              icon: MdiIcons.materialDesign,
              shapeColor: Colors.pink,
              borderWidth: 1,
              logoShape: LogoShape.regularRectangle,
              shapeRadius: BorderRadius.circular(8),
            ),
      );

  static MdiLogo linkedlnCombine(
          {MdiLogo content,
          MdiLogo lead,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          double gap,
          PlainTextLogo contentData,
          TextShapeLogo leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.end,
        content: content ??
            MdiLogo.plainText(
              plainTextData: contentData,
              text: 'Linked',
              fontSize: 43,
              fontColor: Colors.black,
            ),
        lead: lead ??
            MdiLogo.linkedln(
              textShapeData: leadData,
              fontSize: 37,
              plainLogo: false,
              borderWidth: 1,
            ),
      );

  static MdiLogo facebookCombine(
          {MdiLogo content,
          MdiLogo lead,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          double gap,
          PlainTextLogo contentData,
          TextShapeLogo leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.facebook(
                textData: contentData,
                plainLogo: true,
                fontColor: Colors.black),
        lead: lead ??
            MdiLogo.facebook(
              textShapeData: leadData,
              fontSize: 45,
              plainLogo: false,
              borderWidth: 1,
            ),
      );

  static MdiLogo youtubeCombine(
          {MdiLogo content,
          MdiLogo lead,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          double gap,
          PlainTextLogo contentData,
          TextShapeLogo leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.end,
        content: content ??
            MdiLogo.plainText(
                text: 'You',
                fontFamily: 'Marvel',
                letterSpacing: 1,
                package: 'materialdesignlogo',
                plainTextData: contentData,
                fontSize: 35,
                fontColor: Colors.grey[800]),
        lead: lead ??
            MdiLogo.shapedTextLogo(
              text: 'Tube',
              padding: EdgeInsets.all(4),
              logoGradient: MdiStyle.colorGradientSample1(rawColor: Colors.red),
              textShapeData: leadData,
              fontSize: 55,
              elevation: 1.2,
              textHeight: 1.2,
              fontFamily: 'Marvel',
              package: 'materialdesignlogo',
              logoShape: LogoShape.roundedRectangle,
              shapeRadius: BorderRadius.circular(12),
              borderWidth: 0,
            ),
      );

  static MdiLogo instagramCombine(
          {MdiLogo content,
          MdiLogo lead,
          double gap,
          MainAxisAlignment mainAxisAlignment,
          LeadGravity leadGravity,
          PlainTextLogo contentData,
          IconShapeLogoData leadData,
          EdgeInsetsGeometry padding}) =>
      MdiLogo.doubleLogo(
        gap: gap,
        leadGravity: leadGravity ?? LeadGravity.start,
        content: content ??
            MdiLogo.plainText(
              plainTextData: contentData,
              fontColor: Colors.black,
              fontWeight: FontWeight.w200,
              fontSize: 43,
              fontFamily: 'Billabong',
              package: 'materialdesignlogo',
              fontStyle: FontStyle.normal,
              text: "Instagram",
              textShadows: ShadowAsset.singleShadow(),
              textAlign: TextAlign.center,
            ),
        lead: lead ?? MdiLogo.instagram(iconLogoData: leadData),
      );

  static MdiLogo combineMdiSample(
      {MdiLogo content,
      MdiLogo lead,
      double gap: 0,
      MainAxisAlignment mainAxisAlignment,
      LeadGravity leadGravity,
      PlainTextLogo contentData,
      TextShapeLogo leadData,
      EdgeInsetsGeometry padding}) {
    var logoShape = leadData?.shape ?? LogoShape.circle;
    var isCircleShape = logoShape == LogoShape.circle;
    return MdiLogo.doubleLogo(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      gap: gap,
      leadGravity: LeadGravity.start,
      content: content ??
          MdiLogo.plainText(
            plainTextData: contentData,
//            textAlign: TextAlign.start,
            text: 'Design',
            textStyle: TextStyle(
              decorationThickness: 1.2,
              fontSize: 28.0,
              height: 2.0,
              letterSpacing: -2,
              package: 'materialdesignlogo',
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.w500,
              color: Colors.grey[900],
              decorationStyle: TextDecorationStyle.double,
              decoration: TextDecoration.underline,
            ),
          ),
      lead: lead ??
          MdiLogo.shapedTextLogo(
            textShapeData: leadData,
            padding: padding ?? EdgeInsets.only(top: 8, left: 6),
            width: (isCircleShape ? null : 100),
            height: (isCircleShape ? null : 50),
            fontSize: isCircleShape ? 30 : 36,
            letterSpacing: -1.2,
            fontFamily: 'Marvel',
//            textAlign: TextAlign.start,
            package: 'materialdesignlogo',
            text: (isCircleShape ? 'LOGO' : 'MdiLOGO'),
            fontWeight: FontWeight.w500,
            fontColor: Colors.white,
            shapeColor: Colors.red,
            logoShape: logoShape,
          ),
    );
  }

  /// end DoubleLogo Template sample
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
  final LogoShape logoShape;
  final Decoration decoration;
  final BorderRadiusGeometry shapeRadius;
  final Color borderColor;
  final Color shapeColor;
  final double borderWidth;
  final Color shadowColor;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final Widget widget;
  final bool fullText;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double textHeight;
  final LeadGravity leadGravity;
  final MdiLogo lead;
  final MdiLogo content;
  final InkWellGesture inkWellGesture;

  static bool isCircle(LogoShape logoShape) => logoShape == LogoShape.circle;

  @override
  Widget build(BuildContext context) {
    return logo.sizedChild();
  }
}

enum LogoShape {
  bevelRectangle,
  regularRectangle,
  roundedRectangle,
  circle,
}

class InkWellGesture {
  GestureTapCallback onTap;
  GestureTapCallback onDoubleTap;
  GestureLongPressCallback onLongPress;
  GestureTapDownCallback onTapDown;
  GestureTapCancelCallback onTapCancel;
  ValueChanged<bool> onHighlightChanged;
  ValueChanged<bool> onHover;
  MouseCursor mouseCursor;
  Color focusColor;
  Color hoverColor;
  Color highlightColor;
  MaterialStateProperty<Color> overlayColor;
  Color splashColor;
  InteractiveInkFeatureFactory splashFactory;
  double radius;
  BorderRadius borderRadius;
  ShapeBorder customBorder;
  bool enableFeedback = true;
  bool excludeFromSemantics = false;
  FocusNode focusNode;
  bool canRequestFocus = true;
  ValueChanged<bool> onFocusChange;
  bool autofocus = false;

  InkWellGesture({
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor: Colors.black,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback,
    this.excludeFromSemantics,
    this.focusNode,
    this.canRequestFocus,
    this.onFocusChange,
    this.autofocus,
  });
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
}

extension AutoShapeExt2<T> on String {
  /// this extension method will get key of the map based on whether
  /// the key is the of type int(index) or type String(text) itself
  getKey(int i, T) {
    return i;
  }
}

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
  Row row({MainAxisAlignment mainAxisAlignment}) => Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: this,
      );
}

extension ListMdiLogoExt on List<MdiLogo> {
  List<MdiLogo> operator *(int frequency) {
    List<MdiLogo> list = List<MdiLogo>();
    for (int i = 0; i < frequency; i++) list.addAll(this);
    return list;
  }
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
