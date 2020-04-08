import 'package:flutter/material.dart';

import '../../models/IntubationChecklist.dart';
import '../../style.dart';
import '../../widget/lists/checklist_card.dart';
import '../lists/intubation_checklist_item.dart';

class IntubationChecklistContainer extends StatelessWidget {
  final List<IntubationChecklistItem> checklist;

  const IntubationChecklistContainer({this.checklist});

  List<Widget> _renderList() {
    return checklist
        .map((e) => ChecklistItemWidget<IntubationChecklistItem>(
              item: e,
              content: IntubationChecklistItemWidget(listItem: e),
              backgroundColor: AppColors.appBackground,
              selectedBackgroundColor: AppColors.green50,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.green500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView(
            children: [
              Container(padding: const EdgeInsetsDirectional.only(top: 10)),
              ..._renderList(),
              Container(padding: const EdgeInsetsDirectional.only(bottom: 10)),
            ],
          ),
        ));
  }
}
