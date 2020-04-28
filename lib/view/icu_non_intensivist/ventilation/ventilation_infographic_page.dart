import 'package:flutter/material.dart';

import '../../../strings.dart';
import '../../../style.dart';
import '../../reusable_infographic_multipage.dart';

class VentilationInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicMultiPage(
      title: Strings.ventilationInfographicTitle,
      imageUrls: [
        'assets/images/infographics/sari_treatment_poster_1.png',
        'assets/images/infographics/sari_treatment_poster_2.png'
      ],
      backgroundColor: AppColors.backgroundBlue,
      toolBarColor: AppColors.blue50,
    );
  }
}
