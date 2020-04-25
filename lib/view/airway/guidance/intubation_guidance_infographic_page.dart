import 'package:flutter/material.dart';

import '../../../strings.dart';
import '../../../style.dart';
import '../../reusable_infographic_page.dart';

class IntubationGuidanceInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: Strings.intubationInfographicTitle,
      imageUrl: 'assets/images/infographics/airway_management.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
