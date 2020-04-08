import 'package:flutter/material.dart';

import '../models/PPEStepInfo.dart';
import '../style.dart';
import '../widget/cards/ppe_step_card.dart';

class PPECardContainer extends StatelessWidget {
  final List<PPEStepInfo> steps;
  final Color backgroundColor;

  const PPECardContainer({
    @required this.steps,
    this.backgroundColor = AppColors.grey50,
  });

  /// Generates a List of PPECard Steps
  Iterable<PPECard> getStepsList() {
    return steps.asMap().entries.map(
          (entry) => PPECard(
            /// entry.key: index
            /// entry.value: the actual step data
            step: PPEStepInfoCardModel(
              image: entry.value.image,
              notes: entry.value.notes,
              step: entry.key + 1,
              text: entry.value.text,
            ),
            backgroundColor: backgroundColor,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getStepsList().toList(),
    );
  }
}
