class ICUDailyRoundSteps {
  final String heading, subHeading;
  final List<ICUDailyRoundStepSection> sections;

  const ICUDailyRoundSteps({this.heading, this.subHeading, this.sections});
}

class ICUDailyRoundStepSection {
  final String heading;
  final List<ICUDailyRoundStepSubsection> subsections;

  const ICUDailyRoundStepSection({this.heading, this.subsections});
}

class ICUDailyRoundStepSubsection {
  final String heading;
  final String footer;
  final List<ICUDailyRoundItem> list;

  const ICUDailyRoundStepSubsection({this.footer, this.heading, this.list});
}

class ICUDailyRoundItem {
  final String icon, title, subtitle;

  const ICUDailyRoundItem({this.icon, this.title, this.subtitle});
}
