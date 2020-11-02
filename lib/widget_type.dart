import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:materialdesignlogo/assets/sizes.dart';
import 'package:materialdesignlogo/assets/style.dart';

import 'basic.dart';

class PlainText with LogoProvider {
  String text;
  TextStyle textStyle;
  final double fontSize;
  final double letterSpacing;
  final List<Shadow> textShadows;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color fontColor;
  final FontStyle fontStyle;
  final List<InlineSpan> textSpan;
  EdgeInsetsGeometry padding;

  PlainText({
    this.fontSize,
    this.letterSpacing,
    this.textShadows,
    this.text,
    this.textStyle,
    this.textAlign,
    this.fontWeight,
    this.fontFamily,
    this.fontColor,
    this.fontStyle,
    this.textSpan,
    this.padding,
  });

  String textData() => text ?? "logo Name";

  double textSize() => (fontSize ?? 28);

  letterSpace() => letterSpacing ?? -1.2;

  @override
  TextAlign alignment() => textAlign ?? TextAlign.start;

  TextStyle style() =>
      textStyle ??
      TextStyle(
          shadows: textShadows,
          color: fontColor ?? MdiStyle.accent,
          fontSize: textSize(),
          fontWeight: fontWeight ?? FontWeight.bold,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontFamily: fontFamily,
          letterSpacing: letterSpace());

  Widget child() => (textSpan != null
      ? AutoSizeText.rich(
          TextSpan(children: textSpan),
          maxLines: 2,
          textAlign: alignment(),
          style: style(),
        )
      : AutoSizeText(
          textData(),
          maxLines: 2,
          textAlign: alignment(),
          style: style(),
        ));

  @override
  EdgeInsetsGeometry contentPadding() => padding;
}

class TextShapeLogo extends ShapeLogo {
  final PlainText plainText;
  final Decoration decoration;
  final BorderRadiusGeometry shapeRadius;
  final Color borderColor;
  final Color shapeColor;
  final double borderWidth;
  final Gradient shapeGradient;
  final List<BoxShadow> shapeShadow;
  final BoxShape shape;
  final double height;
  final double width;
  final double textHeight;

  TextShapeLogo(
    this.height,
    this.width,
    this.textHeight,
    this.decoration,
    this.shape,
    this.shapeRadius,
    this.borderColor,
    this.shapeColor,
    this.borderWidth,
    this.shapeGradient,
    this.shapeShadow,
    this.plainText,
  ) : super(decoration, shapeRadius, borderColor, shapeColor, borderWidth,
            shapeGradient, shapeShadow, shape, height, width, EdgeInsets.zero);

  static double exposedCustomSize(height, width) =>
      height ?? (width ?? appBarLogoHeight);

  double customSize() => exposedCustomSize(height, width);

  static double calculateTextSize(fontSize, height, width, isCircle) =>
      (fontSize ?? (exposedCustomSize(height, width) * (isCircle ? 1 : 0.6)));

  double textSize() =>
      calculateTextSize(plainText.fontSize, height, width, isCircle);

  double calculateFinalTextSize() {
    return plainText.textSpan == null
        ? (textSize() + letterSpace())
        : (spanTextSize((plainText.fontSize) ?? 0 + (letterSpace())));
  }

  bool get isCircle => shape == BoxShape.circle;

  TextAlign alignment() => plainText.textAlign ?? TextAlign.center;

  letterSpace() => plainText.letterSpacing ?? -1.2;

  String textData() => plainText.text ?? (isCircle ? "T" : "Text");

  bool get isMulti => txtLength() > 1;

  bool get isShort => isMulti && txtLength() < 5;

  @override
  double calculateMaximumWidth() {
    double max;
    if (isMulti || isShort)
      max = width ??
          (customSize() +
              (calculateFinalTextSize() *
                  (txtLength() * (isShort ? 0.2 : 0.40))));
    else
      max = width ?? (calculateFinalTextSize());
    print('maximum width is $max');
    return max;
  }

  @override
  double calculateMaximumHeight() {
    double max;
    if (isMulti || isShort)
      max = height ??
          (customSize() + (calculateFinalTextSize() * (isShort ? 0.38 : 0.4)));
    else
      max = height ?? (calculateFinalTextSize());
    print('maximum height is $max');
    return max;
  }

  int spanTextLength() {
    int length = 0;
    for (TextSpan textSpan in plainText.textSpan)
      length += (textSpan?.text?.length) ?? 0;
    return length;
  }

  double spanTextSize(double initialSize) {
    double size = initialSize ?? 0;
    double space = initialSize ?? 0;
    double total = 0;
    int count = 0;
    for (TextSpan textSpan in plainText.textSpan) {
      var newSize = textSpan?.style?.fontSize ?? 0;
      var spacing = (textSpan?.style?.letterSpacing) ?? 0;
      size += newSize;
      space += spacing;
      count++;
    }
    total = (size / count) + (space / count);
    print(total);
    return total;
  }

  txtLength() =>
      plainText.textSpan == null ? textData()?.length ?? 0 : spanTextLength();

  @override
  EdgeInsetsGeometry contentPadding() => plainText.padding;

  @override
  Widget child() {
    plainText.text = textData();
    plainText.textStyle = plainText.textStyle ??
        TextStyle(
            height: textHeight,
            color: plainText.fontColor ?? MdiStyle.white,
            fontSize: textSize(),
            fontWeight: plainText.fontWeight ?? FontWeight.w700,
            fontStyle: plainText.fontStyle ?? FontStyle.normal,
            fontFamily: plainText.fontFamily,
            shadows: plainText.textShadows,
            letterSpacing: letterSpace());
    return Padding(
      padding: plainText.padding ?? EdgeInsets.zero,
      child: plainText.child(),
    );
  }
}

class IconShapeLogo extends WidgetShapeLogo {
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final BorderRadiusGeometry shapeRadius;
  final Color borderColor;
  final Color shapeColor;
  final double borderWidth;
  final Gradient shapeGradient;
  final List<BoxShadow> shapeShadow;
  final BoxShape shape;

  final iconColor;
  final icon;
  final double iconSize;

  IconShapeLogo(
      {this.icon,
      this.iconColor,
      this.iconSize,
      this.padding,
      this.decoration,
      this.shapeRadius,
      this.borderColor,
      this.shapeColor,
      this.borderWidth,
      this.shapeGradient,
      this.shapeShadow,
      this.shape})
      : assert(icon != null),
        super(
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: getIconSize(iconSize),
            ),
            getIconSize(iconSize) + (getIconSize(iconSize) * 0.33),
            getIconSize(iconSize) + (getIconSize(iconSize) * 0.3),
            padding,
            decoration,
            shapeRadius,
            borderColor,
            shapeColor,
            borderWidth,
            shapeGradient,
            shapeShadow,
            shape);

  static getIconSize(double iconSize) => iconSize ?? 33.0;
}

class WidgetShapeLogo extends ShapeLogo {
  final Widget widget;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final BorderRadiusGeometry shapeRadius;
  final Color borderColor;
  final Color shapeColor;
  final double borderWidth;
  final Gradient shapeGradient;
  final List<BoxShadow> shapeShadow;
  final BoxShape shape;

  WidgetShapeLogo(
    this.widget,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.shapeRadius,
    this.borderColor,
    this.shapeColor,
    this.borderWidth,
    this.shapeGradient,
    this.shapeShadow,
    this.shape,
  )   : assert(widget != null),
        super(decoration, shapeRadius, borderColor, shapeColor, borderWidth,
            shapeGradient, shapeShadow, shape, height, width, padding);

  @override
  EdgeInsetsGeometry contentPadding() => padding;

  @override
  TextAlign alignment() => TextAlign.center;

  @override
  double calculateMaximumHeight() => height ?? 60;

  @override
  double calculateMaximumWidth() => width ?? 60;

  @override
  Widget child() => widget;
}

enum LeadGravity {
  top,
  start,
  end,
  bottom,
}

class CombinedLogo extends StatelessWidget implements LogoProvider {
  final MainAxisAlignment mainAxisAlignment;
  final LeadGravity leadGravity;
  final EdgeInsetsGeometry padding;
  final Widget lead;
  final Widget content;
  final double gap;

  CombinedLogo(this.leadGravity, this.padding, this.lead, this.content,
      {this.mainAxisAlignment: MainAxisAlignment.start, this.gap});

  @override
  TextAlign alignment() => TextAlign.center;

  Widget get rawChild {
    var gap = this.gap ?? 5.0;
    if (leadGravity == LeadGravity.top) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [lead, VSpace(gap), content]);
    } else if (leadGravity == LeadGravity.start) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [lead, HSpace(gap), content]);
    } else if (leadGravity == LeadGravity.end) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [content, HSpace(gap), lead]);
    } else {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [content, VSpace(gap), lead]);
    }
  }

  @override
  Widget child() {
    return Container(
      child: rawChild,
    );
  }

  @override
  EdgeInsetsGeometry contentPadding() => padding ?? EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return child();
  }
}

class HSpace extends StatelessWidget {
  final double width;

  const HSpace([this.width]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 10,
    );
  }
}

class VSpace extends StatelessWidget {
  final double height;

  const VSpace([this.height]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10,
    );
  }
}
