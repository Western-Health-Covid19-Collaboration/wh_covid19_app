import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../hard_data.dart';
import '../../../models/IntubationChecklist.dart';
import '../../../routes.dart';
import '../../../strings.dart';
import '../../../style.dart';
import '../../../widget/containers/intubation_checklist_container.dart';
import '../../view_templates/tab_view_template.dart';

/// Maintains the selected state of every checklist item.
/// Created by the IntubationChecklistPage screen, so that all checklists
/// are reset when screen is destroyed.
class ChecklistSelectionProvider<T> extends ChangeNotifier {
  final Set<T> _checkedState = {};

  bool isChecked(T item) {
    return _checkedState.contains(item);
  }

  void setChecked(T item, {bool checked = true}) {
    if (checked) {
      _checkedState.add(item);
    } else {
      _checkedState.remove(item);
    }
    notifyListeners();
  }
}

class IntubationChecklistPage extends StatelessWidget {
  List<String> getChecklistTitles() {
    return intubationChecklist.map((item) => item.title).toList();
  }

  List<Widget> renderBody() {
    return intubationChecklist
        .map((item) => IntubationChecklistContainer(checklist: item.checklist))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChecklistSelectionProvider<IntubationChecklistItem>(),
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
      )
   );
  }
}
