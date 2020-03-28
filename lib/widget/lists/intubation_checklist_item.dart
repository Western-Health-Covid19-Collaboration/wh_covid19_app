import 'package:flutter/material.dart';
import 'package:wh_covid19/widget/cards/reusable_card_base.dart';
import 'package:wh_covid19/widget/lists/string_list.dart';

import '../../models/IntubationChecklist.dart';
import '../../style.dart';

class IntubationChecklistItemWidget extends StatefulWidget {
  final IntubationChecklistItem listItem;
  final Color backgroundColor;

  const IntubationChecklistItemWidget(
      {@required this.listItem,
      this.backgroundColor = AppColors.appBackground});
  @override
  _IntubationChecklistItemWidgetState createState() =>
      _IntubationChecklistItemWidgetState();
}

class _IntubationChecklistItemWidgetState
    extends State<IntubationChecklistItemWidget> {
  var _checked = false;

  Widget getList() {
    if (widget.listItem.notes.isNotEmpty) {
      return StringList(items: widget.listItem.notes);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
      fallback: () {
        setState(() {
          _checked = !_checked;
        });
      },
      padding: const EdgeInsets.all(16),
      child: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Checkbox(
                value: _checked,
                onChanged: (newValue) {
                  setState(() {
                    _checked = newValue;
                  });
                }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      widget.listItem.title,
                      style: AppStyles.textH4,
                    ),
                    // getList()
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
