import 'package:flutter/material.dart';
import 'package:materialdesignlogo/assets/strings.dart';
import '../materialdesignlogo.dart';
import 'package:materialdesignlogo/materialdesignlogo.dart';

class ShapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MdiLogo.linkedln(
                borderWidth: 2,
                fontSize: 63,
              ),
              HSpace(),
              MdiLogo.facebook(
                shapeRadius: BorderRadius.circular(10),
                borderWidth: 2,
                shapeShadow: [
                  BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
                ],
                fontSize: 63,
                logoShape: BoxShape.rectangle,
              ),
              HSpace(),
              MdiLogo.facebook(
                shapeRadius: BorderRadius.circular(10),
                borderWidth: 2,
                shapeColor: Colors.white,
                fontColor: Colors.blue,
                shapeShadow: [
                  BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
                ],
                fontSize: 63,
                logoShape: BoxShape.rectangle,
              ),
            ],
          ),
        ),
        VSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MdiLogo.linkedln(
              fontSize: 68,
              logoShape: BoxShape.circle,
            ),
            HSpace(),
            MdiLogo.facebook(
              borderWidth: 2,
              shapeShadow: [
                BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
              ],
              fontSize: 68,
              logoShape: BoxShape.circle,
            ),
            HSpace(),
            MdiLogo.facebook(
              borderWidth: 2,
              shapeColor: Colors.white,
              fontColor: Colors.blue,
              shapeShadow: [
                BoxShadow(color: Colors.grey[700], offset: Offset(-1.5, 2)),
              ],
              fontSize: 68,
              logoShape: BoxShape.circle,
            ),
          ],
        ),
        VSpace(),
        Center(
          child: MdiLogo.shapeText(
            shapeColor: Colors.white,
            textSpans: TextSpanAsset.nestleTexts(),
            shapeRadius: BorderRadius.circular(10),
            borderWidth: 2,
            logoShape: BoxShape.rectangle,
          ),
        ),
        VSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MdiLogo.shapeText(
              shapeColor: Colors.white,
              textSpans: TextSpanAsset.googleTexts(),
              shapeRadius: BorderRadius.circular(10),
              borderWidth: 2,
              fontSize: 63,
              logoShape: BoxShape.rectangle,
            ),
            HSpace(),
            MdiLogo.shapeText(
              shapeColor: Colors.white,
              textSpans: TextSpanAsset.ebayTexts(),
              shapeRadius: BorderRadius.circular(10),
              borderWidth: 2,
              fontSize: 63,
              logoShape: BoxShape.rectangle,
            ),
          ],
        ),
        VSpace(),
        MdiLogo.microsoftXBox(),
        VSpace(),
        MdiLogo.microsoftCombined(),
        VSpace(),
        MdiLogo.adobe(),
        VSpace(),
        MdiLogo.linkedlnCombine(),
        MdiLogo.instagramCombine(),
      ],
    );
  }
}

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        VSpace(),
        shapedLogoRow(BoxShape.rectangle),
        VSpace(20),
        shapedLogoRow(BoxShape.circle),
      ],
    );
  }
}

class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children:[Text('fd')]/* textList()*/,
      ),
    );
  }

  List<Widget> textList() {
    return [
        VSpace(20),
//          MdiLogo.materialDesignLogo(),
        MdiLogo.netflix(textAlign: TextAlign.center),
        MdiLogo.fedX(textAlign: TextAlign.center),
        MdiLogo.google(
          plainLogo: true,
          fontSize: 64,
          textAlign: TextAlign.center,
        ),
        MdiLogo.facebook(
          plainLogo: true,
          fontSize: 64,
          textAlign: TextAlign.center,
        ),
//              VSpace(),
        MdiLogo.ebay(
          plainLogo: true,
          fontSize: 64,
          textAlign: TextAlign.center,
        ),
//              VSpace(),
        MdiLogo.linkedln(
          plainLogo: true,
          fontSize: 63,
          textAlign: TextAlign.center,
        ),
        MdiLogo.nestle(
          plainLogo: true,
          textSpans: TextSpanAsset.nestleTexts(),
          textAlign: TextAlign.center,
        ),
      ];
  }
}

Row shapedLogoRow(BoxShape shape) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MdiLogo.whatsApp(
        logoShape: shape,
      ),
      HSpace(),
      MdiLogo.twitter(
        logoShape: shape,
      ),
      HSpace(),
      MdiLogo.instagram(
        logoShape: shape,
      ),
      HSpace(),
      MdiLogo.microsoft(
        logoShape: shape,
      ),
      HSpace(),
      MdiLogo.apple(
        logoShape: shape,
      ),
    ],
  );
}

class HSpace extends StatelessWidget {
  final double width;

  const HSpace({
    Key key,
    this.width,
  }) : super(key: key);

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
