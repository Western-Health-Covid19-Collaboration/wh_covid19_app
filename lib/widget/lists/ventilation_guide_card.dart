import 'package:flutter/widgets.dart';

import '../../models/ventilation_guide.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';
import '../../widget/lists/string_list.dart';

class VentilationGuideCard extends StatelessWidget {
  final VentilationGuideItemListItem listItem;
  final Color backgroundColor;

  Widget getList() {
    if (listItem.notes != null && listItem.notes.isNotEmpty) {
      return StringList(
          items: listItem.notes,
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0));
    }
    return Container();
  }

  const VentilationGuideCard({this.listItem, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
      elevation: 0,
      color: backgroundColor,
      child: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              listItem.icon,
              style: AppStyles.textH4,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(listItem.title, style: AppStyles.textH4),
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
