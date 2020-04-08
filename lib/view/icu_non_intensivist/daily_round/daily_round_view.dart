import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../hard_data.dart';
import '../../../style.dart';
import '../../../widget/containers/icu_daily_round_container.dart';
import '../../view_templates/tab_view_template.dart';

class ICUDailyRoundView extends StatelessWidget {
  final title = 'Daily Round';

  @override 
  Widget build(BuildContext context) {
    
    final _stepTabs = icuDailyRoundSteps.map((e) => e.heading).toList();
    final _checklistTabs = icuDailyRoundChecklist.map((e) => e.heading).toList();

    final _stepContainer = icuDailyRoundSteps
          .map((e) => ICUDailyRoundStepsContainer(sections: e.sections));
    final _checklistContainer = icuDailyRoundChecklist
          .map((e) => ICUDailyRoundChecklistContainer(sectionList: e.sectionList));

    final _children = <Widget>[];
    _children.addAll(_stepContainer);
    _children.addAll(_checklistContainer);

    return TabViewTemplate(
      title,
      color: AppColors.blue50,
      tabs: _stepTabs + _checklistTabs,
      children: _children,
    );
  }
}