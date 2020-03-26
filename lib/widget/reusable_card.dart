import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/cards/reusable_card_base.dart';

class ReusableCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  /// Route to view
  final String routeTo;

  /// Height of card
  final double height;

  /// Elevation of card
  final double elevation;

  /// Fallback instead of route
  final Function fallback;

  ReusableCard({
    @required this.title,
    this.description,
    this.color = Colors.white,
    this.routeTo,
    this.height = 84,
    this.elevation = 4,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
      color: color,
      routeTo: routeTo,
      height: height,
      elevation: elevation,
      fallback: fallback,
      verticalAlignment: description == ''
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      child: <Widget>[
        Text(
          title,
          style: AppStyles.cardTitleTextStyle,
        ),
        description != null
            ? Text(
                description,
                style: AppStyles.cardDescriptionTextStyle,
              )
            : Container(),
      ],
    );
  }
}
