class VentilationGuideItem {
  final String heading;
  final List<VentiliationGuideSection> guideList;
  const VentilationGuideItem(this.heading, {this.guideList});
}

class VentiliationGuideSection {
  final String heading;
  final List<VentilationGuideItemListItem> list;
  const VentiliationGuideSection({this.heading, this.list});
}

class VentilationGuideItemListItem {
  final String icon, title;
  final List<String> notes;
  const VentilationGuideItemListItem({this.title, this.notes, this.icon = '✅'});
}
