import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../style.dart';

import '../../widget/cards/reusable_card_base.dart';
import '../../widget/checkbox.dart';

class ChecklistItemWidget<T> extends StatelessWidget {
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Widget content;
  final T item;

  const ChecklistItemWidget(
      {@required this.content,
      @required this.item,
      this.backgroundColor = Colors.white,
      this.selectedBackgroundColor = AppColors.grey600});

  @override
  Widget build(BuildContext context) {
    final selectionState = Provider.of<ChecklistSelectionProvider<T>>(context);
    final isChecked = selectionState.isChecked(item);

    return ReusableCardBase(
      elevation: 0,
      fallback: () {
        // setState not needed, because Provider takes care of rebuilding.
        selectionState.setChecked(item, checked: !isChecked);
      },
      padding: const EdgeInsets.all(16),
      color: isChecked ? selectedBackgroundColor : backgroundColor,
      child: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChecklistCheckbox(
                checked: isChecked,
                onChecked: () {
                  selectionState.setChecked(item, checked: !isChecked);
                }),
            Expanded(child: content)
          ],
        )
      ],
    );
  }
}

/// Maintains the selected state of every checklist item.
/// Created by the parent screen, so that all checklists
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
