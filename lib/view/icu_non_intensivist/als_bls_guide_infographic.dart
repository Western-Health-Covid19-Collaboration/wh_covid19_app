import 'package:flutter/material.dart';

import '../../strings.dart';
import '../../style.dart';
import '../reusable_infographic_page.dart';

class ALSGuideInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: Strings.alsBlsGuideInfographicTitle,
      imageUrl: 'assets/images/infographics/bls-modifications.png',
      backgroundColor: AppColors.blue500,
      toolBarColor: AppColors.blue50,
    );
  }
}
