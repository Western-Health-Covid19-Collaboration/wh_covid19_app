import 'package:flutter/material.dart';
import '../../style.dart';
import '../reusable_card.dart';

class HomeBlueCard extends ReusableCard {
  @override
  final String title;

  @override
  final String description;

  @override
  final String routeTo;

  @override
  final Function fallback;

  const HomeBlueCard(
      {this.title, this.description, this.routeTo, this.fallback})
      : super(
            title: title,
            description: description,
            routeTo: routeTo,
            fallback: fallback,
            margin: EdgeInsets.zero,
            color: AppColors.backgroundBlue);
}
