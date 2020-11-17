import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:materialdesignlogo/assets/sizes.dart';
import 'package:materialdesignlogo/assets/strings.dart';
import 'package:materialdesignlogo/assets/style.dart';
import 'package:materialdesignlogo/materialdesignlogo.dart';

import 'basic.dart';

class PlainTextLogo with LogoProvider {
  String text;
  TextStyle textStyle;
  double fontSize;
  double letterSpacing;
  List<Shadow> textShadows;
  TextAlign textAlign;
  FontWeight fontWeight;
  String fontFamily;
  String package;
  Color fontColor;
  FontStyle fontStyle;
  List<InlineSpan> textSpan;
  EdgeInsetsGeometry padding;
  double textHeight;
  double width;
  double height;

  PlainTextLogo({
    this.fontSize,
    this.letterSpacing,
    this.textShadows,
    this.text,
    this.textHeight,
    this.width,
    this.height,
    this.textStyle,
    this.textAlign,
    this.fontWeight,
    this.fontFamily,
    this.package,
    this.fontColor,
    this.fontStyle,
    this.textSpan,
    this.padding,
  });

  @override
  double widgetWidth() => width;

  @override
  double widgetHeight() => height;

  String textData() => text ?? "logo Name";

  double textSize() => (fontSize ?? 28);

  letterSpace() => letterSpacing ?? -1.2;

  @override
  TextAlign alignment() => textAlign ?? TextAlign.start;

  TextStyle style() =>
      textStyle ??
      TextStyle(
          package: package,
          shadows: textShadows,
          color: fontColor ?? MdiStyle.accent,
          fontSize: textSize(),
          fontWeight: fontWeight ?? FontWeight.bold,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontFamily: fontFamily,
          height: textHeight,
          letterSpacing: letterSpace());

  Widget child() {
    var autoSizeText = (textSpan != null
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
    Widget textWidget = autoSizeText;
    var alignedChild = alignment() == TextAlign.center
        ? Center(child: textWidget)
        : textWidget;
//    if (contentPadding() != null) {
//      return Padding(
//        padding: contentPadding(),
//        child: textWidget,
//      );
//    } else
//      return textWidget;
    return alignedChild;
  }

  @override
  EdgeInsetsGeometry contentPadding() => padding;
}

class TextShapeLogo extends ShapeLogo {
  PlainTextLogo plainText;
  Decoration decoration;
  BorderRadiusGeometry shapeRadius;
  Color borderColor;
  Color shapeColor;
  double borderWidth;
  Gradient shapeGradient;
  Color shadowColor;
  LogoShape shape;
  bool noShape;
  double elevation;
  double height;
  double width;
  double textHeight;
  InkWellGesture inkWellGesture;

  TextShapeLogo({
    this.height,
    this.width,
    this.inkWellGesture,
    this.textHeight,
    this.decoration,
    this.shape,
    this.noShape,
    this.shapeRadius,
    this.borderColor,
    this.shapeColor,
    this.borderWidth,
    this.shapeGradient,
    this.shadowColor,
    this.elevation,
    this.plainText,
  }) : super(
            decoration,
            shapeRadius,
            borderColor,
            shapeColor,
            borderWidth,
            shapeGradient,
            shadowColor,
            shape,
            height,
            width,
            false,
            noShape ?? false,
            elevation,
            inkWellGesture,
            EdgeInsets.zero);

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

  bool get isCircle => shape == LogoShape.circle;

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
  EdgeInsetsGeometry contentPadding() => null;

  @override
  Widget shapeChild() {
    plainText.text = textData();
    plainText.textAlign = alignment();
    plainText.textStyle = plainText.textStyle ??
        TextStyle(
            height: textHeight,
            color: plainText.fontColor ?? MdiStyle.white,
            fontSize: textSize(),
            fontWeight: plainText.fontWeight ?? FontWeight.w700,
            fontStyle: plainText.fontStyle ?? FontStyle.normal,
            fontFamily: plainText.fontFamily,
            shadows: plainText.textShadows,
            package: plainText.package,
            letterSpacing: letterSpace());
    return plainText.sizedChild();
  }
}

class IconShapeLogoData extends WidgetShapeLogo {
  EdgeInsetsGeometry padding;
  Decoration decoration;
  BorderRadiusGeometry shapeRadius;
  Color borderColor;
  Color shapeColor;
  double borderWidth;
  Gradient shapeGradient;
  Color shadowColor;
  LogoShape shape;
  double elevation;
  Color iconColor;
  IconData icon;
  bool noShape = false;
  double iconSize;
  InkWellGesture inkWellGesture;

  IconShapeLogoData(
      {this.icon,
      this.iconColor,
      this.iconSize,
      this.padding,
      this.decoration,
      this.inkWellGesture,
      this.shapeRadius,
      this.borderColor,
      this.shapeColor,
      this.borderWidth,
      this.shapeGradient,
      this.shadowColor,
      this.noShape,
      this.elevation,
      this.shape})
      : super(
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: getIconSize(iconSize),
            ),
            getHeightFromIcon(iconSize),
            getWidthFromIcon(iconSize),
            padding,
            decoration,
            shapeRadius,
            borderColor,
            shapeColor,
            borderWidth,
            shapeGradient,
            shadowColor,
            noShape,
            elevation,
            inkWellGesture,
            shape);

  static getWidthFromIcon(double iconSize) =>
      getIconSize(iconSize) + (getIconSize(iconSize) * 0.3);

  static getHeightFromIcon(double iconSize) =>
      getIconSize(iconSize) + (getIconSize(iconSize) * 0.33);

  static getIconSize(double iconSize) => iconSize ?? 33.0;

  static calcIconSizeFromSize(double widgetSize) =>
      widgetSize - (widgetSize * 0.33);
}

class WidgetShapeLogo extends ShapeLogo {
  Widget widget;
  double height;
  double width;
  EdgeInsetsGeometry padding;
  Decoration decoration;
  BorderRadiusGeometry shapeRadius;
  Color borderColor;
  Color shapeColor;
  double borderWidth;
  double elevation;
  Gradient shapeGradient;
  bool noShape = false;
  Color shadowColor;
  LogoShape shape;
  InkWellGesture inkWellGesture;

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
    this.shadowColor,
    this.noShape,
    this.elevation,
    this.inkWellGesture,
    this.shape,
  )   : assert(widget != null),
        super(
            decoration,
            shapeRadius,
            borderColor,
            shapeColor,
            borderWidth,
            shapeGradient,
            shadowColor,
            shape,
            height,
            width,
            false,
            noShape,
            elevation,
            inkWellGesture,
            padding);

  @override
  EdgeInsetsGeometry contentPadding() => padding;

  @override
  TextAlign alignment() => TextAlign.center;

  @override
  double calculateMaximumHeight() => height ?? 60;

  @override
  double calculateMaximumWidth() => width ?? 60;

  @override
  Widget shapeChild() => widget;
}

class MultiShapedTextLogo with LogoProvider {
  String text = 'TEXT';

  /// How much space to place between children in a run in the main axis.
  double letterSpacing;

  /// How much space to place between the runs themselves in the cross axis.
  ///
  /// For example, if [runSpacing] is 10.0, the runs will be spaced at least
  /// 10.0 logical pixels apart in the cross axis.
  double runSpacing = 1.0;
  Map<dynamic, EdgeInsetsGeometry> padding;
  Axis direction;
  WrapAlignment widgetAlignment = WrapAlignment.center;

  /// The width of this widget itself
  double logoWidth;

  /// The height of this widget itself
  double logoHeight;
  Map<dynamic, TextStyle> textStyle;
  Map<dynamic, TextAlign> childAlignment;

  /// The heigth of each logo child
  Map<dynamic, double> height;

  /// The width of each logo child
  Map<dynamic, double> width;
  Map<dynamic, bool> noShape;
  Map<dynamic, double> textHeight;
  Map<dynamic, double> fontSize;
  Map<dynamic, Color> fontColor;
  Map<dynamic, double> spanLetterSpacing;
  Map<dynamic, Gradient> logoGradient;
  Map<dynamic, FontWeight> fontWeight;
  Map<dynamic, FontStyle> fontStyle;
  Map<dynamic, String> fontFamily;
  Map<dynamic, String> package;
  Map<dynamic, List<Shadow>> textShadows;
  Map<dynamic, LogoShape> logoShape;
  Map<dynamic, BoxDecoration> decoration;
  Map<dynamic, BorderRadius> shapeRadius;
  Map<dynamic, Color> borderColor;
  Map<dynamic, double> borderWidth;
  Map<dynamic, double> elevation;
  Map<dynamic, Color> shadowColor;
  Map<dynamic, Color> shapeColor;
  Map<dynamic, InkWellGesture> inkWellGesture;

  MultiShapedTextLogo(
      {this.text,
      this.padding,
      this.letterSpacing,
      this.runSpacing,
      this.widgetAlignment,
      this.childAlignment,
      this.textStyle,
      this.direction,
      this.height,
      this.width,
      this.logoWidth,
      this.logoHeight,
      this.textHeight,
      this.fontSize,
      this.fontColor,
      this.spanLetterSpacing,
      this.logoGradient,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.package,
      this.textShadows,
      this.logoShape,
      this.noShape,
      this.decoration,
      this.shapeRadius,
      this.borderColor,
      this.borderWidth,
      this.shadowColor,
      this.elevation,
      this.inkWellGesture,
      this.shapeColor});

  @override
  TextAlign alignment() => TextAlign.start;

  @override
  EdgeInsetsGeometry contentPadding() => EdgeInsets.zero;

  @override
  double widgetHeight() => logoHeight;

  @override
  double widgetWidth() => logoWidth;

  @override
  Widget child() {
    height = height.splitKeysToIndexes(text);
    width = width.splitKeysToIndexes(text);
    padding = padding.splitKeysToIndexes(text);
    inkWellGesture = inkWellGesture.splitKeysToIndexes(text);
    childAlignment = childAlignment.splitKeysToIndexes(text);
    textHeight = textHeight.splitKeysToIndexes(text);
    elevation = elevation.splitKeysToIndexes(text);
    textStyle = textStyle.splitKeysToIndexes(text);
    fontSize = fontSize.splitKeysToIndexes(text);
    fontColor = fontColor.splitKeysToIndexes(text);
    spanLetterSpacing = spanLetterSpacing.splitKeysToIndexes(text);
    logoGradient = logoGradient.splitKeysToIndexes(text);
    fontWeight = fontWeight.splitKeysToIndexes(text);
    fontStyle = fontStyle.splitKeysToIndexes(text);
    fontFamily = fontFamily.splitKeysToIndexes(text);
    package = package.splitKeysToIndexes(text);
    textShadows = textShadows.splitKeysToIndexes(text);
    logoShape = logoShape.splitKeysToIndexes(text);
    noShape = noShape.splitKeysToIndexes(text);
    decoration = decoration.splitKeysToIndexes(text);
    shapeRadius = shapeRadius.splitKeysToIndexes(text);
    borderColor = borderColor.splitKeysToIndexes(text);
    borderWidth = borderWidth.splitKeysToIndexes(text);
    shadowColor = shadowColor.splitKeysToIndexes(text);
    shapeColor = shapeColor.splitKeysToIndexes(text);
    return Wrap(
      direction: direction ?? Axis.horizontal,
      spacing: letterSpacing ?? 1,
      runSpacing: runSpacing,
      alignment: widgetAlignment,
      children: [
        for (int i = 0; i < text.length; i++)
          Padding(
            padding: padding[i] ?? EdgeInsets.zero,
            child: TextShapeLogo(
              height: height[i],
              width: width[i],
              noShape: noShape[i] ?? false,
              textHeight: textHeight[i],
              elevation: elevation[i],
              inkWellGesture: inkWellGesture[i],
              plainText: PlainTextLogo(
                textAlign: childAlignment[i],
                package: package[i],
                fontColor: fontColor[i],
                textStyle: textStyle[i],
                letterSpacing: spanLetterSpacing[i],
                fontWeight: fontWeight[i],
                fontStyle: fontStyle[i],
                fontFamily: fontFamily[i],
                textShadows: textShadows[i],
                text: text[i],
                fontSize: fontSize[i],
              ),
              shapeGradient: logoGradient[i],
              shape: logoShape[i] ?? LogoShape.roundedRectangle,
              decoration: decoration[i],
              shapeRadius: shapeRadius[i],
              borderColor: borderColor[i],
              borderWidth: borderWidth[i],
              shadowColor: shadowColor[i],
              shapeColor: shapeColor[i] ?? Colors.grey[800],
            ).sizedChild(),
          ),
      ],
    );
  }
}

class RichTextLogo with LogoProvider {
  String text = 'TEXT';
  double letterSpacing;
  double width;
  double height;
  TextAlign textAlign;
  EdgeInsetsGeometry padding;
  Map<dynamic, double> spanLetterSpacing;
  Map<dynamic, double> decorationThickness;
  Map<dynamic, double> textHeight;
  Map<dynamic, TextStyle> textStyle;
  Map<dynamic, double> fontSize;
  Map<dynamic, double> elevation;
  Map<dynamic, Color> fontColor;
  Map<dynamic, FontWeight> fontWeight;
  Map<dynamic, FontStyle> fontStyle;
  Map<dynamic, String> fontFamily;
  Map<dynamic, String> package;
  Map<dynamic, TextDecoration> textDecoration;
  Map<dynamic, TextDecorationStyle> textDecorationStyle;
  Map<dynamic, List<Shadow>> textShadows;

  RichTextLogo(
      {this.text,
      this.padding,
      this.letterSpacing,
      this.textAlign,
      this.spanLetterSpacing,
      this.decorationThickness,
      this.textHeight,
      this.height,
      this.width,
      this.textStyle,
      this.fontSize,
      this.fontColor,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.package,
      this.textDecoration,
      this.textDecorationStyle,
      this.textShadows});

  @override
  TextAlign alignment() => TextAlign.start;

  @override
  Widget child() {
    decorationThickness = decorationThickness.splitKeysToIndexes(text);
    package = package.splitKeysToIndexes(text);
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

    return PlainTextLogo(
      padding: padding ?? EdgeInsets.zero,
      textAlign: textAlign,
      letterSpacing: letterSpacing,
      textSpan: [
        for (int i = 0; i < text.length; i++)
          TextSpan(
            text: text[i],
            style: textStyle[i] ??
                TextStyle(
                  package: package[i],
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
    ).sizedChild();
  }

  @override
  EdgeInsetsGeometry contentPadding() => EdgeInsets.zero;

  @override
  double widgetHeight() => height;

  @override
  double widgetWidth() => width;
}

//class LabeledLogos implements LogoProvider {
//
//}
class WrapLogos with LogoProvider {
  List<MdiLogo> logos;
  double size;
  double runSpacing;
  double spacing;
  double elevation;
  double wrapWidth;
  double wrapHeight;
  Axis direction;
  WrapAlignment wrapAlignment;
  Decoration decoration;
  BorderRadiusGeometry shapeRadius;
  Color borderColor;
  Color shapeColor;
  double borderWidth;
  Gradient shapeGradient;
  Color shadowColor;
  Color childColor;
  LogoShape shape;
  EdgeInsetsGeometry contPadding;
  LeadGravity labelLogoGravity;
  PlainTextLogo labelLogoData;
  InkWellGesture Function(int index, LogoProvider logo, List<MdiLogo> logos)
      inkWellGesture;

  WrapLogos(
      {this.logos,
      this.size,
      this.runSpacing,
      this.spacing,
      this.wrapWidth,
      this.wrapHeight,
      this.direction,
      this.wrapAlignment,
      this.decoration,
      this.shapeRadius,
      this.borderColor,
      this.shapeColor,
      this.borderWidth,
      this.shapeGradient,
      this.shadowColor,
      this.childColor,
      this.elevation,
      this.inkWellGesture,
      this.shape,
      this.contPadding,
      this.labelLogoData,
      this.labelLogoGravity,
      });

  @override
  Widget child() {
    List<Widget> newLogos = List();
    double width = IconShapeLogoData.getHeightFromIcon(size);
    double height = IconShapeLogoData.getWidthFromIcon(size);
    for (int i = 0; i < logos?.length; i++) {
      MdiLogo mdiLogo = logos[i];
      var rawLogo = mdiLogo.logo;
      width = mdiLogo.logo is DoubleLogo ||
              mdiLogo.logo is MultiShapedTextLogo ||
              mdiLogo.logo is RichTextLogo ||
              mdiLogo.logo is PlainTextLogo
          ? null
          : width;
      mdiLogo = shapeUnShapedLogo(mdiLogo, height, childColor);
      var _inkWellGesture = (inkWellGesture != null
          ? inkWellGesture(i, rawLogo, logos)
          : null) ;

      if (mdiLogo.logo is ShapeLogo) {
        ShapeLogo logo = mdiLogo.logo;
        if (mdiLogo.logo is IconShapeLogoData) {
          var iconLogo = logo as IconShapeLogoData;
          iconLogo.widget = Icon(
            mdiLogo.icon ?? iconLogo.icon,
            color: childColor ?? iconLogo.iconColor ?? Colors.white,
            size: size,
          );
          width = height;
          height = width;
        } else if (mdiLogo.logo is TextShapeLogo) {
          var logo = mdiLogo.logo as TextShapeLogo;
          logo.plainText.fontColor = childColor;
        } else if (mdiLogo.logo is WidgetShapeLogo) {}
        logo.width = width;
        logo.height = height;
        logo.shape = shape ?? logo.shape;
        logo.shapeRadius =
            shapeRadius ?? logo.shapeRadius ?? BorderRadius.circular(0);
        logo.borderWidth = borderWidth ?? 1;
        logo.borderColor = borderColor ?? logo.borderColor;
        logo.shapeColor = shapeColor ?? logo.shapeColor;
        logo.shapeColor = shapeColor ?? logo.shapeColor;
        logo.shapeGradient = shapeGradient ?? logo.shapeGradient;
        logo.shadowColor = shadowColor ?? logo.shadowColor;
        logo.contPadding = contPadding ?? logo.contPadding;
        logo.decoration = decoration ?? logo.decoration;
        logo.elevation = elevation ?? logo.elevation;
        logo.inkWellGesture = _inkWellGesture??
            logo.inkWellGesture;

      }else if(mdiLogo.logo is LabeledLogo){
        var logo = mdiLogo.logo as LabeledLogo;
        logo.size=size??logo.size;
        logo.logoGravity=labelLogoGravity??logo.logoGravity;
        logo.padding=contPadding??logo.padding;
        logo.labelData=labelLogoData??logo.labelData;
        logo.inkWellGesture = _inkWellGesture??
            logo.inkWellGesture;
      } else {
        throw('Unsupported Logo type');
        //Not supported
      }
      newLogos.add(
        mdiLogo,
      );
    }
    return Wrap(
      children: newLogos,
      direction: direction ?? Axis.horizontal,
      runSpacing: runSpacing,
      spacing: spacing,
      alignment: wrapAlignment,
    );
  }

  MdiLogo shapeUnShapedLogo(MdiLogo mdiLogo, double height, Color childColor) {
    if (mdiLogo.logo is PlainTextLogo) {
      var logo = mdiLogo.logo as PlainTextLogo;
      mdiLogo = MdiLogo.shapedTextLogo(
        fontColor: childColor,
        textShapeData: TextShapeLogo(plainText: logo),
      );
    } else if (mdiLogo.logo is RichTextLogo) {
      var logo = mdiLogo.logo as RichTextLogo;
      logo.fontSize = ~(height * 0.3);
      logo.spanLetterSpacing = ~1.1;
      logo.textDecoration = ~null;
      var _fontColor = childColor;
      logo.fontColor = childColor != null ? ~childColor : logo.fontColor;
      //        logo.fontColor=~Colors.white;
      mdiLogo = MdiLogo.shapedWidget(
        widget: mdiLogo,
      );
    } else if (mdiLogo.logo is DoubleLogo) {
      if (mdiLogo.lead != null) {
        var leadLogo = mdiLogo.lead.logo;
        if (leadLogo is ShapeLogo) {
          double sizeMultiplier = 0.5;
          if (leadLogo is IconShapeLogoData) {
            sizeMultiplier = leadLogo.noShape ? 0.4 : 0.3;
            leadLogo.widget = Icon(
              leadLogo.icon,
              color: leadLogo.iconColor ?? Colors.white,
              size: height * sizeMultiplier,
            );
          } else
            sizeMultiplier = 0.5;
          leadLogo.height = height * sizeMultiplier;
          leadLogo.width = height * sizeMultiplier;
        }
      }
      if (mdiLogo.content != null) {
        bool isVertical = mdiLogo.leadGravity == LeadGravity.top ||
            mdiLogo.leadGravity == LeadGravity.bottom;
        double sizeMultiplier = isVertical ? 0.3 : 0.5;
        var contentLogo = mdiLogo.content.logo;
        if (contentLogo is PlainTextLogo) {
          if (contentLogo.text != null) {
            bool needResize = contentLogo.fontSize != null
                ? contentLogo.fontSize > (33.0 * 0.1)
                : true;
            contentLogo.fontColor = childColor;
            contentLogo.fontSize =
                needResize ? height * sizeMultiplier : contentLogo.fontSize;
          } else if (contentLogo.textSpan != null) {}
        }
      }
      mdiLogo = MdiLogo.shapedWidget(
        padding: EdgeInsets.symmetric(horizontal: 6),
        widget: mdiLogo.logo.sizedChild(),
      );
      var logo = mdiLogo.logo as ShapeLogo;
      logo.noConstraint = true;
    } else if (mdiLogo.logo is MultiShapedTextLogo) {
      var logo = mdiLogo.logo as MultiShapedTextLogo;
      logo.fontSize = ~(height * 0.4);
      logo.fontColor = ~childColor;
      logo.shapeColor = ~Colors.transparent;
      logo.shadowColor = ~Colors.transparent;
      logo.borderColor = ~Colors.transparent;
      logo.borderWidth = ~0.0;
      mdiLogo = MdiLogo.shapedWidget(
        widget: mdiLogo,
      );
    }
    return mdiLogo;
  }

  @override
  TextAlign alignment() => TextAlign.start;

  @override
  EdgeInsetsGeometry contentPadding() => EdgeInsets.zero;

  @override
  double widgetHeight() => wrapHeight;

  @override
  double widgetWidth() => wrapWidth;
}

class LabeledLogo with LogoProvider {
  MdiLogo logo;
  String logoLabel;
  double size;
  PlainTextLogo labelData;
  InkWellGesture inkWellGesture;
  LeadGravity logoGravity;
  EdgeInsetsGeometry padding;
  MainAxisAlignment mainAxisAlignment;

  LabeledLogo(
    this.logo, {
    this.logoLabel: 'Logo Label',
    this.size: 80,
    this.labelData,
    this.inkWellGesture,
    this.logoGravity,
    this.padding,
    this.mainAxisAlignment: MainAxisAlignment.center,
  });

  @override
  TextAlign alignment() => TextAlign.start;

  @override
  Widget child() {
    var logoData = logo.logo;
    double widgetSize = size;
    double childSize = widgetSize * 0.41;
    double labelSize = widgetSize * 0.3;
    double childWidth = IconShapeLogoData.getWidthFromIcon(childSize);
    double childHeight = IconShapeLogoData.getHeightFromIcon(childSize);
    if (logoData is ShapeLogo) {
      logoData.inkWellGesture = inkWellGesture;
      if (logoData is IconShapeLogoData) {
        logoData.widget = Icon(
          logo.icon,
          color: logo.iconColor ?? Colors.white,
          size: IconShapeLogoData.getIconSize(childSize),
        );
      }
      logoData.width = childWidth;
      logoData.height = childHeight;
    } else if (logoData is PlainTextLogo) {
      logoData.width = childWidth;
      logoData.height = childHeight;
    }
    return DoubleLogo(
      width: widgetSize,
      height: widgetSize,
      padding: padding,
      mainAxisAlignment: mainAxisAlignment,
      leadGravity: logoGravity ?? LeadGravity.top,
      lead: logo,
      content: MdiLogo.plainText(
        height: labelSize,
        plainTextData: labelData,
        text: logoLabel,
        fontSize: 12,
        fontWeight: FontWeight.w100,
        fontColor: Colors.black,
      ),
    ).sizedChild();
  }

  @override
  EdgeInsetsGeometry contentPadding() => EdgeInsets.zero;

  @override
  double widgetHeight() => null;

  @override
  double widgetWidth() => null;
}

class DoubleLogo with LogoProvider {
  MainAxisAlignment mainAxisAlignment;
  LeadGravity leadGravity;
  EdgeInsetsGeometry padding;
  MdiLogo lead;
  MdiLogo content;
  double gap;
  double width;
  double height;

  DoubleLogo({
    this.leadGravity,
    this.padding,
    this.lead,
    this.width,
    this.height,
    this.content,
    this.mainAxisAlignment: MainAxisAlignment.start,
    this.gap,
  });

  Widget get rawChild {
    var gap = this.gap ?? 5.0;
    var contentLogo = content.logo;
    var leadLogo = lead.logo;
    var contentWidget = contentLogo.sizedChild();
    var leadWidget = leadLogo.sizedChild();
//    contentLogo.a
    if (leadGravity == LeadGravity.top) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [leadWidget, VSpace(gap), contentWidget]);
    } else if (leadGravity == LeadGravity.start) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [leadWidget, HSpace(gap), contentWidget]);
    } else if (leadGravity == LeadGravity.end) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [contentWidget, HSpace(gap), leadWidget]);
    } else {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [contentWidget, VSpace(gap), leadWidget]);
    }
  }

  @override
  Widget child() {
    return rawChild;
  }

  @override
  TextAlign alignment() => TextAlign.start;

  @override
  EdgeInsetsGeometry contentPadding() => padding ?? EdgeInsets.zero;

  @override
  double widgetHeight() => height;

  @override
  double widgetWidth() => width;
}

enum LeadGravity {
  top,
  start,
  end,
  bottom,
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

extension AutoShape4<V, T, X> on Map<V, T> {
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

const ALL_TEXT_KEY = '&#*/@%*)(_+_)#*&@#@';
