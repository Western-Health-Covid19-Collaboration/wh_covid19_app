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

  const ICUDailyRoundContainer({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blue500,
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
  final List<ICUDailyRoundStepSection> sections;

  const ICUDailyRoundStepsContainer({this.sections});

  List<Widget> _renderList() {
    return sections
        .map((e) => ICUDailyRoundStepsCard(section: e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(list: _renderList());
  }
}

// Checklist Container
class ICUDailyRoundChecklistContainer extends StatelessWidget {
  final List<ICUDailyRoundChecklistSection> sectionList;

  const ICUDailyRoundChecklistContainer({this.sectionList});

  List<Widget> _renderList() {
    return sectionList
        .map((e) => ChecklistItemWidget<ICUDailyRoundChecklistSection>(
              item: e,
              content: ICUDailyRoundChecklistCard(item: e),
              backgroundColor: AppColors.appBackground,
              selectedBackgroundColor: AppColors.blue50,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(list: _renderList());
  }
}