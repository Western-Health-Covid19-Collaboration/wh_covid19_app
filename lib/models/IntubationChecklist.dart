import 'package:flutter/material.dart';

class IntubationChecklistItem {
  final String title;
  final List<String> notes;

  const IntubationChecklistItem({@required this.title, this.notes});
}

class IntubationChecklist {
  final String title;
  final List<IntubationChecklistItem> checklist;

  const IntubationChecklist({@required this.title, @required this.checklist});
}
