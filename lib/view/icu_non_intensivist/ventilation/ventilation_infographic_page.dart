import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../reusable_infographic_page.dart';

class VentilationInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics().analyticsScreen(Constants.analyticsVentilationInfographic);

    return const InfographicPage(
      title: Strings.ventilationInfographicTitle,
      imageUrl: 'assets/images/infographics/sari_treatment_poster_1.png',
      backgroundColor: AppColors.backgroundBlue,
      toolBarColor: AppColors.blue50,
    );
  }
}
