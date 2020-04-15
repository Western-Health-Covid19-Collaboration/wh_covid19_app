import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../hard_data.dart';
import '../../../routes.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../view_templates/intubation_content_view_template.dart';
import '../../view_templates/tab_view_template.dart';

class IntubationGuidancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsIntubationGuideScreen);

    return TabViewTemplate(
      Strings.intubationGuideTitle,
      tabs: intubationGuide.map((e) => e.heading).toList(),
      color: AppColors.green50,
      indicatorColor: AppColors.green900,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/icon/SVG/icon_infographic.svg',
          ),
          onPressed: () => Navigator.pushNamed(
              context, Routes.intubationGuidanceInfographic),
        )
      ],
      children: intubationGuide
          .map((e) => IntubationContentViewTemplate(content: e))
          .toList(),
    );
  }
}
