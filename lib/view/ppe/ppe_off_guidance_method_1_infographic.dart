import 'package:flutter/material.dart';
import '../../style.dart';
import '../reusable_infographic_page.dart';

class PPEOffMethod1InfographicPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: 'Method One infographic', 
      imageUrl: 'assets/images/infographics/taking_off_ppe_1.png',
      backgroundColor: AppColors.grey50,
      toolBarColor: AppColors.purple50);
  }
}