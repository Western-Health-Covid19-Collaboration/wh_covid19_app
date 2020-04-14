import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/models/home_card.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

import '../../constants.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';

class TipsJuniorStaffView extends StatelessWidget {
  static const _cards = [
    'Breathing',
    HomeCard(
        title: 'Proning',
        description: 'Guide and Checklist',
        route: Routes.proningGuide),
    HomeCard(
        title: 'Proning Technique',
        description: 'Video Demonstration',
        route: 'https://www.youtube.com/watch?v=YFrA1cCuDnY&feature=youtu.be'),
    'Circulation',
    HomeCard(title: 'ALS/BLS Pandemic Modifications', description: 'Guide'),
  ];
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsCrossSkillingScreen);

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
            )));
  }
}
