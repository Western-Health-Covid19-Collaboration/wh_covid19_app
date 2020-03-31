/// Data structure consisting of a section title,
/// then list of sections containing icon, title and subtitle.
///
/// Used for intubation guide.
class IntubationContent {
  final String name;
  final List<IntubationSection> sections;

  const IntubationContent(this.name, this.sections);
}

class IntubationSection {
  final String name;
  final List<IntubationItem> items;

  const IntubationSection({this.name, this.items});
}

class IntubationItem {
  final String icon, title, subtitle;
  const IntubationItem(this.title, {this.subtitle, this.icon = '✅'});
}
