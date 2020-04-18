import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../models/home_card.dart';
import '../strings.dart';
import '../style.dart';
import '../utils/firebase.dart';
import '../widget/reusable_card.dart';

class AdditionalResourcesView extends StatelessWidget {
  static const _cards = [
    'Western Health',
    HomeCard(
        title: 'COVID-19 Daily Bulletin',
        description: "Up-to-date Info on WH's Coronavirus Guidelines",
        route: 'https://coronavirus.wh.org.au/message-from-the-executive/'),
    'College and Society',
    HomeCard(
        title: 'ANZCA COVID-19 Daily Updates',
        description: 'News from ANZCA',
        route:
            'http://www.anzca.edu.au/front-page-news/covid-19-impact-on-anzca#'),
    HomeCard(
        title: 'ANZICS COVID-19 Resources',
        description: 'Resource Dashboard for Intensive Care Society',
        route: 'https://www.anzics.com.au/coronavirus/'),
    HomeCard(
        title: 'ASA COVID-19 Response',
        description: 'Updates and Resources from ASA',
        route: 'https://asa.org.au/covid-19-updates/?_zs=hmOdk'),
    'Other',
    HomeCard(
        title: 'Johns Hopkins COVID-19 Updates',
        description: 'Infographic Map',
        route: 'https://coronavirus.jhu.edu/map.html'),
    HomeCard(
        title: 'World Health Organization',
        description: 'Outbreak News',
        route: 'https://www.who.int/westernpacific/emergencies/covid-19'),
    HomeCard(
        title: 'COVID-19 Article Repository',
        description: 'Collection of Indexed Articles',
        route: 'https://www.covid19repository.com/'),
  ];

  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsAdditionalResourcesScreen);

    return Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: AppColors.appBarBackground,
          iconTheme: Styles.appBarIconTheme,
          title: const Text(
            Strings.additionalResourcesTitle,
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
                          ));
                    }).toList()))));
  }
}
