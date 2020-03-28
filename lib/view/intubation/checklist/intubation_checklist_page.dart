import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/IntubationChecklist.dart';
import '../../../widget/containers/intubation_checklist_container.dart';

class IntubationChecklistPage extends StatelessWidget {
  final List<IntubationChecklist> checklistView = [
    const IntubationChecklist(title: 'Team', checklist: [
      IntubationChecklistItem(
          title: 'Anaesthesia contacted if difficulty anticipated',
          notes: ['Hello'])
    ]),
    // const IntubationChecklist(title: 'Patient', checklist: []),
    // const IntubationChecklist(title: 'Drugs', checklist: []),
    // const IntubationChecklist(title: 'Equipment', checklist: []),
    // const IntubationChecklist(title: 'Final', checklist: [])
  ];

  List<Widget> getChecklistTitles() {
    return checklistView
        .map(
          (item) => Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Text(item.title)),
        )
        .toList();
  }

  List<Widget> renderBody() {
    return checklistView
        .map((item) => IntubationChecklistContainer(checklist: item.checklist))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: checklistView.length,
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
