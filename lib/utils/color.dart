import 'package:flutter/material.dart';

Color generateIconColor(
    Color fromColor, Color toColor, double deltaPercentage) {
  final fromRed = fromColor.red;
  final fromGreen = fromColor.green;
  final fromBlue = fromColor.blue;

  final toRed = toColor.red;
  final toGreen = toColor.green;
  final toBlue = toColor.blue;

  final deltaRed = (fromRed - toRed).abs();
  final deltaGreen = (fromGreen - toGreen).abs();
  final deltaBlue = (fromBlue - toBlue).abs();

  final newRed = fromRed < toRed
      ? fromRed + deltaRed * deltaPercentage
      : fromRed - deltaRed * deltaPercentage;
  final newGreen = fromGreen < toGreen
      ? fromGreen + deltaGreen * deltaPercentage
      : fromGreen - deltaGreen * deltaPercentage;
  final newBlue = fromBlue < toGreen
      ? fromBlue + deltaBlue * deltaPercentage
      : fromBlue - deltaBlue * deltaPercentage;

  return Color.fromRGBO(newRed.toInt(), newGreen.toInt(), newBlue.toInt(), 1);
}
