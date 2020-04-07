import 'package:flutter/material.dart';
import '../../style.dart';

import '../../widget/cards/reusable_card_base.dart';
import '../../widget/checkbox.dart';

class ChecklistItemWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Widget content;

  const ChecklistItemWidget(
      {
      @required this.content,
      this.backgroundColor = AppColors.grey50,
      this.selectedBackgroundColor = AppColors.grey600});

  @override
  _ChecklistItemWidget createState() =>
  _ChecklistItemWidget();
}

class _ChecklistItemWidget extends State<ChecklistItemWidget> {
  var _checked = false;

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
            ChecklistCheckbox(
                checked: _checked,
                onChecked: () {
                  setState(() {
                    _checked = !_checked;
                  });
                }),
            Expanded(
              child: widget.content
            )
          ],
        )
      ],
    );
  }
}