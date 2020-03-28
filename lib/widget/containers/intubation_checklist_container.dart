import 'package:flutter/material.dart';

import '../../models/IntubationChecklist.dart';
import '../../style.dart';
import '../lists/intubation_checklist_item.dart';

class IntubationChecklistContainer extends StatefulWidget {
  final List<IntubationChecklistItem> checklist;

  const IntubationChecklistContainer({Key key, this.checklist})
      : super(key: key);

  @override
  _IntubationChecklistContainerState createState() =>
      _IntubationChecklistContainerState();
}

class _IntubationChecklistContainerState
    extends State<IntubationChecklistContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.appBackground,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            children: <Widget>[
              IntubationChecklistItemWidget(listItem: widget.checklist[0])
            ],
          ),
        ));
  }
}
