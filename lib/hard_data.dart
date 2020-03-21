// A list of two cards
import 'package:flutter/material.dart';

import 'widget/reusable_card.dart';

// Staff Welfare card list composition
final List<ReusableCard> staffWelfare = [
  ReusableCard(
    title: "Staff Welfare",
    description: "Description",
    color: Colors.white,
    routeTo: "/staff_welfare",
  ),
  ReusableCard(
    title: "PPE",
    description: "Guides & Reccomandation",
    color: Colors.white,
    routeTo: "/ppe",
  )
];

// Intubation card list composition
final List<ReusableCard> intubation = [
  ReusableCard(
    title: "Infographic",
    description: "SAS-COVID-19 Infographic",
    color: Color.fromRGBO(146, 211, 183, 1),
  ),
  ReusableCard(
    title: "Intubation",
    description: "Step by step",
    color: Color.fromRGBO(146, 211, 183, 1),
  ),
  ReusableCard(
    title: "Emergency",
    description: "Checklist",
    color: Color.fromRGBO(146, 211, 183, 1),
  )
];

// ICU card list composition
final List<ReusableCard> icu = [
  ReusableCard(
    title: "Ventilation",
    description: "Description",
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
  ReusableCard(
    title: "General Care",
    description: "Description",
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
  ReusableCard(
    title: "Junior Staff",
    description: "Education Resources",
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
];

// Info card list composition
final List<ReusableCard> info = [
  ReusableCard(
    title: "Numbers",
    description: "Important contacts",
  ),
  ReusableCard(
    title: "WH COVID19",
    description: "Daily Bullettin",
  ),
  ReusableCard(
    title: "Recommendations",
    description: "Descriptions",
  ),
];
