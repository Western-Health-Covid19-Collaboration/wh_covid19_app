import 'package:flutter/material.dart';
import '../../../styles.dart';
import '../../reusable_infographic_page.dart';

class IntubationAlgorithmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const InfographicPage(
      title: 'Extubation Infographic', 
      imageUrl: 'assets/images/intubation_checklist.png',
      backgroundColor: AppColors.backgroundGreen);
  }
}