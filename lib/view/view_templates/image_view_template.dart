import 'package:flutter/material.dart';

import '../../widget/reusable_card.dart';

class ImageViewTemplate extends StatelessWidget {
  final ReusableCard card;
  final String imagePath;

  const ImageViewTemplate({this.card, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card.color,
      appBar: AppBar(
        title: Text(card.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ))),
    );
  }
}
