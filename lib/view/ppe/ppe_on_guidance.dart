import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wh_covid19/models/PPEStepInfo.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/cards/ppe_step_card.dart';

class PPEOnGuidance extends StatelessWidget {
  final title = 'Step By Step Guide';
  final List<PPEStepInfo> steps = [
    PPEStepInfo(
        step: 'Step 1',
        image: Image.asset('assets/images/steps/on_gown.png'),
        text: 'Gown',
        notes: [
          'Fully cover torso from neck to knees, arms to end of wrists, and wrap around the back.',
          'Fasten in back neck and waist'
        ]),
    PPEStepInfo(
        step: 'Step 2',
        image: Image.asset('assets/images/steps/on_mask.png'),
        text: 'Mask or Respirator',
        notes: [
          'Secure ties or elastic bands at middle of head and neck',
          'Fit flexible band to nose bridge',
          'Fit snug to face and below chin',
          'Fit-check respirator'
        ]),
    PPEStepInfo(
        step: 'Step 3',
        image: Image.asset('assets/images/steps/on_goggles.png'),
        text: 'Goggles or face shield',
        notes: ['Place over face and eyes', 'Adjust to fit']),
    PPEStepInfo(
        step: 'Step 4',
        image: Image.asset('assets/images/steps/on_gloves.png'),
        text: 'Gloves',
        notes: ['Extend to cover wrist of isolation gown'])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.green500,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: AppStyles.appBarIconTheme,
          title: Text(
            title,
            style: AppStyles.textH5,
          ),
        ),
        body: ListView(
            children: steps
                .map((step) => PPECard(
                      step: step,
                      backgroundColor: AppColors.green50,
                    ))
                .toList()));
  }
}
