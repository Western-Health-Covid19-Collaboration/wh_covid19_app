class ICUDailyRoundSteps {
  final String heading;
  final List<ICUDailyRoundStepSection> sectionList;

  const ICUDailyRoundSteps({this.heading, this.sectionList});
}

class ICUDailyRoundStepSection {
  final String heading;
  final List<ICUDailyRoundStepSubsection> subsections;

  const ICUDailyRoundStepSection({this.heading, this.subsections});
}

class ICUDailyRoundStepSubsection {
  final String heading;
  final String notice;
  final List<ICUDailyRoundItem> list;

  const ICUDailyRoundStepSubsection({this.notice, this.heading, this.list});
}

class ICUDailyRoundItem {
  final String icon, title;

  const ICUDailyRoundItem({this.icon, this.title});
}

class ICUDailyRoundChecklist {
  final String heading;
  final List<ICUDailyRoundChecklistSection> sectionList;

  const ICUDailyRoundChecklist({this.heading, this.sectionList});
}

// Section



class ICUDailyRoundChecklistSection {
  final String heading;

  const ICUDailyRoundChecklistSection({this.heading});
}

// value

List<ICUDailyRoundChecklist> icuDailyRoundChecklist = [
  const ICUDailyRoundChecklist(heading: 'Headinghaha', sectionList: [
    ICUDailyRoundChecklistSection(heading: 'hehe')
  ])
];