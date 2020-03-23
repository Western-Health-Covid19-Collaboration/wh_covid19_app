// A list of two cards
import 'package:flutter/material.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';

import 'widget/reusable_card.dart';

// Staff Welfare card list composition
final List<ReusableCard> staffWelfare = [
  ReusableCard(
    title: 'PPE Technique',
    description: '3 guides',
    color: Colors.white,
    routeTo: Routes.ppe,
  ),
  ReusableCard(
    title: 'Your Welfare',
    description: 'Vital info & contacts',
    color: Colors.white,
    routeTo: Routes.staffWelfare,
  )
];

// Intubation card list composition
final List<ReusableCard> intubation = [
  ReusableCard(
    title: 'Step By Step Guidance',
    description: '12 steps',
    color: AppColors.backgroundGreen,
  ),
  ReusableCard(
    title: 'Checklist',
    description: '12 steps',
    color: AppColors.backgroundGreen,
  ),
  ReusableCard(
    title: 'Algorithm',
    description: '12 steps',
    color: AppColors.backgroundGreen,
  )
];

// ICU card list composition
final List<ReusableCard> icu = [
  ReusableCard(
    title: 'Ventilation',
    description: 'Description',
    color: AppColors.backgroundBlue,
  ),
  ReusableCard(
    title: 'General Care',
    description: '',
    color: AppColors.backgroundBlue,
  ),
  ReusableCard(
    title: 'Tips for Junior Staffers',
    description: '',
    color: AppColors.backgroundBlue,
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
