import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/models/PPEStepInfo.dart';

import '../../hard_data.dart';
import '../../style.dart';
import '../../widget/cards/ppe_step_card.dart';

class PPEOnGuidance extends StatelessWidget {
  final title = 'Step By Step Guide';

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
            children: ppeOnSteps
                .asMap()
                .entries
                .map((entry) => PPECard(
                      step: PPEStepInfo(
                          image: entry.value.image,
                          notes: entry.value.notes,
                          step: entry.key + 1,
                          text: entry.value.text),
                      backgroundColor: AppColors.green50,
                    ))
                .toList()));
  }
}
