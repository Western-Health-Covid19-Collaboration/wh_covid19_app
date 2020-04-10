import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../reusable_infographic_page.dart';

class ExtubationInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsExtubationGuideInfographic);

    return const InfographicPage(
      title: Strings.extubationInfographicTitle,
      imageUrl: 'assets/images/infographics/extubation_process.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
