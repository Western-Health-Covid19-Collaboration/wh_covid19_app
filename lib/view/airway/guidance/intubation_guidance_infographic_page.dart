import 'package:flutter/material.dart';

import '../../../strings.dart';
import '../../../style.dart';
import '../../reusable_infographic_pdf.dart';

class IntubationGuidanceInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ReusableInfographicPdf(
      title: Strings.intubationInfographicTitle,
      pdfUrl:
          'assets/images/infographics/Intubation_Guide_Infographics_Multipage.pdf',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
