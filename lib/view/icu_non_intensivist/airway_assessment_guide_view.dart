import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../hard_data.dart';
import '../../hard_data.dart';
import '../../models/icu_daily_round_steps.dart';
import '../../models/intubation_guide.dart';
import '../../routes.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../widget/containers/icu_daily_round_container.dart';
import '../view_templates/intubation_content_view_template.dart';
import '../view_templates/tab_view_template.dart';

class AirwayAssessmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = airwayAssessmentGuide.map((e) {
      if (e is IntubationContent) {
        return e.heading;
      }
      if (e is ICUDailyRoundSteps) {
        return e.heading;
      }
      return e.toString();
    }).toList();
    return TabViewTemplate(Strings.airwayAssessmentTitle,
        color: AppColors.blue50,
        tabs: tabs,
        indicatorColor: AppColors.blue900,
        children: airwayAssessmentGuide.map((e) {
          if (e is IntubationContent) {
            return IntubationContentViewTemplate(
                key: PageStorageKey(e.heading),
                content: e,
                color: AppColors.blue500);
          }
          if (e is ICUDailyRoundSteps) {
            return ICUDailyRoundStepsContainer(
                steps: e, backgroundColor: AppColors.blue500);
          }
          throw Exception('Unknown model ${e.runtimeType}');
        }).toList());
  }
}
