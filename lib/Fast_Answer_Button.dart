import 'package:flutter/material.dart';
import 'constants.dart';

class FastAnswerButton extends StatelessWidget {
  FastAnswerButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kFastInterpretationTextStyle,
          ),
        ),
        color: kBottomCardColour,
        margin: EdgeInsets.only(top: 0.0),
        padding: EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
