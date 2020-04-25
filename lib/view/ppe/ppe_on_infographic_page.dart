import 'package:flutter/material.dart';

import '../../strings.dart';
import '../../style.dart';
import '../reusable_infographic_page.dart';

class PPEOnInfographicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: Strings.ppeDonningInfographicTitle,
      imageUrl: 'assets/images/infographics/putting_on_ppe.png',
      backgroundColor: AppColors.backgroundGreen,
      toolBarColor: AppColors.green50,
    );
  }
}
