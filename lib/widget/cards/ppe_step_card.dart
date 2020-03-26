import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wh_covid19/models/PPEStepInfo.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/cards/reusable_card_base.dart';

class PPECard extends StatelessWidget {
  final PPEStepInfo step;
  final Color backgroundColor;

  const PPECard({this.step, this.backgroundColor});

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

    return ReusableCardBase(
      margin: coreMargin,
      borderRadius: 0,
      padding: coreMargin,
      color: backgroundColor,
      child: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            step.step,
            style: AppStyles.textH3,
          ),
        ),
        step.image,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(step.text, style: AppStyles.textH4),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Expanded(child: getList(step.notes, context)),
        )
      ],
    );
  }
}
