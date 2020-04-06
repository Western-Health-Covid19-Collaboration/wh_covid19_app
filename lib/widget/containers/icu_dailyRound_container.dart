import 'package:flutter/material.dart';
import '../../widget/cards/reusable_card_base.dart';

import '../../models/icu_dailyRound_steps.dart';
import '../../style.dart';

class ICUDailyRoundStepsCard extends StatelessWidget {
  final ICUDailyRoundStepSection section;

  const ICUDailyRoundStepsCard({this.section});

  Widget _renderItems(ICUDailyRoundItem item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.title)
        ],
      ),
    );
  }

  Widget _renderSubsection(ICUDailyRoundStepSubsection subsection) {
    return ReusableCardBase(
      color: AppColors.backgroundPurple,
      elevation: 0,
      child: <Widget>[
        Text(subsection.heading),
        ...subsection.list
          .map(
            (item) => _renderItems(item)
          )
          .toList(),
      ]
    );
  }

  List<Widget> _getContent(List<ICUDailyRoundStepSubsection> subsections) {
    return subsections
      .map(
        (e) => _renderSubsection(e)
      )
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Text(section.heading),
         ... _getContent(section.subsections)
        ],
      ),
    );
  }

}

class ICUDailyRoundContainer extends StatelessWidget {

  final List<Widget> list;

  const ICUDailyRoundContainer({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blue500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView(
            children: [
              Container(padding: const EdgeInsetsDirectional.only(top: 10)),
              ...list,
              Container(padding: const EdgeInsetsDirectional.only(bottom: 10)),
            ],
          ),
        ));
  }
}

class ICUDailyRoundStepsContainer extends StatelessWidget {
  final List<ICUDailyRoundStepSection> sections;

  const ICUDailyRoundStepsContainer({this.sections});

  List<Widget> __renderList() {
    return sections
        .map((e) => ICUDailyRoundStepsCard(section: e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(list: __renderList());
  }
}

class ICUDailyRoundChecklistContainer extends StatelessWidget {
  final List<ICUDailyRoundChecklistSection> sections;

  const ICUDailyRoundChecklistContainer({this.sections});

  @override
  Widget build(BuildContext context) {
    return ICUDailyRoundContainer(list: ICUDailyRoundChecklistCard(sections: sections).build(context));
  }
}

class ICUDailyRoundChecklistCard {
  final List<ICUDailyRoundChecklistSection> sections;

  const ICUDailyRoundChecklistCard({this.sections});

  List<Widget> build(BuildContext context) {
    return sections
        .map((e) => Text(e.heading + 'Check'))
        .toList();
  }
}