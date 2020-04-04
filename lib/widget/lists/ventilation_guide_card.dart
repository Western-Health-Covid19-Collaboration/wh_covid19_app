import 'package:flutter/widgets.dart';

import '../../models/ventilation_guide.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';
import '../../widget/lists/string_list.dart';

class VentilationGuideCard extends StatelessWidget {
  final VentiliationGuideSection sectionItem;
  final Color backgroundColor;

  Widget getList(List<String> notes) {
    if (notes != null && notes.isNotEmpty) {
      return StringList(
          items: notes, padding: const EdgeInsets.fromLTRB(8, 0, 0, 0));
    }
    return Container();
  }

  Widget getHeading() {
    if (sectionItem.heading != null) {
      return getPaddedItem(
          Text(
            sectionItem.heading,
            style: Styles.textH4,
          ),
          const EdgeInsets.fromLTRB(16, 24, 16, 16));
    }
    return Container();
  }

  Widget getPaddedItem(Widget child, EdgeInsets padding) {
    return Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(8, 2, 4, 2),
        child: child);
  }

  const VentilationGuideCard({this.sectionItem, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
        elevation: 0,
        color: backgroundColor,
        child: <Widget>[
          getHeading(),
          ...sectionItem.list
              .map((item) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.icon,
                        style: Styles.textH4,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(item.title, style: Styles.textH4),
                              getList(item.notes)
                            ],
                          ),
                        ),
                      )
                    ],
                  )))
              .toList(),
        ]);
  }
}
