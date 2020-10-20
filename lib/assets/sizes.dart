import 'package:flutter/material.dart';

const cToolBarHeight = 63.0;
const appBarLogoHeight = cToolBarHeight *0.64;
const appBarIconHeight = cToolBarHeight * 0.47;
const topAppBarHeight = cToolBarHeight / 1.3;
const smallerSize = 600;
const smallSize = 710;
const largeSize = 980;
const extraLargeSize = 1200;

bool isLargeScreen(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  return screenWidth > largeSize &&
    screenWidth < extraLargeSize;
}
double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
//Large screen is any screen whose width is more than 1200 pixels
bool isExtraLargeScreen(BuildContext context) =>
    MediaQuery.of(context).size.width > extraLargeSize;

//Small screen is any screen whose width is less than 800 pixels
bool isSmallScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < smallSize &&
    MediaQuery.of(context).size.width > smallerSize;

bool isSmallerScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < smallerSize;

bool isMobileTablet(BuildContext context) =>
    isSmallerScreen(context) || isSmallScreen(context);
//Medium screen is any screen whose width is less than 1200 pixels,
//and more than 800 pixels
bool isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > smallSize &&
      MediaQuery.of(context).size.width < largeSize;
}

bool isMediumLarge(BuildContext context) =>
    isMediumScreen(context) || isLargeScreen(context);

bool isAtLeastMedium(BuildContext context) =>
    isMediumScreen(context) || isLargeScreen(context)|| isExtraLargeScreen(context);

bool isAtLeastLarge(BuildContext context) =>
    isLargeScreen(context)|| isExtraLargeScreen(context);
