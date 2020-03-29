import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/hard_data.dart';

import '../../../models/IntubationChecklist.dart';
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
          title: const Text('Intubation Checklist'),
          bottom: TabBar(
            isScrollable: true,
            tabs: getChecklistTitles(),
          ),
        ),
        body: TabBarView(children: renderBody()),
      ),
    );
  }
}
