import 'package:flutter/material.dart';

import '../../../strings.dart';
import '../../../style.dart';
import '../../reusable_infographic_page.dart';

class ExtubationInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: Strings.extubationInfographicTitle,
      imageUrl: 'assets/images/infographics/extubation_process.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
