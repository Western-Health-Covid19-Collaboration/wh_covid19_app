import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/IntubationChecklist.dart';
import '../../style.dart';
import '../../widget/lists/string_list.dart';

class IntubationChecklistCard extends StatelessWidget {
  final IntubationChecklistItem listItem;

  const IntubationChecklistCard({this.listItem});

  Widget getList() {
    if (listItem.notes != null && listItem.notes.isNotEmpty) {
      return StringList(
        items: listItem.notes,
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            listItem.title,
            style: Styles.textH4,
          ),
          getList()
        ],
      ),
    );
  }
}
