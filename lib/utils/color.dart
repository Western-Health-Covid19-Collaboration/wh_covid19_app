import 'package:flutter/material.dart';

abstract class ColorUtils {
  static Color generateIconColor(
      Color fromColor, Color toColor, double deltaPercentage) {
    var fromRed = fromColor.red,
        fromGreen = fromColor.green,
        fromBlue = fromColor.blue;
    var toRed = toColor.red, toGreen = toColor.green, toBlue = toColor.blue;

    var deltaRed = (fromRed - toRed).abs(),
        deltaGreen = (fromGreen - toGreen).abs(),
        deltaBlue = (fromBlue - toBlue).abs();

    var newRed = fromRed < toRed
            ? fromRed + deltaRed * deltaPercentage
            : fromRed - deltaRed * deltaPercentage,
        newGreen = fromGreen < toGreen
            ? fromGreen + deltaGreen * deltaPercentage
            : fromGreen - deltaGreen * deltaPercentage,
        newBlue = fromBlue < toGreen
            ? fromBlue + deltaBlue * deltaPercentage
            : fromBlue - deltaBlue * deltaPercentage;

    return Color.fromRGBO(newRed.toInt(), newGreen.toInt(), newBlue.toInt(), 1);
  }
}
