import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/view/view_templates/html_text_card_view_template.dart';

class AdjunctsView extends StatelessWidget {
  final title = 'Adjuncts';

  ///Source:
  ///https://github.com/Western-Health-Covid19-Collaboration/source-documents/blob/master/COVID-SARI%20Treatment%20Poster%202020.pdf
  static const kHtml = '''
  <h2>Adjuncts to ventilation</h2>
<ul>
  <li>Deep sedation</li>
  <li>
    Prone positioning
    <ul>
      <li>Strong recommendation for patients with severe ARDS</li>
      <li>12-18 hours per day</li>
      <li>May need many contiguous days of proning</li>
    </ul>
  </li>
  <li>
    Restrictive fluid regime
    <ul>
      <li>Strong recommendation from experience to date</li>
      <li>These patients are very prone to volume-induced pulmonary oedema</li>
      <li>Use vasopressors in preference to IV fluids once initial (modest) fluid resus has occurred</li>
    </ul>
  </li>
  <li>
    Neuromuscular blockade
    <ul>
      <li>NOT first line management</li>
      <li>Consider infusion of Cisatracurium in patient with refractory hypoxia</li>
    </ul>
  </li>
  <li>Routine use of recruitment maneuvers is not recommended</li>
  <li>
    Steroids are NOT recommended
    <ul>
      <li>No evidence of benefit, and probably harm</li>
      <li>Higher rate of HAP/VAP</li>
    </ul>
  </li>
  <li>Anti-viral therapies are NOT recommended</li>
  <li>
    Antibiotics
    <ul>
      <li>Antibiotics should still be given, as routine, in the initial empiric management of
any patient with acute respiratory failure</li>
      <li>There seems to be a moderate rate of secondary bacterial infection</li>
    </ul>
  </li>
  <li>
    Inhaled NO and prostacyclin
    <ul>
      <li>There is no evidence of benefit with either of these</li>
    </ul>
  </li>
</ul>
''';
  @override
  Widget build(BuildContext context) =>
      HtmlTextCardViewTemplate(title: title, html: kHtml);
}
