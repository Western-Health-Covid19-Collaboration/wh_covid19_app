import 'package:flutter/material.dart';

import '../models/PPEStepInfo.dart';
import '../style.dart';
import '../widget/cards/ppe_step_card.dart';

class PPECardContainer extends StatelessWidget {
  final List<PPEStepInfo> steps;

  const PPECardContainer({@required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...steps
            .asMap()
            .entries
            .map((entry) => PPECard(
                  step: PPEStepInfo(
                      image: entry.value.image,
                      notes: entry.value.notes,
                      step: entry.key + 1,
                      text: entry.value.text),
                  backgroundColor: AppColors.purple50,
                ))
            .toList()
      ],
    );
  }
}
