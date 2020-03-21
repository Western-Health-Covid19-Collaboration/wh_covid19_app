import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class ImageViewTemplate extends StatelessWidget {
  final ReusableCard card;
  final String imagePath;

  ImageViewTemplate({this.card, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card.color,
      appBar: AppBar(
        title: Text(card.title),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
          child: Center(
              child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ))),
    );
  }
}
