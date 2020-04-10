import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../reusable_infographic_page.dart';

class IntubationChecklistInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(
        Constants.analyticsIntubationChecklistInfographic);

    return const InfographicPage(
      title: 'Intubation Checklist Infographic',
      imageUrl: 'assets/images/infographics/intubation_checklist.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
