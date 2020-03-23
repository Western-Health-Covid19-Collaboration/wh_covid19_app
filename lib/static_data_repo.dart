class StaticDataRepo {
  ///Source:
  ///https://github.com/Western-Health-Covid19-Collaboration/source-documents/blob/master/COVID-SARI%20Treatment%20Poster%202020.pdf
  static const icu_ventilation_adjuncts_content = '''
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

  ///Source:
  ///https://github.com/Western-Health-Covid19-Collaboration/source-documents/blob/master/COVID-SARI%20Treatment%20Poster%202020.pdf
  static const icu_ventilation_initial_actions_content = '''
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
}
