import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../hard_data.dart';
import '../../models/home_card.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../widget/reusable_card.dart';

class TipsJuniorStaffView extends StatelessWidget {
  static const _cards = [
    'Airway',
    HomeCard(
        title: 'Airway Assessment',
        description: 'Basic guide for JMS',
        route: Routes.airwayAssessment),
    'Breathing',
    HomeCard(
        title: 'Ventilator basics',
        description: 'Simple guide for JMS',
        route: Routes.ventBasics),
    HomeCard(
        title: 'Proning',
        description: 'Guide and Checklist',
        route: Routes.proningGuide),
    HomeCard(
        title: 'Proning Technique',
        description: 'Video Demonstration',
        route: proningTechniqueUrl),
    'Circulation',
    HomeCard(
        title: 'CVS Basics',
        description: 'Simple guide for JMS',
        route: Routes.cvsBasics),
    HomeCard(
        title: 'ALS/BLS Pandemic Modifications',
        description: 'Guide',
        route: Routes.alsBlsGuide),
    'Disability/Neurological',
    HomeCard(
        title: 'Neuro Basics',
        description: 'Simple guide for JMS',
        route: Routes.neuroBasics),
    'Exposure/Infection',
    HomeCard(
        title: 'ID Basics',
        description: 'Simple guide for JMS',
        route: Routes.infectionBasics),
    'Fluids/Renal',
    HomeCard(
        title: 'Renal Basics',
        description: 'Simple guide for JMS',
        route: Routes.renalBasics),
    'GIT',
    HomeCard(
        title: 'GIT Basics',
        description: 'Simple guide for JMS',
        route: Routes.gastroBasics),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundBlue,
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: AppColors.blue50,
          iconTheme: Styles.appBarIconTheme,
          title: const Text(
            Strings.tipsForCrossSkillingTitle,
            style: Styles.textH5,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _cards.map((e) {
                  if (e is HomeCard) {
                    return ReusableCard.fromData(
                      card: e,
                      height: 48,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                    child: Text(
                      e.toString(),
                      style: Styles.textH4,
                    ),
                  );
                }).toList(),
              ),
            )));
  }
}
