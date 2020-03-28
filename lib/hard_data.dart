// A list of two cards
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'routes.dart';
import 'style.dart';
import 'widget/reusable_card.dart';

// Staff Welfare card list composition
const List<ReusableCard> staffWelfare = [
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
  const ReusableCard(
    title: 'Step By Step Guidance',
    description: '12 steps',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationGuidance,
  ),
  const ReusableCard(
    title: 'Checklist',
    description: '12 steps',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationChecklist,
  ),
  const ReusableCard(
    title: 'Algorithm',
    description: '12 steps',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationAlgorithm,
  )
];

// ICU card list composition
const List<ReusableCard> icu = [
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
const List<ReusableCard> info = [
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

// Disclaimer text
const String disclaimerBody = '''
This app is designed to be used by Anaesthetic and Critical Care doctors at Western Health who are caring for patients during the COVID-19 Pandemic. The guidelines, protocols and advice within this app are designed to educate staff and suggest recommended management of patients with COVID-19. The recommendations within this application do not indicate an exclusive course of action as the results must be contextualised to the patient at hand and variations may be appropriate.

The authors of this app have made efforts to ensure the information is up to date, but encourage users to confirm the indicated therapy with existing guidelines. The responsibility is on you, the treating physician, to ensure the correct therapy is being used.

The authors accept no responsibility for any information perceived as misleading or the success of any treatment regimen detailed in the guidelines.

The app is made available on the understanding that Western Health and its employees shall have no liability (including liability by reason of negligence) to the users for any loss, damage, cost or expense incurred or arising by reason of any person using or relying on the information and whether caused by reason of any error, negligent act, omission or misinterpretation in the app or otherwise.

The Western Health trademark and app cannot be copied, modified, reproduced, published, uploaded, distributed or posted without the prior written consent of Western Health.

You must agree to accept these terms and conditions before proceeding to use the app.
''';

// Feedback form
const String feedbackFormUrl = 'https://forms.gle/zQtfhvswrKmjJjNV7';