import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materialdesignlogo/widget_type.dart';
import 'assets/style.dart';

abstract class ShapeLogo implements LogoProvider {
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
  final EdgeInsetsGeometry contPadding;

  ShapeLogo(
      this.decoration,
      this.shapeRadius,
      this.borderColor,
      this.shapeColor,
      this.borderWidth,
      this.shapeGradient,
      this.shapeShadow,
      this.shape,
      this.height,
      this.width, this.contPadding); //  BorderRadiusGeometry logoShapeRadius();

  double widgetWidth() => width;

  double widgetHeight() => height;

  double calculateMaximumWidth();

  double calculateMaximumHeight();

  Decoration getDecoration() {
    var shape = this.shape ?? BoxShape.rectangle;
    return decoration ??
        BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.white,
            width: borderWidth ?? 0,
          ),
          borderRadius: (shape == BoxShape.rectangle) ? shapeRadius : null,
          boxShadow: shapeShadow,
          shape: shape,
          color: shapeColor ?? Colors.black,
          gradient:
              shapeColor == null ? (shapeGradient ?? faceBookGradient()) : null,
        );
  }

  Widget shapedWidget() {
    bool isCenterText = alignment() == TextAlign.center;
    return Container(
      padding: contPadding ?? EdgeInsets.zero,
      width: widgetWidth() ?? null,
      height: widgetHeight() ?? widgetWidth(),
      constraints: BoxConstraints(
        maxHeight: calculateMaximumHeight(),
        maxWidth: calculateMaximumWidth(),
      ),
      decoration: getDecoration(),
      child: isCenterText ? Center(child: child()) : child(),
    );
  }
}

abstract class LogoProvider {

  TextAlign alignment();

  EdgeInsetsGeometry contentPadding();

  Widget child();
}
