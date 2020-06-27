import 'package:flutter/material.dart';

import '../strings.dart';
import '../style.dart';
import '../view/reusable_infographic_page.dart';

class RotemInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: Strings.rotemInfographicTitle,
      imageUrl: 'assets/images/infographics/rotem_algorithms_summary.png',
      backgroundColor: AppColors.grey500,
      toolBarColor: AppColors.grey500,
    );
  }
}
