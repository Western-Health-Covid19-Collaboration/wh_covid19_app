import 'package:flutter/material.dart';
import 'constants.dart';

class Button extends StatelessWidget {
  Button(
      {this.colour, // =const COLOR gives a default state
      this.buttonChild,
      this.onPress,
      this.borderWidth = 0,
      this.shadow = true});
  final Color colour;
  final Widget buttonChild;
  final Function onPress;
  final double borderWidth;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
            child: Center(child: buttonChild),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: colour,
              border: Border.all(color: kPurpleText, width: borderWidth),
              boxShadow: shadow
                  ? [
                      BoxShadow(
                          color: kGreyText,
                          offset: Offset(5, 5),
                          blurRadius: 10)
                    ]
                  : null,
            )));
  }
}
