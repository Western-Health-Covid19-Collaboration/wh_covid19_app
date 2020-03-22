import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class PPEView extends StatelessWidget {
  final title = 'PPE';
  final color = Color.fromRGBO(255, 255, 255, 0.94);

  final cards = <ReusableCard>[
    ReusableCard(
      title: 'Putting On',
      description: '5 steps',
      color: Colors.white,
    ),
    ReusableCard(
      title: 'Taking Off',
      description: 'Description',
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: appBarIconTheme,
        title: Text(
          title,
          style: appBarTextStyle,
        ),
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
