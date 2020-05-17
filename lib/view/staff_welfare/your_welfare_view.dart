import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../hard_data.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../view/view_templates/tab_view_template.dart';
import '../../widget/call_button.dart';
import '../../widget/containers/icu_daily_round_container.dart';

class YourWelfareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabViewTemplate(
      Strings.yourWelfareTitle,
      color: AppColors.grey50,
      actions: <Widget>[
        Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CallButton(whURL),
            )
          ],
        ),
      ],
      tabs: yourWelfareSteps.map((s) => s.heading).toList(),
      children: yourWelfareSteps
          .map(
            (e) => ICUDailyRoundStepsContainer(
                key: PageStorageKey(e.heading),
                steps: e,
                backgroundColor: AppColors.grey500),
          )
          .toList(),
    );
  }
}
