import 'package:flutter/material.dart';
import '../../../style.dart';
import '../../../widget/reusable_Infographic.dart';

class IntubationAlgorithmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        title: const Text('Extubation Infographic'),
      ),
      body: 
        const ReusableInfographic(imageUrl: 'assets/images/intubation_checklist.png', backgroundColor: AppColors.backgroundGreen)
    );
  }
}