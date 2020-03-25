import 'package:flutter/material.dart';

// TODO: Convert members to top level finals/consts or functions.
abstract class AppColors {
  // Named colors
  static const Color appBackground = grey500;
  static const Color backgroundGreen = green500;
  static const Color backgroundBlue = blue500;
  static const Color backgroundPurple = purple500;

  // TODO: should come from color palette
  static const Color backgroundBrown = Color(0xffd3ca92);
  static const Color majorText = blackAlpha900;
  static const Color minorText = blackAlpha600;

  // TODO: should come from color palette
  static const Color appBarIcon = Color.fromRGBO(0, 122, 255, 1.0);

  // TODO: should come from color palette
  static const Color appBarBackground = Color(0xf0f9f9f9);

  // Color palette
  static const Color green50 = Color.fromRGBO(214, 233, 191, 1.0);
  static const Color green500 = Color.fromRGBO(173, 211, 127, 1.0);
  static const Color green600 = Color.fromRGBO(145, 184, 112, 1.0);
  static const Color green800 = Color.fromRGBO(75, 117, 74, 1.0);
  static const Color green900 = Color.fromRGBO(34, 77, 52, 1.0);
  static const Color blue50 = Color.fromRGBO(181, 226, 239, 1.0);
  static const Color blue500 = Color.fromRGBO(106, 197, 222, 1.0);
  static const Color blue600 = Color.fromRGBO(95, 168, 196, 1.0);
  static const Color blue800 = Color.fromRGBO(68, 94, 131, 1.0);
  static const Color blue900 = Color.fromRGBO(52, 50, 92, 1.0);
  static const Color purple50 = Color.fromRGBO(197, 168, 200, 1.0);
  static const Color purple500 = Color.fromRGBO(139, 81, 144, 1.0);
  static const Color purple600 = Color.fromRGBO(120, 72, 127, 1.0);
  static const Color purple800 = Color.fromRGBO(74, 50, 86, 1.0);
  static const Color purple900 = Color.fromRGBO(46, 37, 61, 1.0);
  static const Color grey50 = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color grey500 = Color.fromRGBO(236, 243, 240, 1.0);
  static const Color grey600 = Color.fromRGBO(175, 185, 181, 1.0);
  static const Color grey800 = Color.fromRGBO(49, 52, 51, 1.0);
  static const Color grey900 = Color.fromRGBO(19, 20, 20, 1.0);
  static const Color blackAlpha50 = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color blackAlpha500 = Color.fromRGBO(0, 0, 0, 0.4);
  static const Color blackAlpha600 = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color blackAlpha800 = Color.fromRGBO(0, 0, 0, 0.8);
  static const Color blackAlpha900 = Color.fromRGBO(0, 0, 0, 1.0);
}

// TODO: Convert members to top level finals/consts or functions.
abstract class AppStyles {
  // Named styles

  // App bar styles
  static final TextStyle appBarTextStyle = AppStyles.textH2;
  static const IconThemeData appBarIconTheme =
      IconThemeData(color: AppColors.appBarIcon);

  // Card styles
  static final TextStyle cardContainerTextStyle = AppStyles.textH4;
  static final TextStyle cardTitleTextStyle = AppStyles.textH5;
  static final TextStyle cardDescriptionTextStyle = AppStyles.textFooter;

  static const fontFamily = 'Inter';

  // Core font styles
  static final TextStyle textH1 = TextStyle(
      color: AppColors.majorText,
      fontWeight: FontWeight.bold,
      fontSize: 28.0,
      fontFamily: fontFamily);

  static final TextStyle textH2 = TextStyle(
      color: AppColors.majorText,
      fontWeight: FontWeight.normal,
      fontSize: 28.0,
      fontFamily: fontFamily);

  static final TextStyle textH3 = TextStyle(
      color: AppColors.majorText,
      fontWeight: FontWeight.bold,
      fontSize: 22.0,
      fontFamily: fontFamily);

  static final TextStyle textH4 = TextStyle(
      color: AppColors.majorText,
      fontWeight: FontWeight.normal,
      fontSize: 22.0,
      fontFamily: fontFamily);

  static final TextStyle textH5 = TextStyle(
      color: AppColors.majorText,
      fontWeight: FontWeight.w600, // semi-bold
      fontSize: 17.0,
      fontFamily: fontFamily);

  static final TextStyle textP = TextStyle(
      color: AppColors.minorText,
      fontWeight: FontWeight.normal,
      fontSize: 17.0,
      fontFamily: fontFamily);

  static final TextStyle textFooter = TextStyle(
      color: AppColors.minorText,
      fontWeight: FontWeight.normal,
      fontSize: 13.0,
      fontFamily: fontFamily);

  static final TextStyle textCaption = TextStyle(
      color: AppColors.minorText,
      fontWeight: FontWeight.w600, // semi-bold
      fontSize: 13.0,
      fontFamily: fontFamily);
}
