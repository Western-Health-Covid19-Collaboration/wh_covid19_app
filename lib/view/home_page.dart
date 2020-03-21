import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/card_container.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

class HomePage extends StatelessWidget {
  // A list of two cards
  final List<ReusableCard> cardsTwo = [
    ReusableCard(
      title: "PPE Technique",
      description: "3 guides",
      color: Colors.white,
    ),
    ReusableCard(
      title: "Your Welfare",
      description: "Vital info & contacts",
      color: Colors.white,
    )
  ];

  // A list of three cards
  final List<ReusableCard> cardsThree = [
    ReusableCard(
      title: "Step By Step Guidance",
      description: "12 steps",
      color: Color.fromRGBO(146, 211, 183, 1),
    ),
    ReusableCard(
      title: "Checklists",
      description: "12 steps",
      color: Color.fromRGBO(146, 211, 183, 1),
    ),
    ReusableCard(
      title: "Alghorithm",
      description: "12 steps",
      color: Color.fromRGBO(146, 211, 183, 1),
    )
  ];

  // A list of four cards
  final List<ReusableCard> cardsFour = [
    ReusableCard(
      title: "Strategy",
      description: "12 steps",
      color: Color.fromRGBO(143, 217, 255, 1),
    ),
    ReusableCard(
      title: "Trubleshooting",
      description: "12 steps",
      color: Color.fromRGBO(143, 217, 255, 1),
    ),
    ReusableCard(
      title: "ICU Tips",
      description: "12 steps",
      color: Color.fromRGBO(143, 217, 255, 1),
    ),
    ReusableCard(
      title: "ICU Tips",
      description: "12 steps",
      color: Color.fromRGBO(143, 217, 255, 1),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'EGBA',
          style: TextStyle(color: Colors.black),
        )),
        //backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardContainer(
                title: 'Look After Yourself',
                cards: cardsTwo,
              ),
              CardContainer(
                title: 'Intubations',
                cards: cardsThree,
              ),
              CardContainer(
                title: 'Ventilation',
                cards: cardsFour,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
