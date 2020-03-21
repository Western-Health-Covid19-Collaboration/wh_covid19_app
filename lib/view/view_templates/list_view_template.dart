import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class ListViewTemplate extends StatelessWidget {
  final String title;
  final Color color;
  final List<ReusableCard> cards;

  ListViewTemplate({this.title, this.color, this.cards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:color,
      appBar: AppBar(
        title: Text(title),
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
