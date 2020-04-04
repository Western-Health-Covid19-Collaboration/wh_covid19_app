import 'package:flutter/material.dart';
import '../../style.dart';
import '../reusable_infographic_page.dart';

class PPEOffMethod1InfographicPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: 'Method One Infographic', 
      imageUrl: 'assets/images/infographics/taking_off_ppe_1.png',
      backgroundColor: AppColors.appBackground,
      toolBarColor: AppColors.purple50);
  }
}