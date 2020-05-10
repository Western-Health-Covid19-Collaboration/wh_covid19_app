import 'package:flutter/material.dart';

import '../../models/icu_daily_round_steps.dart';
import '../../style.dart';
import '../../widget/cards/reusable_card_base.dart';

class ICUDailyRoundStepsCard extends StatelessWidget {
  final ICUDailyRoundStepSection section;

  const ICUDailyRoundStepsCard({this.section});

  Widget _renderItems(ICUDailyRoundItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.icon,
                  style: Styles.textH4,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 90,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 2, 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    item.title,
                    style: Styles.textBody,
                  ),
                ),
                if (item.subtitle != null)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      item.subtitle,
                      style: Styles.textFooter,
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _renderSubsection(ICUDailyRoundStepSubsection subsection) {
    Widget _renderHeading() {
      if (subsection.heading != null && subsection.heading.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 9),
          child: Text(subsection.heading, style: Styles.textH5),
        );
      }
      return Container();
    }

    Widget _renderFooter() {
      if (subsection.footer != null && subsection.footer.isNotEmpty) {
        return Text(subsection.footer, style: Styles.textFooter);
      }
      return Container();
    }

    return ReusableCardBase(
        color: AppColors.grey50,
        elevation: 0,
        child: <Widget>[
          _renderHeading(),
          Wrap(
            runSpacing: 16.0,
            direction: Axis.horizontal,
            children:
                subsection.list.map((item) => _renderItems(item)).toList(),
          ),
          _renderFooter()
        ]);
  }

  List<Widget> _getContent(List<ICUDailyRoundStepSubsection> subsections) {
    return subsections.map((e) => _renderSubsection(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (section.heading != null)
          Padding(
              padding: const EdgeInsets.fromLTRB(4, 14, 0, 0),
              child: Text(section.heading, style: Styles.textH4)),
        ..._getContent(section.subsections)
      ],
    );
  }
}
