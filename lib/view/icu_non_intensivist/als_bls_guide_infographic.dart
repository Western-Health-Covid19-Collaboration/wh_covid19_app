import 'package:flutter/material.dart';

import '../../strings.dart';
import '../../style.dart';
import '../reusable_infographic_pdf.dart';

class ALSGuideInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ReusableInfographicPdf(
      title: Strings.alsBlsGuideInfographicTitle,
      pdfUrl:
          'assets/images/infographics/10052020_BLS_ALS__PPE_Landscape_Infographic.pdf',
      backgroundColor: AppColors.blue500,
      toolBarColor: AppColors.blue50,
    );
  }
}
