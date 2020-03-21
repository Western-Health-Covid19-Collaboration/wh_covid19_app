// A list of two cards
import 'package:flutter/material.dart';

import 'widget/reusable_card.dart';

final List<ReusableCard> cardsTwo = [
  ReusableCard(
    title: "PPE Technique",
    description: "3 guides",
    color: Colors.white,
    routeTo: '/ppe_technique',
  ),
  ReusableCard(
    title: "Your Welfare",
    description: "Vital info & contacts",
    color: Colors.white,
    routeTo: "/your_welfare",
  )
];

// A list of three cards
final List<ReusableCard> cardsThree = [
  ReusableCard(
    title: "Step By Step Guidance",
    description: "12 steps",
    color: Color.fromRGBO(146, 211, 183, 1),
    routeTo: "/sbs_guidance",
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
