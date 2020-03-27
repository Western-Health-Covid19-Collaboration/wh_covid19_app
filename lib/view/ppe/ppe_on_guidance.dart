import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                      index: entry.key + 1,
                      step: entry.value,
                      backgroundColor: AppColors.green50,
                    ))
                .toList()));
  }
}
