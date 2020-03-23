import 'package:flutter/material.dart';

abstract class AppColors {
  // Named colors
  static final Color appBackground = grey500;
  static final Color backgroundGreen = green500;
  static final Color backgroundBlue = blue500;
  static final Color backgroundPurple = purple500;

  // TODO: should come from color palette
  static final Color backgroundBrown = Color(0xffd3ca92);
  static final Color majorText = blackAlpha900;
  static final Color minorText = blackAlpha600;

  // TODO: should come from color palette
  static final Color appBarIcon = Color.fromRGBO(0, 122, 255, 1.0);

  // TODO: should come from color palette
  static final Color appBarBackground = Color(0xf0f9f9f9);

  // Color palette
  static Color green50 = const Color.fromRGBO(214, 233, 191, 1.0);
  static Color green500 = const Color.fromRGBO(173, 211, 127, 1.0);
  static Color green600 = const Color.fromRGBO(145, 184, 112, 1.0);
  static Color green800 = const Color.fromRGBO(75, 117, 74, 1.0);
  static Color green900 = const Color.fromRGBO(34, 77, 52, 1.0);
  static Color blue50 = const Color.fromRGBO(181, 226, 239, 1.0);
  static Color blue500 = const Color.fromRGBO(106, 197, 222, 1.0);
  static Color blue600 = const Color.fromRGBO(95, 168, 196, 1.0);
  static Color blue800 = const Color.fromRGBO(68, 94, 131, 1.0);
  static Color blue900 = const Color.fromRGBO(52, 50, 92, 1.0);
  static Color purple50 = const Color.fromRGBO(197, 168, 200, 1.0);
  static Color purple500 = const Color.fromRGBO(139, 81, 144, 1.0);
  static Color purple600 = const Color.fromRGBO(120, 72, 127, 1.0);
  static Color purple800 = const Color.fromRGBO(74, 50, 86, 1.0);
  static Color purple900 = const Color.fromRGBO(46, 37, 61, 1.0);
  static Color grey50 = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color grey500 = const Color.fromRGBO(236, 243, 240, 1.0);
  static Color grey600 = const Color.fromRGBO(175, 185, 181, 1.0);
  static Color grey800 = const Color.fromRGBO(49, 52, 51, 1.0);
  static Color grey900 = const Color.fromRGBO(19, 20, 20, 1.0);
  static Color blackAlpha50 = const Color.fromRGBO(0, 0, 0, 0.2);
  static Color blackAlpha500 = const Color.fromRGBO(0, 0, 0, 0.4);
  static Color blackAlpha600 = const Color.fromRGBO(0, 0, 0, 0.6);
  static Color blackAlpha800 = const Color.fromRGBO(0, 0, 0, 0.8);
  static Color blackAlpha900 = const Color.fromRGBO(0, 0, 0, 1.0);
}

// App bar style
final TextStyle appBarTextStyle = TextStyle(
  color: AppColors.majorText,
  fontSize: 32,
);
final IconThemeData appBarIconTheme =
    IconThemeData(color: AppColors.appBarIcon);

// Card Container style
final TextStyle cardContainerTextStyle = TextStyle(
  fontSize: 22,
  color: AppColors.majorText,
);

// Card styles
final TextStyle cardTitleTextStyle = TextStyle(
    color: AppColors.majorText,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
    fontFamily: 'SFProText');

final TextStyle cardDescriptionTextStyle = TextStyle(
    color: AppColors.minorText,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
    fontFamily: 'SFProText');
