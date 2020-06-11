import 'package:flutter/material.dart';

import '../style.dart';

class Button extends StatelessWidget {
  const Button(
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
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colour,
          border: Border.all(color: AppColors.purple500, width: borderWidth),
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: AppColors.grey500,
                      offset: const Offset(5, 5),
                      blurRadius: 10)
                ]
              : null,
        ),
        child: Center(child: buttonChild),
      ),
    );
  }
}
