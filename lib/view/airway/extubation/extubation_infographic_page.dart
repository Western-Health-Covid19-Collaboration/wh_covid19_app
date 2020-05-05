import 'package:flutter/material.dart';

import '../../../strings.dart';
import '../../../style.dart';
import '../../reusable_infographic_pdf.dart';

class ExtubationInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ReusableInfographicPdf(
      title: Strings.extubationInfographicTitle,
      pdfUrl:
          'assets/images/infographics/Extubation_Guide_Infographics_Multipage.pdf',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
