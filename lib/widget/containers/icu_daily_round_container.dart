import 'package:flutter/material.dart';

import '../../models/icu_daily_round_checklist.dart';
import '../../models/icu_daily_round_steps.dart';
import '../../style.dart';
import '../../widget/lists/checklist_card.dart';
import '../../widget/lists/icu_daily_round_checklist_card.dart';
import '../../widget/lists/icu_daily_round_steps_card.dart';

// Base Container
class ICUDailyRoundContainer extends StatelessWidget {
  final List<Widget> list;
  final Color backgroundColor;
  const ICUDailyRoundContainer({this.list, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: ListView(
            children: [
              Container(padding: const EdgeInsetsDirectional.only(top: 10)),
              ...list,
              Container(padding: const EdgeInsetsDirectional.only(bottom: 10)),
            ],
          ),
        ));
  }
}

// Steps Container
class ICUDailyRoundStepsContainer extends StatelessWidget {
  final ICUDailyRoundSteps steps;
  final Color backgroundColor;

  const ICUDailyRoundStepsContainer(
      {this.steps, this.backgroundColor = AppColors.blue500});

  List<Widget> _renderList() {
    return [
      if (steps.subheading != null)
        Text(
          steps.subheading,
          style: Styles.textH1,
        ),
      ...steps.sections.map((e) => ICUDailyRoundStepsCard(section: e))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(
      list: _renderList(),
      backgroundColor: backgroundColor,
    );
  }
}

// Checklist Container
class ICUDailyRoundChecklistContainer extends StatelessWidget {
  final List<ICUDailyRoundChecklistSection> sectionList;
  final Color backgroundColor;

  const ICUDailyRoundChecklistContainer(
      {this.sectionList, this.backgroundColor = AppColors.blue500});

  List<Widget> _renderList() {
    return sectionList
        .map((e) => ChecklistItemWidget<ICUDailyRoundChecklistSection>(
              item: e,
              content: ICUDailyRoundChecklistCard(item: e),
              selectedBackgroundColor: AppColors.blue50,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(
        list: _renderList(), backgroundColor: backgroundColor);
  }
}
