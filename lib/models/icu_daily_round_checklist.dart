class ICUDailyRoundChecklist {
  final String heading;
  final List<ICUDailyRoundChecklistSection> sectionList;

  const ICUDailyRoundChecklist({this.heading, this.sectionList});
}

class ICUDailyRoundChecklistSection {
  final String heading;
  final String comment;

  const ICUDailyRoundChecklistSection({this.heading, this.comment});
}