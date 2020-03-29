import 'package:flutter/material.dart';

import '../../models/IntubationChecklist.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';
import '../../widget/lists/string_list.dart';

class IntubationChecklistItemWidget extends StatefulWidget {
  final IntubationChecklistItem listItem;
  final Color backgroundColor;
  final Color selectedBackgroundColor;

  const IntubationChecklistItemWidget(
      {@required this.listItem,
      this.backgroundColor = AppColors.grey50,
      this.selectedBackgroundColor = AppColors.grey600});
  @override
  _IntubationChecklistItemWidgetState createState() =>
      _IntubationChecklistItemWidgetState();
}

class _IntubationChecklistItemWidgetState
    extends State<IntubationChecklistItemWidget> {
  var _checked = false;

  Widget getList() {
    if (widget.listItem.notes != null && widget.listItem.notes.isNotEmpty) {
      return StringList(items: widget.listItem.notes);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
      elevation: 0,
      fallback: () {
        setState(() {
          _checked = !_checked;
        });
      },
      padding: const EdgeInsets.all(16),
      color: _checked ? widget.selectedBackgroundColor : widget.backgroundColor,
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
                    getList()
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
