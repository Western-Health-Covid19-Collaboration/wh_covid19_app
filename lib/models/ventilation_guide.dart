class VentilationGuideItem {
  final String heading;
  final List<VentilationGuideItemListItem> guideList;

  const VentilationGuideItem(this.heading, {this.guideList});
}

class VentilationGuideItemListItem {
  final String icon, title;
  final List<String> notes;

  const VentilationGuideItemListItem({this.title, this.notes, this.icon = '✅'});
}
