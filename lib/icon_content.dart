import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 40.0,
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          label,
          style: kFastInterpretationTextStyle,
        )
      ],
    );
  }
}
