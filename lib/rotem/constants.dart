import 'package:flutter/material.dart';

//enum
enum Risk { low, high }
//enum ROTEMType { Obstetrics, General }
//enum level { low, middle, high }
enum listTime { morning, afternoon }
enum ABC { A, B, C }
enum oSA { nil, mild, severeWITHcpap, severeWITHOUTcpap }
enum bleedRisk { stopALL, stopDOAC, stopNORMAL }
enum align { left, right, wide }

//AppBar styles
const kAppBarText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 14,
  fontFamily: 'Oxygen',
);
const kAppBarTextWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 14,
  fontFamily: 'Oxygen',
);

//Font styles
const kLargeBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 34,
  fontWeight: FontWeight.w800,
);

const kLargeBoldItalic = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 34,
  fontWeight: FontWeight.w800,
  fontStyle: FontStyle.italic,
);

const kLarge = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 34,
  fontWeight: FontWeight.w400,
);

const kLargeLightItalic = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 32,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.italic,
  letterSpacing: -0.5,
);

const kXMediumBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 26,
  fontWeight: FontWeight.w800,
);
const kXMedium = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 26,
);
const kMediumBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w800,
);
const kMediumBoldRed = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.red,
  fontSize: 22,
  fontWeight: FontWeight.w800,
);
const kMediumSemiBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);
const kMedium = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w400,
);

const kMediumLightItalic = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w200,
  fontStyle: FontStyle.italic,
);

const kSmallBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kSmallXBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w900,
);

const kSmallPurple = TextStyle(
  fontFamily: 'Nunito Sans',
  color: kQuestionIcon,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kSmall = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 18,
);
const kSmallItalic = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontWeight: FontWeight.w300,
  fontSize: 16,
  fontStyle: FontStyle.italic,
);
const kSmallSemiBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 18,
);
const kSmallRed = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.red,
  fontWeight: FontWeight.w900,
  fontSize: 12,
//    decoration: TextDecoration.underline,
//    decorationThickness: 3
);

const kSmallerLink = TextStyle(
  color: Colors.blue,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

const kSmallerBold = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const kSmaller = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 15,
);

const kXSmall = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 12,
);

const kXXSmall = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.black,
  fontSize: 10.5,
);

const kMainMenu = TextStyle(
  fontFamily: 'Nunito Sans',
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w800,
);

const kButton = TextStyle(
  color: Colors.black,
  fontSize: 17,
  fontFamily: 'Oxygen',
);
const kButtonWhite = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontFamily: 'Oxygen',
);

const kWH = TextStyle(
  color: kGreyText,
  fontSize: 12,
  fontFamily: 'Oxygen',
);

//Color Palette
const kBackgroundColor = Color(0xFFFFFFFF); //Color(0xFFECEFF1);
const kGreenLight = Color(0xFFDDDE4B);
const kGreenDark = Color(0xFFADCF82);
const kBlueLight = Color(0xFF88CED8);
const kBlueDark = Color(0xFF62C4DD);
const kPurpleLight = Color(0xFF944D8B);
const kPurpleDark = Color(0xFF63396E);
const kPurpleText = Color(0xFF811E6E);
const kPurpleLightened = Color(0xFFf9f9f9);
const kGreyText = Color(0xFF717274);
const kListSelectColour = kPurpleDark;
const kQuestionIcon = kPurpleDark; //Color(0xFF283593);
const kNoButtonColour = Color(0xFFE57373); //Red[300]
const kUnselectedAlpha = 100;

//Slider Themes
const kSlider = SliderThemeData(
  inactiveTrackColor: Color(0x66717274),
  activeTrackColor: kGreyText,
  thumbColor: kPurpleLight,
  overlayColor: Color(0x33944D8B),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
  trackShape: RectangularSliderTrackShape(),
  trackHeight: 2.0,
);

const kSliderSmall = SliderThemeData(
  inactiveTrackColor: Color(0x66717274),
  activeTrackColor: kGreyText,
  thumbColor: kPurpleLight,
  overlayColor: Color(0x33944D8B),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
  trackShape: RectangularSliderTrackShape(),
  trackHeight: 2.0,
  activeTickMarkColor: Colors.black,
  inactiveTickMarkColor: Colors.black,
);

const headerDecoration = BoxDecoration(
    color: Color(0x339E9E9E), //Colors.grey.withAlpha(30)
    border: Border(
      top: BorderSide(width: 2, color: kGreyText),
      bottom: BorderSide(width: 0.5, color: kGreyText),
    ));
