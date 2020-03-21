import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class PPETechniqueView extends StatelessWidget {
  final title = "PPE Technique";
  final color = Color.fromRGBO(255, 255, 255, 0.94);

  final cards = <ReusableCard>[
    ReusableCard(
      title: "Putting on Personal Protective Equipment",
      description: "5 steps",
      color: Colors.white,
    ),
    ReusableCard(
      title: "Taking off Personal Protective Equipment",
      description: "Description",
      color: Colors.white,
    ),
    ReusableCard(
      title: "Taking off Personal Protective Equipment",
      description: "Description",
      color: Colors.white,
    )
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
