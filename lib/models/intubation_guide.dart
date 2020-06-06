import 'package:flutter/material.dart';

/// Data structure consisting of a section title,
/// then list of sections containing icon, title and subtitle.
/// Used for intubation guide.
class IntubationContent {
  final String heading;
  final List<IntubationSection> sections;
  const IntubationContent(this.heading, this.sections);
}

class IntubationSection {
  final String name;
  final List<IntubationItem> items;
  const IntubationSection({this.name, this.items});
}

class IntubationItem {
  final IconData icon;
  final String title, subtitle;
  const IntubationItem(this.title, {this.subtitle, this.icon});
}
