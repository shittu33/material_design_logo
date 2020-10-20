library materialdesignlogo;

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        logo = PlainText(
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

  MdiLogo.shapeText({
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
  })  : this.icon = null,
        this.iconColor = null,
        this.iconSize = null,
        logo = TextShapeLogo(
          height,
          width,
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
              padding: padding),
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
            shapeShadow ?? ShadowAsset.fbTextShadow(),
            logoShape),
        plainLogo = false,
        text = null,
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

  MdiLogo.shapeIcon({
    this.logoGradient,
    this.logoShape,
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
  })  : logo = IconShapeLogo(
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
                  BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
                ],
            shape: logoShape),
        plainLogo = false,
        text = null,
        this.textSpans = null,
        this.textStyle = null,
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

  static MdiLogo facebook({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape: BoxShape.circle,
    decoration,
    shapeRadius,
    fullText: false,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: text ?? TextAsset.fbLong,
              textStyle: textStyle,
              textSpans: textSpans,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              padding: padding,
              textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
              textAlign: textAlign,
            )
          : MdiLogo.shapeText(
              height: height,
              width: width,
              fontColor: fontColor,
              logoGradient: logoGradient,
              textStyle: textStyle,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              textShadows: textShadows,
              logoShape: logoShape,
              decoration: decoration,
              shapeRadius: shapeRadius,
              borderColor: borderColor,
              textSpans: textSpans,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.fbTextShadow(),
              text: text ??
                  (isCircle(logoShape) || !fullText
                      ? TextAsset.fbShort
                      : TextAsset.fbLong),
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              textAlign: textAlign,
              padding: padding,
              shapeColor: shapeColor,
            );

  static MdiLogo fedX({
    fontSize,
    fontColor,
    text,
    textStyle,
    textSpans,
    letterSpacing,
    fontWeight,
    fontStyle,
    fontFamily,
    padding,
    textShadows,
    textAlign,
  }) =>
      MdiLogo.plainText(
        fontSize: fontSize,
        fontColor: fontColor,
        text: text,
        textStyle: textStyle,
        textSpans: textSpans ?? TextSpanAsset.fedX(),
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        padding: padding,
        textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
        textAlign: textAlign,
      );

  static MdiLogo netflix({
    fontSize,
    fontColor,
    text,
    textStyle,
    textSpans,
    letterSpacing,
    fontWeight,
    fontStyle,
    fontFamily,
    padding,
    textShadows,
    textAlign,
  }) =>
      MdiLogo.plainText(
        fontSize: fontSize,
        fontColor: fontColor,
        text: text,
        textStyle: textStyle,
        textSpans: textSpans ?? TextSpanAsset.netflix(),
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        padding: padding,
        textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
        textAlign: textAlign,
      );

  static MdiLogo linkedln({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape: BoxShape.rectangle,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: text ?? TextAsset.linkedlnLong,
              textStyle: textStyle,
              textSpans: textSpans,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              padding: padding,
              textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
              textAlign: textAlign,
            )
          : MdiLogo.shapeText(
              height: height,
              width: width,
              fontColor: fontColor,
              logoGradient: logoGradient,
              textStyle: textStyle,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              textShadows: textShadows,
              logoShape: logoShape,
              decoration: decoration,
              shapeRadius: shapeRadius ?? BorderRadius.circular(10),
              borderColor: borderColor,
              textSpans: textSpans,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.fbTextShadow(),
              text: text ??
                  (isCircle(logoShape) || !fullText
                      ? TextAsset.linkedlnShort
                      : TextAsset.linkedlnLong),
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              textAlign: textAlign,
              padding: padding,
              shapeColor: shapeColor,
            );

  static MdiLogo google({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape: BoxShape.circle,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: text,
              textStyle: textStyle,
              textSpans: textSpans ?? TextSpanAsset.googleTexts(),
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              padding: padding,
              textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
              textAlign: textAlign,
            )
          : MdiLogo.shapeText(
              height: height,
              width: width,
              fontColor: fontColor,
              logoGradient: logoGradient,
              textStyle: textStyle,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              textShadows: textShadows,
              logoShape: logoShape,
              decoration: decoration,
              shapeRadius: shapeRadius,
              borderColor: borderColor,
              textSpans: textSpans,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.fbTextShadow(),
              text: text ?? TextAsset.googleShort,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              textAlign: textAlign,
              padding: padding,
              shapeColor: shapeColor,
            );

  static MdiLogo nestle({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      MdiLogo.plainText(
        fontSize: fontSize,
        fontColor: fontColor,
        text: text,
        textStyle: textStyle,
        textSpans: textSpans ?? TextSpanAsset.nestleTexts(),
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        padding: padding,
        textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
        textAlign: textAlign,
      );

  static MdiLogo cocacola({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      MdiLogo.plainText(
        fontSize: fontSize,
        fontColor: fontColor,
        text: text ?? 'Coca.Cola',
        textStyle: textStyle,
        textSpans: textSpans,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily ?? 'cocacola',
        padding: padding,
        textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
        textAlign: textAlign,
      );

  static MdiLogo ebay({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape: BoxShape.circle,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: text,
              textStyle: textStyle,
              textSpans: textSpans ?? TextSpanAsset.ebayTexts(),
              letterSpacing: letterSpacing ?? -7,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              padding: padding,
              textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
              textAlign: textAlign,
            )
          : MdiLogo.shapeText(
              height: height,
              width: width,
              fontColor: fontColor,
              logoGradient: logoGradient,
              textStyle: textStyle,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              textShadows: textShadows,
              logoShape: logoShape,
              decoration: decoration,
              shapeRadius: shapeRadius,
              borderColor: borderColor,
              textSpans: textSpans,
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.fbTextShadow(),
              text: text ?? "e",
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              textAlign: textAlign,
              padding: padding,
              shapeColor: shapeColor,
            );

  static MdiLogo hp({
    text,
    textStyle,
    textSpans,
    plainLogo: false,
    height,
    width,
    fontSize,
    fontColor,
    logoGradient,
    letterSpacing,
    fontWeight,
    fullText: false,
    fontStyle,
    fontFamily,
    textShadows,
    logoShape: BoxShape.circle,
    decoration,
    shapeRadius,
    borderColor,
    borderWidth,
    shapeShadow,
    textAlign,
    padding,
    shapeColor,
  }) =>
      plainLogo
          ? MdiLogo.plainText(
              fontSize: fontSize,
              fontColor: fontColor,
              text: text,
              textStyle: textStyle,
              textSpans: textSpans ?? TextSpanAsset.hpTexts(),
              letterSpacing: letterSpacing ?? -7,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              padding: padding,
              textShadows: textShadows ?? ShadowAsset.fbTextShadow(),
              textAlign: textAlign,
            )
          : MdiLogo.shapeText(
              height: height,
              width: width,
              fontColor: fontColor,
              logoGradient: logoGradient,
              textStyle: textStyle,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              textShadows: textShadows,
              logoShape: logoShape,
              decoration: decoration,
              shapeRadius: shapeRadius,
              borderColor: borderColor,
              textSpans: textSpans ?? TextSpanAsset.hpTexts(),
              borderWidth: borderWidth,
              shapeShadow: textShadows ?? ShadowAsset.fbTextShadow(),
              text: text,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              textAlign: textAlign,
              padding: padding,
              shapeColor: shapeColor,
            );

  static MdiLogo whatsApp({
    plainLogo: false,
    logoGradient,
    logoShape: BoxShape.rectangle,
    decoration,
    shapeRadius,
    borderColor: Colors.white,
    borderWidth: 2,
    shapeShadow,
    textAlign,
    padding,
    shapeColor: Colors.green,
    icon,
    iconColor,
    iconSize,
  }) =>
      MdiLogo.shapeIcon(
        logoGradient: logoGradient,
        logoShape: logoShape,
        decoration: decoration,
        shapeRadius: shapeRadius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        shapeShadow: shapeShadow,
        padding: padding,
        shapeColor: shapeColor,
        icon: icon ?? MdiIcons.whatsapp,
        iconColor: iconColor,
        iconSize: iconSize,
      );

  static MdiLogo instagram({
    plainLogo: false,
    logoGradient,
    logoShape: BoxShape.rectangle,
    decoration,
    shapeRadius,
    borderColor: Colors.white,
    borderWidth: 2,
    shapeShadow,
    textAlign,
    padding,
    shapeColor: Colors.pinkAccent,
    icon,
    iconColor,
    iconSize,
  }) =>
      MdiLogo.shapeIcon(
        logoGradient: logoGradient,
        logoShape: logoShape,
        decoration: decoration,
        shapeRadius: shapeRadius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        shapeShadow: shapeShadow,
        padding: padding,
        shapeColor: shapeColor,
        icon: icon ?? MdiIcons.instagram,
        iconColor: iconColor,
        iconSize: iconSize,
      );

  static MdiLogo twitter(
          {plainLogo: false,
          logoGradient,
          logoShape: BoxShape.rectangle,
          decoration,
          shapeRadius,
          borderColor: Colors.white,
          borderWidth: 2,
          shapeShadow,
          textAlign,
          padding,
          shapeColor: Colors.blueAccent,
          icon,
          iconColor,
          iconSize}) =>
      MdiLogo.shapeIcon(
        logoGradient: logoGradient,
        logoShape: logoShape,
        decoration: decoration,
        shapeRadius: shapeRadius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        shapeShadow: shapeShadow,
        padding: padding,
        shapeColor: shapeColor,
        icon: icon ?? MdiIcons.twitter,
        iconColor: iconColor,
        iconSize: iconSize,
      );

  static MdiLogo microsoft(
          {plainLogo: false,
          logoGradient,
          logoShape: BoxShape.rectangle,
          decoration,
          shapeRadius,
          borderColor: Colors.white,
          borderWidth: 2,
          shapeShadow,
          textAlign,
          padding,
          shapeColor: Colors.blueAccent,
          icon,
          iconColor,
          iconSize}) =>
      MdiLogo.shapeIcon(
        logoGradient: logoGradient,
        logoShape: logoShape,
        decoration: decoration,
        shapeRadius: shapeRadius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        shapeShadow: shapeShadow,
        padding: padding,
        shapeColor: shapeColor,
        icon: icon ?? MdiIcons.microsoftWindowsClassic,
        iconColor: iconColor,
        iconSize: iconSize,
      );

  static MdiLogo apple(
          {plainLogo: false,
          logoGradient,
          logoShape: BoxShape.rectangle,
          decoration,
          shapeRadius,
          borderColor: Colors.white,
          borderWidth: 2,
          shapeShadow,
          textAlign,
          padding,
          shapeColor: Colors.black,
          widget,
          icon,
          iconColor,
          iconSize}) =>
      MdiLogo.shapeIcon(
        logoGradient: logoGradient,
        logoShape: logoShape,
        decoration: decoration,
        shapeRadius: shapeRadius,
        borderColor: borderColor,
        borderWidth: borderWidth,
        shapeShadow: shapeShadow,
        padding: padding,
        shapeColor: shapeColor,
        icon: icon ?? MdiIcons.apple,
        iconColor: iconColor,
        iconSize: iconSize,
      );

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
                text: TextAsset.xBox,fontSize: 43,
                fontWeight: FontWeight.w200,
                fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapeIcon(
              icon: MdiIcons.microsoftXbox,
              iconColor: Colors.white,
              shapeColor: Colors.green,
            ),
      );
  static   Widget materialDesignLogo(
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
        content: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: content ??
              MdiLogo.plainText(
//                fontFamily: 'x360',
                text: 'Studio',
                textStyle: TextStyle(
                  fontSize: 43,
                  letterSpacing: 1,
                  fontFamily: 'Roboto',
                  decoration: TextDecoration.combine([
                    TextDecoration.overline,
                    TextDecoration.underline,
                  ]),
                  decorationThickness: 3,
                  decorationStyle: TextDecorationStyle.dotted,
//                  decorationColor: Colors.grey,
                  color: Colors.grey[600],
                ),
              ),
        ),
        lead: lead ??
            MdiLogo.shapeWidget(
              padding: EdgeInsets.only(top:
              8,left:9),
              width: 140,
//              borderWidth: 1,
              widget: MdiLogo.plainText(padding: EdgeInsets.only(top:
              15),
                  fontSize: 66,
                  letterSpacing: 1,
                  fontFamily: 'Marvel',
                  text: 'MdiLOGO',
                  fontColor: Colors.white),
              shapeColor: Colors.red,
              logoShape: BoxShape.rectangle,
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
                text: TextAsset.microsoft, fontColor: Colors.green),
        lead: lead ??
            MdiLogo.shapeIcon(
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
            MdiLogo.shapeIcon(
              icon: MdiIcons.adobe,
              iconColor: Colors.red,
              shapeColor: Colors.white,
              iconSize: 53,
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
            MdiLogo.shapeIcon(
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
            MdiLogo.linkedln(plainLogo: true, fontColor: Colors.black),
        lead: lead ?? MdiLogo.linkedln(plainLogo: false, borderWidth: 2),
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
//              fontFamily: 'bebas-neue',
              fontStyle: FontStyle.normal,
              text: "Instagram",
              textShadows: ShadowAsset.fbTextShadow(),
              textAlign: TextAlign.center,
            ),
        lead: lead ?? MdiLogo.instagram(),
      );

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
