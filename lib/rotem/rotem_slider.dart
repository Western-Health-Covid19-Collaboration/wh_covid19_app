import 'package:flutter/material.dart';
import '../style.dart';

const rotemSlider = SliderThemeData(
  inactiveTrackColor: Color(0x66717274),
  activeTrackColor: AppColors.grey800,
  thumbColor: AppColors.purple500,
  overlayColor: Color(0x33944D8B),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
  trackShape: RectangularSliderTrackShape(),
  trackHeight: 2.0,
);
