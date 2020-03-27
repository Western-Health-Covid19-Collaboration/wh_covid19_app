import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/PPEStepInfo.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';

class PPECard extends StatelessWidget {
  final PPEStepInfo step;
  final Color backgroundColor;

  const PPECard({@required this.step, this.backgroundColor});

  Widget getList(List<String> notes, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: notes
                .map((item) => Text(
                      '\u2022 $item',
                      softWrap: true,
                      style: AppStyles.textP,
                    ))
                .toList()));
  }

  @override
  Widget build(BuildContext context) {
    const coreMargin = EdgeInsets.fromLTRB(0, 12, 0, 12);

    final index = step.step;

    return ReusableCardBase(
      margin: coreMargin,
      borderRadius: 0,
      padding: coreMargin,
      color: backgroundColor,
      child: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            'Step $index',
            style: AppStyles.textH3,
          ),
        ),
        Image.asset(step.image),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(step.text, style: AppStyles.textH4),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: getList(step.notes, context),
        )
      ],
    );
  }
}
