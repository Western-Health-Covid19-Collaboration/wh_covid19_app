import 'package:flutter/material.dart';

import '../../models/prone_checklist.dart';
import '../../style.dart';
import '../../widget/lists/checklist_card.dart';
import '../lists/intubation_checklist_item.dart';

class ProneChecklistContainer extends StatelessWidget {
  final ProneChecklist checklist;

  const ProneChecklistContainer({Key key, this.checklist}) : super(key: key);

  List<Widget> _renderList() {
    return checklist.sections.expand((e) => [e, ...e.checklist]).map((e) {
      if (e is ProneChecklistItem) {
        return ChecklistItemWidget<ProneChecklistItem>(
            item: e,
            content: IntubationChecklistItemWidget(listItem: e),
            backgroundColor: AppColors.appBackground,
            selectedBackgroundColor: AppColors.blue50);
      } else if (e is ProneChecklistSection) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(4, 16, 4, 4),
            child: Text(e.title, style: Styles.textH4));
      }
      throw Exception('Unknown element type ${e.runtimeType}');
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blue500,
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
