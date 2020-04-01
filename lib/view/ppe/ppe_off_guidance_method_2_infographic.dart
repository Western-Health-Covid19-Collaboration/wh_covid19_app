import 'package:flutter/material.dart';
import '../../style.dart';
import '../reusable_infographic_page.dart';

class PPEOffMethod2InfographicPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: 'Method Two infographic', 
      imageUrl: 'assets/images/infographics/taking_off_ppe_2.png',
      backgroundColor: AppColors.grey50,
      toolBarColor: AppColors.purple50);
  }
}