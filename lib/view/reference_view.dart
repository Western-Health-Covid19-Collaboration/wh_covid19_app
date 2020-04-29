import 'package:flutter/material.dart';

import '../models/home_card.dart';
import '../strings.dart';
import '../style.dart';
import '../widget/reusable_card.dart';

class ReferenceView extends StatelessWidget {
  final EdgeInsets _titlePadding = const EdgeInsets.fromLTRB(0, 24, 16, 0);
  final EdgeInsets _contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16);
  final double _sectionHeight = 48;

  static const List<HomeCard> _sections = [
    HomeCard(
      title: 'Safe Airway Society',
      description: 'Guidelines and Infographics',
      route: 'https://www.safeairwaysociety.org/covid19/',
    ),
    HomeCard(
      title: 'Intensive Care Society',
      description: 'Wellbeing Guidelines',
      route: 'https://www.ics.ac.uk/ICS/Education/Wellbeing/ICS/Wellbeing'
          '.aspx',
    ),
    HomeCard(
      title: 'Australian New Zealand Intensive Care Society',
      description: 'COVID-19 Guidelines',
      route: 'https://www.anzics.com.au/coronavirus-guidelines/',
    ),
    HomeCard(
      title: 'Western Health Department of Anaesthesia',
      description: 'Policies and procedures available on the microsite',
      route: 'https://whcovid19.wixsite.com/covid19',
    ),
    HomeCard(
      title: 'Western Health Novel Coronavirus Information',
      description: 'COVID-19 Information',
      route: 'https://coronavirus.wh.org.au/',
    ),
    HomeCard(
      title: 'RNS ASCAR (Royal North Shore)',
      description: 'Cognitive Aids and Inforgraphics',
      route: 'https://www.rnsascar.com/',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: AppColors.appBarBackground,
          iconTheme: Styles.appBarIconTheme,
          title: const Text(
            Strings.referencesTitle,
            style: Styles.textH5,
          ),
        ),
        body: Padding(
            padding: _contentPadding,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Padding(
                    padding: _titlePadding,
                    child: Text('References', style: Styles.textH4),
                  ),
                  ..._sections.map((e) =>
                      ReusableCard.fromData(card: e, height: _sectionHeight))
                ]))));
  }
}
