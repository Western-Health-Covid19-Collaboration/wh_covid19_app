import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';
import '../reusable_infographic_page.dart';

class PPEOnInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics().analyticsScreen(Constants.analyticsPPEOnInfographic);

    return const InfographicPage(
      title: Strings.ppeDonningInfographicTitle,
      imageUrl: 'assets/images/infographics/putting_on_ppe.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
