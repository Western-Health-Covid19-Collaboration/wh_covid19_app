import 'package:flutter/material.dart';

import '../style.dart';
import 'reusable_card.dart';

enum CardsLayout { twoRow, threeColumn, threeDoubleRowBigTop, fourDoubleRow }

class CardContainer extends StatelessWidget {
  static const double _outerPadding = 16;
  static const double _headerPadding = 4;

  /// Title for the container
  final String title;

  /// List of ReusableCard to be displayed
  final List<ReusableCard> cards;

  /// Cards layout
  final CardsLayout containerLayout;

  const CardContainer({
    this.title,
    @required this.cards,
    @required this.containerLayout,
  });

  @override
  Widget build(BuildContext context) {
    final containerHeading = title != null
        ? Container(
            margin: const EdgeInsets.only(left: _headerPadding),
            child: Text(
              title,
              style: Styles.cardContainerTextStyle,
            ),
          )
        : Container();

    return Padding(
      padding: const EdgeInsets.all(_outerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          containerHeading,
          _cardsLayout(containerLayout),
        ],
      ),
    );
  }

  // Generate the layout of the cards based on the layout type
  Widget _cardsLayout(CardsLayout layout) {
    switch (layout) {
      case CardsLayout.twoRow:
        if (cards.length == 2) {
          return Row(
            children: <Widget>[
              Expanded(child: cards[0]),
              Expanded(child: cards[1]),
            ],
          );
        } else {
          return _wrongCardsNumber();
        }
        break;

      case CardsLayout.threeColumn:
        if (cards.length == 3) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              cards[0],
              cards[1],
              cards[2]
            ],
          );
        } else {
          return _wrongCardsNumber();
        }
        break;

      case CardsLayout.threeDoubleRowBigTop:
        if (cards.length == 3) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(child: cards[0]),
              ]),
              Row(
                children: <Widget>[
                  Expanded(child: cards[1]),
                  Expanded(child: cards[2]),
                ],
              )
            ],
          );
        } else {
          return _wrongCardsNumber();
        }
        break;

      case CardsLayout.fourDoubleRow:
        if (cards.length == 4) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: cards[0]),
                  Expanded(child: cards[1]),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: cards[2]),
                  Expanded(child: cards[3]),
                ],
              )
            ],
          );
        } else {
          return _wrongCardsNumber();
        }
        break;

      default:
        return Container();
    }
  }

  Widget _wrongCardsNumber() => const Center(
        child: Text(
          'Wrong number of cards buddy 😅',
          style: Styles.textH4,
        ),
      );
}
