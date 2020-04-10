import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';
import '../reusable_infographic_page.dart';

class PPEOffMethod2InfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsPPEOffMethod2Infographic);

    return const InfographicPage(
      title: Strings.ppeMethod2InfographicTitle,
      imageUrl: 'assets/images/infographics/taking_off_ppe_2.png',
      backgroundColor: AppColors.appBackground,
      toolBarColor: AppColors.purple50,
    );
  }
}
