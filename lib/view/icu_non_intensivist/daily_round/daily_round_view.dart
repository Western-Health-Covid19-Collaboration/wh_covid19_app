import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../hard_data.dart';
import '../../../models/icu_daily_round_checklist.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../widget/containers/icu_daily_round_container.dart';
import '../../../widget/lists/checklist_card.dart';
import '../../view_templates/tab_view_template.dart';

class ICUDailyRoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _stepTabs = icuDailyRoundSteps.map((e) => e.heading).toList();
    final _checklistTabs =
        icuDailyRoundChecklist.map((e) => e.heading).toList();

    final _stepContainer = icuDailyRoundSteps.map((e) =>
        ICUDailyRoundStepsContainer(key: PageStorageKey(e.heading), steps: e));
    final _checklistContainer = icuDailyRoundChecklist.map((e) =>
        ICUDailyRoundChecklistContainer(
            key: PageStorageKey(e.heading), sectionList: e.sectionList));

    final _children = <Widget>[];
    _children.addAll(_stepContainer);
    _children.addAll(_checklistContainer);

    return ChangeNotifierProvider(
      create: (context) =>
          ChecklistSelectionProvider<ICUDailyRoundChecklistSection>(),
      child: TabViewTemplate(
        Strings.dailyRoundTitle,
        color: AppColors.blue50,
        tabs: _stepTabs + _checklistTabs,
        children: _children,
      ),
    );
  }
}
