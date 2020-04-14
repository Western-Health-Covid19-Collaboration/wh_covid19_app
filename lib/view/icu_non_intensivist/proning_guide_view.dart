import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../hard_data.dart';
import '../../models/icu_daily_round_checklist.dart';
import '../../models/icu_daily_round_steps.dart';
import '../../models/prone_checklist.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/firebase.dart';
import '../../widget/containers/icu_daily_round_container.dart';
import '../../widget/containers/prone_checklist_container.dart';
import '../../widget/lists/checklist_card.dart';
import '../view_templates/tab_view_template.dart';

class ProningGuideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsProningGuideScreen);

    final tabs = proningGuide.map((e) {
      if (e is ICUDailyRoundSteps) {
        return e.heading;
      }
      if (e is ProneChecklist) {
        return e.heading;
      }
      return e.toString();
    }).toList();

    return ChangeNotifierProvider(
      create: (context) => ChecklistSelectionProvider<ProneChecklistItem>(),
      child: TabViewTemplate(
        Strings.proningGuideTitle,
        color: AppColors.blue50,
        tabs: tabs,
        children: proningGuide.map((e) {
          if (e is ICUDailyRoundSteps) {
            return ICUDailyRoundStepsContainer(steps: e);
          }
          if (e is ProneChecklist) {
            return ProneChecklistContainer(
              checklist: e,
            );
          }
          throw Exception('Unknown model ${e.runtimeType}');
        }).toList(),
      ),
    );
  }
}
