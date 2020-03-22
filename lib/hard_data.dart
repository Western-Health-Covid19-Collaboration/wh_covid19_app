// A list of two cards
import 'package:flutter/material.dart';

import 'widget/reusable_card.dart';

// Staff Welfare card list composition
final List<ReusableCard> staffWelfare = [
  ReusableCard(
    title: 'PPE Technique',
    description: '3 guides',
    color: Colors.white,
    routeTo: '/ppe',
  ),
  ReusableCard(
    title: 'Your Welfare',
    description: 'Vital info & contacts',
    color: Colors.white,
    routeTo: '/staff_welfare',
  )
];

// Intubation card list composition
final List<ReusableCard> intubation = [
  ReusableCard(
    title: 'Step By Step Guidance',
    description: '12 steps',
    color: Color.fromRGBO(146, 211, 183, 1),
  ),
  ReusableCard(
    title: 'Checklist',
    description: '12 steps',
    color: Color.fromRGBO(146, 211, 183, 1),
  ),
  ReusableCard(
    title: 'Algorithm',
    description: '12 steps',
    color: Color.fromRGBO(146, 211, 183, 1),
  )
];

// ICU card list composition
final List<ReusableCard> icu = [
  ReusableCard(
    title: 'Ventilation',
    description: 'Description',
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
  ReusableCard(
    title: 'General Care',
    description: '',
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
  ReusableCard(
    title: 'Tips for Junior Staffers',
    description: '',
    color: Color.fromRGBO(143, 217, 255, 1),
  ),
];

// Info card list composition
final List<ReusableCard> info = [
  ReusableCard(
    title: 'Numbers',
    description: 'Important contacts',
  ),
  ReusableCard(
    title: 'WH COVID19',
    description: 'Daily Bullettin',
  ),
  ReusableCard(
    title: 'Recommendations',
    description: 'Descriptions',
  ),
];
