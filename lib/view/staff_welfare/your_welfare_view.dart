import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../hard_data.dart';
import '../../strings.dart';
import '../../style.dart';
import '../../utils/url_utils.dart';
import '../../view/view_templates/tab_view_template.dart';
import '../../widget/containers/icu_daily_round_container.dart';

class YourWelfareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabViewTemplate(
      Strings.yourWelfareTitle,
      color: AppColors.grey50,
      actions: [
        IconButton(
          icon: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.call),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.call_made,
                  size: 20,
                ),
              )
            ],
          ),
          onPressed: () => UrlUtils.launchWithBrowser(whURL),
        ),
      ],
      tabs: yourWelfareSteps.map((s) => s.heading).toList(),
      children: yourWelfareSteps
          .map((e) => ICUDailyRoundStepsContainer(
              steps: e, backgroundColor: AppColors.grey500))
          .toList(),
    );
  }
}
