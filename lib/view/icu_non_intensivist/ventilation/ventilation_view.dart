import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../hard_data.dart';
import '../../../models/icu_daily_round_steps.dart';
import '../../../models/intubation_guide.dart';
import '../../../routes.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../../widget/containers/icu_daily_round_container.dart';
import '../../view_templates/intubation_content_view_template.dart';
import '../../view_templates/tab_view_template.dart';

class VentilationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsVentilationScreen);

    final tabs = ventilationGuide.map((e) {
      if (e is IntubationContent) {
        return e.heading;
      }
      if (e is ICUDailyRoundSteps) {
        return e.heading;
      }
      return e.toString();
    }).toList();
    return TabViewTemplate(Strings.ventilationTitle,
        color: AppColors.blue50,
        tabs: tabs,
        indicatorColor: AppColors.blue900,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/SVG/icon_infographic.svg',
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.ventilationInfographic),
          )
        ],
        children: ventilationGuide.map((e) {
          if (e is IntubationContent) {
            return IntubationContentViewTemplate(
                content: e, color: AppColors.blue500);
          }
          if (e is ICUDailyRoundSteps) {
            return ICUDailyRoundStepsContainer(
                steps: e, backgroundColor: AppColors.blue500);
          }
          throw Exception('Unknown model ${e.runtimeType}');
        }).toList());
  }
}
