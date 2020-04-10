import 'package:flutter/material.dart';

import '../style.dart';
import 'reusable_card.dart';

enum CardsLayout { twoRow, threeColumn, threeDoubleRowBigTop, fourDoubleRow }

class CardContainer extends StatelessWidget {
  static const double _outerPadding = 16;
  static const double _innerPadding = 8;
  static const double _headerPadding = 0;

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
        ? Padding(
            padding: const EdgeInsets.only(left: _headerPadding),
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
          _buildVerticalSpacer(),
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
              _buildHorizontalSpacer(),
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
              _buildVerticalSpacer(),
              cards[1],
              _buildVerticalSpacer(),
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
              _buildVerticalSpacer(),
              Row(
                children: <Widget>[
                  Expanded(child: cards[1]),
                  _buildHorizontalSpacer(),
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
                  _buildHorizontalSpacer(),
                  Expanded(child: cards[1]),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: cards[2]),
                  _buildHorizontalSpacer(),
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

  Widget _buildHorizontalSpacer() => Container(width: _innerPadding);

  Widget _buildVerticalSpacer() => Container(height: _innerPadding);

  Widget _wrongCardsNumber() => const Center(
        child: Text(
          'Wrong number of cards buddy 😅',
          style: Styles.textH4,
        ),
      );
}
