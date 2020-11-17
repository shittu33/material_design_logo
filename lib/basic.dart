import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:materialdesignlogo/materialdesignlogo.dart';
import 'assets/style.dart';

abstract class ShapeLogo with LogoProvider {
  Decoration decoration;
  BorderRadiusGeometry shapeRadius;
  Color borderColor;
  Color shapeColor;
  double borderWidth;
  Gradient shapeGradient;
  Color shadowColor;
  double elevation;
  LogoShape shape;
  double height;
  double width;
  bool noConstraint = false;
  bool noShape;
  EdgeInsetsGeometry contPadding;
  InkWellGesture inkWellGesture;

  ShapeLogo(
      this.decoration,
      this.shapeRadius,
      this.borderColor,
      this.shapeColor,
      this.borderWidth,
      this.shapeGradient,
      this.shadowColor,
      this.shape,
      this.height,
      this.width,
      this.noConstraint,
      this.noShape,
      this.elevation,
      this.inkWellGesture,
      this.contPadding); //  BorderRadiusGeometry logoShapeRadius();
  Widget shapeChild();

  @override
  double widgetWidth() => width;

  @override
  double widgetHeight() => height;

  double calculateMaximumWidth();

  double calculateMaximumHeight();

  Decoration getDecoration() {
    var shape = this.shape ?? BoxShape.rectangle;
    return decoration ??
        BoxDecoration(
//          border: Border.all(
//            color: borderColor ?? Colors.white,
//            width: borderWidth ?? 0,
//          ),
//          borderRadius: (shape == BoxShape.rectangle) ? shapeRadius : null,
//          boxShadow: shapeShadow,
//          shape: shape,
//          color: shapeColor ?? Colors.black,
          gradient: shapeColor == null
              ? (shapeGradient ??
                  MdiStyle.colorGradientSample1(rawColor: Colors.blue))
              : null,
        );
  }

  ShapeBorder getShapeBorder({
    LogoShape shape,
    double borderWidth,
    BorderRadius borderRadius,
  }) {
    borderWidth = borderWidth ?? 0;
    borderRadius = borderRadius ?? BorderRadius.circular(0);
    var shape = this.shape ?? LogoShape.roundedRectangle;
    if (shape == LogoShape.circle) {
      return CircleBorder(
          side: BorderSide(color: borderColor, width: borderWidth));
    } else if (shape == LogoShape.roundedRectangle) {
      return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor, width: borderWidth));
    } else if (shape == LogoShape.regularRectangle) {
//                borderRadius: BorderRadius.only(topRight: Radius.circular(18),bottomLeft: Radius.circular(18),),
      return ContinuousRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor, width: borderWidth));
    } else if (shape == LogoShape.bevelRectangle) {
      return BeveledRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor, width: borderWidth));
    } else {
      throw UnimplementedError();
    }
  }
  Widget shapedWidget() {
    noShape = noShape ?? false;
    borderColor = borderColor ?? Colors.white;
    bool isCenterText = alignment() == TextAlign.center;
    Widget child = isCenterText ? Center(child: shapeChild()) : shapeChild();
    var materialWidget = Material(
      type: MaterialType.transparency,
      child: Container(
        padding: contPadding ?? EdgeInsets.zero,
        width: widgetWidth() ?? null,
        height: widgetHeight() ?? widgetWidth(),
        constraints: noConstraint
            ? null
            : BoxConstraints(
                maxHeight: calculateMaximumHeight(),
                maxWidth: calculateMaximumWidth(),
              ),
        decoration: getDecoration(),
        child: child,
      ),
    );
    var content = noShape
        ? inkWellGesture != null
            ? CustomInkWell(
                inkWellGesture: inkWellGesture,
                child: child,
              )
            : child
        : Material(
            shadowColor: shadowColor ?? Colors.black,
            elevation: elevation ?? 1,
            color: shapeColor ?? Colors.transparent,
            shape: getShapeBorder(
                shape: shape,
                borderWidth: borderWidth,
                borderRadius: shapeRadius),
            clipBehavior: Clip.antiAlias,
            child: inkWellGesture != null
                ? CustomInkWell(
                    inkWellGesture: inkWellGesture,
                    child: materialWidget,
                  )
                : materialWidget,
          );
    return noConstraint
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              content,
            ],
          )
        : content;
  }


  @override
  Widget child() => shapedWidget();
}

class CustomInkWell extends InkWell {
  final InkWellGesture inkWellGesture;
  final Widget child;

  CustomInkWell({
    Key key,
    this.inkWellGesture,
    this.child,
  }) : super(
          child: child,
          onTap: inkWellGesture.onTap,
          onDoubleTap: inkWellGesture.onDoubleTap,
          onLongPress: inkWellGesture.onLongPress,
          onTapDown: inkWellGesture.onTapDown,
          onTapCancel: inkWellGesture.onTapCancel,
          onHighlightChanged: inkWellGesture.onHighlightChanged,
          onHover: inkWellGesture.onHover,
          mouseCursor: inkWellGesture.mouseCursor,
          focusColor: inkWellGesture.focusColor,
          hoverColor: inkWellGesture.hoverColor,
          highlightColor: inkWellGesture.highlightColor,
          overlayColor: inkWellGesture.overlayColor,
          splashColor: inkWellGesture.splashColor,
          splashFactory: inkWellGesture.splashFactory,
          radius: inkWellGesture.radius,
          borderRadius: inkWellGesture.borderRadius,
          customBorder: inkWellGesture.customBorder,
          enableFeedback: inkWellGesture.enableFeedback,
          excludeFromSemantics: inkWellGesture.excludeFromSemantics,
          focusNode: inkWellGesture.focusNode,
          canRequestFocus: inkWellGesture.canRequestFocus,
          onFocusChange: inkWellGesture.onFocusChange,
          autofocus: inkWellGesture.autofocus,
        );
}

abstract class LogoProvider {
  TextAlign alignment();

  EdgeInsetsGeometry contentPadding();

  Widget child();

  Widget sizedChild() {
    var sizedChild = Container(
      padding: contentPadding() ?? EdgeInsets.zero,
      width: widgetWidth(),
      height: widgetHeight(),
      child: child(),
    );
    return sizedChild;
  }
  double widgetWidth();

  double widgetHeight();
}
