import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../hard_data.dart';
import '../../../models/IntubationChecklist.dart';
import '../../../routes.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../utils/firebase.dart';
import '../../../widget/containers/intubation_checklist_container.dart';
import '../../../widget/lists/checklist_card.dart';
import '../../view_templates/tab_view_template.dart';

class IntubationChecklistPage extends StatelessWidget {
  List<String> getChecklistTitles() {
    return intubationChecklist.map((item) => item.title).toList();
  }

  List<Widget> renderBody() {
    return intubationChecklist
        .map((item) => IntubationChecklistContainer(
            key: PageStorageKey(item.title), checklist: item.checklist))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Analytics set screen name, stays until another screen changes it
    Analytics.analyticsScreen(Constants.analyticsIntubationChecklistScreen);

    return ChangeNotifierProvider(
        create: (context) =>
            ChecklistSelectionProvider<IntubationChecklistItem>(),
        child: TabViewTemplate(
          Strings.intubationChecklistTitle,
          tabs: getChecklistTitles(),
          color: AppColors.green50,
          indicatorColor: AppColors.green900,
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon/SVG/icon_infographic.svg',
              ),
              onPressed: () => Navigator.pushNamed(
                  context, Routes.intubationChecklistInfographic),
            )
          ],
          children: renderBody(),
        ));
  }
}
