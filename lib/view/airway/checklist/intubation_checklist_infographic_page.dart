import 'package:flutter/material.dart';

import '../../../style.dart';
import '../../reusable_infographic_page.dart';

class IntubationChecklistInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: 'Intubation Checklist Infographic',
      imageUrl: 'assets/images/infographics/intubation_checklist.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
