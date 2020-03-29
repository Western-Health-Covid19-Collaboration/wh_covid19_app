import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../hard_data.dart';
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
          iconTheme: AppStyles.appBarIconTheme,
          backgroundColor: AppColors.green50,
          title: const Text(
            'Intubation Checklist',
            style: AppStyles.textSemiBold,
          ),
          bottom: TabBar(
            unselectedLabelColor: AppColors.grey600,
            indicatorColor: AppColors.blackAlpha800,
            labelColor: AppColors.blackAlpha800,
            isScrollable: true,
            tabs: getChecklistTitles(),
          ),
        ),
        body: TabBarView(children: renderBody()),
      ),
    );
  }
}
