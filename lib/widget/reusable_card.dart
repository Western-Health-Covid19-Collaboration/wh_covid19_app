import 'package:flutter/material.dart';
import '../style.dart';
import '../widget/cards/reusable_card_base.dart';

class ReusableCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  /// Route to view
  final String routeTo;

  /// Min height of card (default 84)
  final double height;

  /// Elevation of card
  final double elevation;

  /// Fallback instead of route
  final Function fallback;

  const ReusableCard({
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
    final cardContent = description != null
        ? Text(
            description,
            style: AppStyles.cardDescriptionTextStyle,
          )
        : Container();

    return ReusableCardBase(
      color: color,
      routeTo: routeTo,
      boxConstraints: BoxConstraints(minHeight: height),
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
        cardContent,
      ],
    );
  }
}
