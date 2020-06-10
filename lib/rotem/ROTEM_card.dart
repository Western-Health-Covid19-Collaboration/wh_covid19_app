import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class RotemCard extends StatelessWidget {
  RotemCard(
      {this.colour = AppColors.purple500,
      this.iconColour = AppColors.purple50,
      this.text,
      this.onPress,
      this.icon,
      this.iconSize = 40,
      this.highlight = false});

  final Color colour;
  final Color iconColour;
  final String text;
  final Function onPress;
  final IconData icon;
  final double iconSize;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(20),
              boxShadow: highlight
                  ? [BoxShadow(color: AppColors.grey50, blurRadius: 8)]
                  : null),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AutoSizeText(text, style: Styles.textH2, maxLines: 2),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                    child: Icon(
                      icon,
                      size: iconSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
