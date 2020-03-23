import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/view/view_templates/html_text_card_view_template.dart';

import '../../../style.dart';

class InitialActionsView extends StatelessWidget {
  final title = 'Suggested initial actions';

  ///Source:
  ///https://github.com/Western-Health-Covid19-Collaboration/source-documents/blob/master/COVID-SARI%20Treatment%20Poster%202020.pdf
  static const kHtml = '''
  <h2>Suggested initial ventilator settings</h2>
<ul>
  <li>SIMV/VC</li>
  <li>
    Vt 4-8 ml/kg (ideal body weight)
    <ul>
      <li>Commence with 6 ml/kg</li>
      <li>Go up to 8 if dyssynchrony or pH <7.15</li>
      <li>Go down to 4 if Plat > 30 mmHg</li>
    </ul>
  </li>
  <li>
    PEEP - Two PEEP regimes in table at bottom of page
    <ul>
      <li>Higher PEEP regime for the most severe cases</li>
    </ul>
  </li>
  <li>RR 15-20</li>
  <li>
    Aims
    <ul>
      <li>PO2 55-70</li>
      <li>SO2 88-92%</li>
      <li>Pplat ≤ 30</li>
      <li>Driving Pressure ΔP ≤15</li>
    </ul>
  </li>
  <li>Permissive hypercapnia is OK: PCO2 ≥ 7.2</li>
</ul>
''';
  @override
  Widget build(BuildContext context) => HtmlTextCardViewTemplate(
      title: title, bgColor: AppColors.backgroundBlue, html: kHtml);
}
