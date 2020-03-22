import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class CardContainer extends StatelessWidget {
  /// Title for the container
  final String title;

  /// List of ReusableCard to be displayed
  final List<ReusableCard> cards;

  CardContainer({this.title, this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: cardContainerTextStyle,
            ),
          ),
          cardsLayout(),
        ],
      ),
    );
  }

  // Generate the layout of the cards based on the qty of cards
  // Allowed: 2 cards, 3 cards, 4 cards
  Widget cardsLayout() {
    // Transform the card to an expanded
    var expandedCards = cards
        .map((c) => Expanded(
              child: c,
            ))
        .toList();

    switch (cards.length) {
      case 2:
        return Row(
          children: <Widget>[
            SizedBox(
              width: 16,
            ),
            expandedCards[0],
            SizedBox(width: 8),
            expandedCards[1],
            SizedBox(
              width: 16,
            ),
          ],
        );
        break;
      case 3:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(children: <Widget>[
              SizedBox(
                width: 16,
              ),
              expandedCards[0],
              SizedBox(
                width: 16,
              ),
            ]),
            Row(
              children: <Widget>[
                SizedBox(width: 16,),
                expandedCards[1],
                SizedBox(width: 8,),
                expandedCards[2],
                SizedBox(width: 16,)
              ],
            )
          ],
        );
        break;
      case 4:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 16,),
                expandedCards[0],
                SizedBox(width: 8,),
                expandedCards[1],
                SizedBox(width: 16,)
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 16,),
                expandedCards[2],
                SizedBox(width: 8,),
                expandedCards[3],
                SizedBox(width: 16,)
              ],,
            )
          ],
        );
        break;
      default:
        return Container();
    }
  }
}
