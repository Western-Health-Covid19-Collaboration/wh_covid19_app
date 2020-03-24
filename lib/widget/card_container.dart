import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class CardContainer extends StatelessWidget {
  static const double _outerPadding = 16;
  static const double _innerPadding = 8;

  /// Title for the container
  final String title;

  /// List of ReusableCard to be displayed
  final List<ReusableCard> cards;

  CardContainer({this.title, this.cards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_outerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: AppStyles.cardContainerTextStyle,
          ),
          _buildVerticalSpacer(),
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
        .map((c) => Expanded(child: c))
        .toList();

    switch (cards.length) {
      case 2:
        return Row(
          children: <Widget>[
            expandedCards[0],
            _buildHorizontalSpacer(),
            expandedCards[1],
          ],
        );
        break;
      case 3:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(children: <Widget>[
              expandedCards[0],
            ]),
            _buildVerticalSpacer(),
            Row(
              children: <Widget>[
                expandedCards[1],
                _buildHorizontalSpacer(),
                expandedCards[2],
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
                expandedCards[0],
                _buildHorizontalSpacer(),
                expandedCards[1],
              ],
            ),
            Row(
              children: <Widget>[
                expandedCards[2],
                _buildHorizontalSpacer(),
                expandedCards[3],
              ],
            )
          ],
        );
        break;
      default:
        return Container();
    }
  }

  Widget _buildHorizontalSpacer() => Container(width: _innerPadding);

  Widget _buildVerticalSpacer() => Container(height: _innerPadding);
}
