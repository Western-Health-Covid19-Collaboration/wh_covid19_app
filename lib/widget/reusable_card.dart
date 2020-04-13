import 'package:flutter/material.dart';

import '../models/home_card.dart';
import '../style.dart';
import '../widget/cards/reusable_card_base.dart';

class ReusableCard extends StatelessWidget {
  static const double _defaultHeight = 84;

  /// Title of the card
  final String title;

  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  /// Route to view
  final String routeTo;

  /// Min height of card _content_ (default 84).
  /// Note: Add the ReusableCardBase's padding (12*2=24) to determine the total
  /// height
  final double height;

  /// Elevation of card
  final double elevation;

  /// Fallback instead of route
  final Function fallback;

  /// Different margin
  final EdgeInsets margin;

  const ReusableCard({
    @required this.title,
    this.description,
    this.color = Colors.white,
    this.routeTo,
    this.height = _defaultHeight,
    this.elevation = 4,
    this.fallback,
    this.margin = const EdgeInsets.all(4.0),
  });

  ReusableCard.fromData({
    HomeCard card,
    Color color,
    EdgeInsets margin,
    double height,
  }) : this(
          title: card.title,
          description: card.description,
          routeTo: card.route,
          color: color,
          margin: margin,
          height: height ?? _defaultHeight,
        );

  @override
  Widget build(BuildContext context) {
    final cardContent = description != null
        ? Text(
            description,
            style: Styles.cardDescriptionTextStyle,
          )
        : Container();

    return ReusableCardBase(
      color: color,
      routeTo: routeTo,
      boxConstraints: BoxConstraints(minHeight: height),
      elevation: elevation,
      fallback: fallback,
      margin: margin,
      verticalAlignment: description == ''
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      child: <Widget>[
        Text(
          title,
          style: Styles.cardTitleTextStyle,
        ),
        cardContent,
      ],
    );
  }
}
