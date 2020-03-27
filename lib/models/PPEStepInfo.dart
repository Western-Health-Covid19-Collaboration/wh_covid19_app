import 'package:flutter/material.dart';

class PPEStepInfo {
  final int step;
  final String image;
  final String text;
  final List<String> notes;

  const PPEStepInfo(
      {@required this.image,
      @required this.text,
      @required this.notes,
      @required this.step});
}
