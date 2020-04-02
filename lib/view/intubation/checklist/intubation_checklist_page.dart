import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../hard_data.dart';
import '../../../style.dart';
import '../../../widget/containers/intubation_checklist_container.dart';
import '../../view_templates/tab_view_template.dart';

class IntubationChecklistPage extends StatelessWidget {
  List<String> getChecklistTitles() {
    return intubationChecklist
        .map(
          (item) => item.title,
        )
        .toList();
  }

  List<Widget> renderBody() {
    return intubationChecklist
        .map((item) => IntubationChecklistContainer(checklist: item.checklist))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabViewTemplate(
      'Intubation Checklist',
      tabs: getChecklistTitles(),
      color: AppColors.green50,
      indicatorColor: AppColors.green900,
      children: renderBody(),
    );
  }
}
