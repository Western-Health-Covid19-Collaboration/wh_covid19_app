import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../hard_data.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../widget/containers/ventilation_guide_container.dart';
import '../../view_templates/tab_view_template.dart';

class VentilationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = ventilationGuide.map((e) => e.heading).toList();

    return TabViewTemplate(
      Strings.ventilationTitle,
      color: AppColors.blue50,
      tabs: tabs,
      actions: <Widget>[
        // TODO: link to infographic page
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/icon/SVG/icon_infographic.svg',
          ),
          onPressed: () {},
        )
      ],
      children: ventilationGuide
          .map((e) => VentilationGuideContainer(guideSections: e.guideList))
          .toList(),
    );
  }
}
