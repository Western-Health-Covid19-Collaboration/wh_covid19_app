import 'package:flutter/material.dart';

import '../../models/icu_daily_round_checklist.dart';
import '../../style.dart';

class ICUDailyRoundChecklistCard extends StatelessWidget {
  final ICUDailyRoundChecklistSection item;

  const ICUDailyRoundChecklistCard({this.item});

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
            item.heading,
            style: Styles.textH4,
          ),
          Container(padding: const EdgeInsetsDirectional.only(top: 8)),
          Text(
            item.comment,
            style: Styles.textP,
          )
        ],
      ),
    );
  }
}
