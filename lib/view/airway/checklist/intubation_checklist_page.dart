import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../hard_data.dart';
import '../../../routes.dart';
import '../../../style.dart';
import '../../../widget/containers/intubation_checklist_container.dart';

class IntubationChecklistPage extends StatelessWidget {
  List<Widget> getChecklistTitles() {
    return intubationChecklist
        .map(
          (item) => Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Text(item.title)),
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
    return DefaultTabController(
      length: intubationChecklist.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Styles.appBarIconTheme,
          backgroundColor: AppColors.green50,
          title: const Text(
            'Intubation Checklist',
            style: Styles.textSemiBold,
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/icon/SVG/icon_infographic.svg',
              ),
              onPressed:
                () => Navigator.pushNamed(context, Routes.intubationChecklistInfographic),
            )
          ],
          bottom: TabBar(
            labelColor: AppColors.blackAlpha800,
            labelStyle: Styles.textSemiBold,
            unselectedLabelColor: AppColors.tabBarDeselectedText,
            indicatorColor: AppColors.green900,
            isScrollable: true,
            tabs: getChecklistTitles(),
          ),
        ),
        body: TabBarView(children: renderBody()),
      ),
    );
  }
}
