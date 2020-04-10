import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../hard_data.dart';
import '../../../routes.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../../widget/containers/ventilation_guide_container.dart';
import '../../view_templates/tab_view_template.dart';

class VentilationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsVentilationScreen);

    final tabs = ventilationGuide.map((e) => e.heading).toList();

    return TabViewTemplate(
      Strings.ventilationTitle,
      color: AppColors.blue50,
      tabs: tabs,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/icon/SVG/icon_infographic.svg',
          ),
          onPressed: () =>
              Navigator.of(context).pushNamed(Routes.ventilationInfographic),
        )
      ],
      children: ventilationGuide
          .map((e) => VentilationGuideContainer(guideSections: e.guideList))
          .toList(),
    );
  }
}
