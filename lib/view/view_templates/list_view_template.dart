import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class ListViewTemplate extends StatelessWidget {
  final ReusableCard card;
  final List<ReusableCard> cards;

  ListViewTemplate({this.card, this.cards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card.color,
      appBar: AppBar(
        title: Text(card.title),
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cards,
          ),
        ),
    );
  }
}
