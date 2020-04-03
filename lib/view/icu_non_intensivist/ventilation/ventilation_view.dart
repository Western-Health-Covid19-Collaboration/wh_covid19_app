import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/containers/ventilation_guide_container.dart';

import '../../view_templates/tab_view_template.dart';

class VentilationView extends StatelessWidget {
  final title = 'Ventilation';

  @override
  Widget build(BuildContext context) {
    return TabViewTemplate(
      title,
      color: AppColors.blue50,
      tabs: ventilationGuide.map((e) => e.heading).toList(),
      children: ventilationGuide
          .map((e) => VentilationGuideContainer(guide: e.guideList))
          .toList(),
    );
  }
}
