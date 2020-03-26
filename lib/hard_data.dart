// A list of two cards
import 'package:flutter/material.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';

import 'widget/reusable_card.dart';
import 'package:flutter/services.dart' show rootBundle;

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
    routeTo: Routes.intubationGuidance,
  ),
  ReusableCard(
    title: 'Checklist',
    description: '12 steps',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationChecklist,
  ),
  ReusableCard(
    title: 'Algorithm',
    description: '12 steps',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationAlgorithm,
  )
];

// ICU card list composition
final List<ReusableCard> icu = [
  ReusableCard(
    title: 'Ventilation',
    description: 'Description',
    color: AppColors.backgroundBlue,
    routeTo: Routes.ventilation,
  ),
  ReusableCard(
    title: 'General Care',
    description: '',
    color: AppColors.backgroundBlue,
    routeTo: Routes.generalCare,
  ),
  ReusableCard(
    title: 'Tips for Junior Staffers',
    description: '',
    color: AppColors.backgroundBlue,
    routeTo: Routes.tipsJuniorStaff,
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


///Map of Route to ScreenData.
///For simple data screens that can be represented with eg a title
///and html text body in a card, there's no need to create separate
///*_view.dart files for each one. Instead, represent the screen as data
final Map<String, HtmlTextScreenData> routeToScreenData = {
  Routes.ventilationInitialActions: HtmlTextScreenData(
      'Suggested initial actions',
      'assets/text/icu_ventilation_initial_actions_content.html',
      AppColors.backgroundBlue),
  Routes.ventilationAdjuncts: HtmlTextScreenData(
      'Adjuncts',
      'assets/text/icu_ventilation_adjuncts_content.html',
      AppColors.backgroundBlue),
};

///Data for a screen that can be rendered with
///html_text_card_view_template.dart
class HtmlTextScreenData {
  final String title;
  final String htmlFile;
  final Color bgColor;
  HtmlTextScreenData(this.title, this.htmlFile, this.bgColor);
  Future<String> readFile() async {
    return await rootBundle.loadString(htmlFile);
  }
}

// Contacts web url
const String whURL = 'http://wh.cyphix.net/';

