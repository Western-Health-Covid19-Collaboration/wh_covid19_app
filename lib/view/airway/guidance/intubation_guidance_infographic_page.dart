import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../reusable_infographic_page.dart';

class IntubationGuidanceInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics().analyticsScreen(Constants.analyticsIntubationGuideInfographic);

    return const InfographicPage(
      title: Strings.intubationInfographicTitle,
      imageUrl: 'assets/images/infographics/airway_management.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
