import 'package:flutter/widgets.dart';

import '../../models/ventilation_guide.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';
import '../../widget/lists/string_list.dart';

class VentilationGuideCard extends StatelessWidget {
  final VentiliationGuideSection sectionItem;
  final Color backgroundColor;

  Widget _getList(List<String> notes) {
    if (notes != null && notes.isNotEmpty) {
      return StringList(
          items: notes, padding: const EdgeInsets.fromLTRB(8, 0, 0, 0));
    }
    return Container();
  }

  Widget _getHeading() {
    if (sectionItem.heading != null) {
      return _getPaddedItem(
          Text(
            sectionItem.heading,
            style: Styles.textH4,
          ),
          const EdgeInsets.fromLTRB(16, 24, 16, 16));
    }
    return Container();
  }

  Widget _getPaddedItem(Widget child, EdgeInsets padding) {
    return Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(8, 2, 4, 2),
        child: child);
  }

  Widget _renderVentilationGuideListItem(
      VentilationGuideItemListItem ventilationGuideItemListItem) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ventilationGuideItemListItem.icon,
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
                  Text(ventilationGuideItemListItem.title,
                      style: Styles.textH4),
                  _getList(ventilationGuideItemListItem.notes)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  const VentilationGuideCard({this.sectionItem, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ReusableCardBase(
      elevation: 0,
      color: backgroundColor,
      child: <Widget>[
        _getHeading(),
        ...sectionItem.list
            .map(
              (item) => _renderVentilationGuideListItem(item),
            )
            .toList(),
      ],
    );
  }
}
