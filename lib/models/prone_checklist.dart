import 'package:flutter/material.dart';
import 'IntubationChecklist.dart';

class ProneChecklistItem extends IntubationChecklistItem{
  const ProneChecklistItem({@required String title, List<String> notes}):super(title:title, notes:notes);
}

class ProneChecklistSection {
  final String title;
  final List<ProneChecklistItem> checklist;
  const ProneChecklistSection({@required this.title, this.checklist});
}

///Prone checklist has text separator sections between checklist items
class ProneChecklist {
  ///Tab heading
  final String heading;
  final List<ProneChecklistSection> sections;
  const ProneChecklist({@required this.heading, @required this.sections});
}
