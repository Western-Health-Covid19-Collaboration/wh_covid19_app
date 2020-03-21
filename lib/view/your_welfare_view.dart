import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class YourWelfareView extends StatelessWidget {
  final title = 'Your Welfare';
  final color = Color.fromRGBO(255, 255, 255, 0.94);

  final cards = <ReusableCard>[
    ReusableCard(
      title: "Find time to sleep",
      description: "Description",
      color: Colors.white,
    ),
    ReusableCard(
      title: "Speak to a Human",
      description: "Description",
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
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
