// import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/IntubationChecklist.dart';
import 'models/PPEStepInfo.dart';
import 'models/home_card.dart';
import 'models/icu_daily_round_checklist.dart';
import 'models/icu_daily_round_steps.dart';
import 'models/icu_daily_round_steps.dart';
import 'models/intubation_guide.dart';
import 'models/prone_checklist.dart';
import 'routes.dart';
import 'strings.dart';

/// Web urls
const String whURL = 'http://wh.cyphix.net/';
const String whCoronavirusInfoURL = 'https://coronavirus.wh.org.au/';
const String whAnaestheticMicrositeURL =
    'https://whcovid19.wixsite.com/covid19';
const String whIcuMicrositeURL = 'https://whicu2020.wixsite.com/icuquickguide';
const String feedbackFormUrl = 'https://forms.gle/zQtfhvswrKmjJjNV7';
const String proningTechniqueUrl =
    'https://www.youtube.com/watch?v=YFrA1cCuDnY&feature=youtu.be';

//Staff Welfare card list composition
const List<HomeCard> staffWelfare = [
  HomeCard(
    title: Strings.ppeTitle,
    description: 'Basic ICU technique',
    route: Routes.ppe,
  ),
  HomeCard(
    title: Strings.yourWelfareTitle,
    description: 'Info for mental well-being',
    route: Routes.staffWelfare,
  )
];

const List<HomeCard> airway = [
  HomeCard(
    title: Strings.intubationGuideTitle,
    description: 'WH step by step guide v6',
    route: Routes.intubationGuidance,
  ),
  HomeCard(
    title: Strings.intubationChecklistTitle,
    description: 'As per WH intubation team v6',
    route: Routes.intubationChecklist,
  ),
  HomeCard(
    title: Strings.extubationGuideTitle,
    description: 'WH Step by step guide v1.1',
    route: Routes.extubationGuidance,
  )
];

// ICU card list composition
const List<HomeCard> icu = [
  HomeCard(
    title: Strings.ventilationTitle,
    description: 'Basic ARDS strategy',
    route: Routes.ventilation,
  ),
  HomeCard(
    title: Strings.dailyRoundTitle,
    description: 'Basic A-G template',
    route: Routes.generalCare,
  ),
  HomeCard(
    title: Strings.tipsForCrossSkillingTitle,
    description: 'During COVID-19',
    route: Routes.tipsJuniorStaff,
  ),
];

// Resources
const List<HomeCard> resources = [
  HomeCard(
    title: Strings.whResourcesTitle,
    route: Routes.whResources,
  ),
  HomeCard(
    title: Strings.additionalResourcesTitle,
    route: Routes.additionalResources,
  ),
];

/// Data for a screen that can be rendered with
/// html_text_card_view_template.dart
class HtmlTextScreenData {
  final String title;
  final String htmlFile;

  const HtmlTextScreenData(this.title, this.htmlFile);

  Future<String> readFile() async {
    return await rootBundle.loadString(htmlFile);
  }
}

/// PPE - all the PPE content
const String ppeOffWarning = '''
Outside of PPE is contaminated!
If your hands get contaminated during PPE removal, immediately wash your hands or use an alcohol-based hand sanitizer.''';

const List<PPEStepInfo> ppeOnSteps = [
  PPEStepInfo(
    image: 'assets/images/steps/on_hand_hygiene.png',
    text: 'Hand Hygiene',
    notes: ['Wash hands or use an alcohol-based hand sanitizer'],
  ),
  PPEStepInfo(
    image: 'assets/images/steps/on_gown.png',
    text: 'Gown',
    notes: [
      'Fully cover torso from neck to knees, arms to end of wrists, and wrap around the back.',
      'Fasten at the neck and waist'
    ],
  ),
  PPEStepInfo(
    image: 'assets/images/steps/on_mask.png',
    text: 'Mask or Respirator',
    notes: [
      'Secure ties or elastic bands at crown of head and neck',
      'Fit flexible band to nose bridge',
      'Fit snug to face and below chin',
      'Fit-check respirator'
    ],
  ),
  PPEStepInfo(
    image: 'assets/images/steps/on_goggles.png',
    text: 'Goggles or face shield',
    notes: ['Place over face and eyes', 'Adjust to fit'],
  ),
  PPEStepInfo(
    image: 'assets/images/steps/on_hand_hygiene.png',
    text: 'Hand Hygiene',
    notes: ['Wash hands or use an alcohol-based hand sanitizer'],
  ),
  PPEStepInfo(
    image: 'assets/images/steps/on_gloves.png',
    text: 'Gloves',
    notes: ['Extend to cover wrist of isolation gown'],
  )
];

const PPEStepInfo handHygieneStep = PPEStepInfo(
  image: 'assets/images/steps/off_hand_hygiene.png',
  text: 'Hand Hygiene',
  notes: [
    'Wash hands or use an alcohol-based hand sanitizer immediately after removing PPE'
  ],
);

const List<PPEStepInfo> ppeOffMethod1Steps = [
  PPEStepInfo(
    image: 'assets/images/steps/off_gloves.png',
    text: 'Gloves',
    notes: [
      'Using a gloved hand, grasp the palm area of the other gloved hand and peel off first glove',
      'Hold removed glove in gloved hand',
      'Slide fingers of ungloved hand under remaining glove at wrist and peel off second glove over first glove',
      'Discard gloves in a waste container'
    ],
  ),
  handHygieneStep,
  PPEStepInfo(
    image: 'assets/images/steps/off_gown.png',
    text: 'Gown',
    notes: [
      'Pull gown away from neck and shoulders, touching inside of gown only',
      'Turn gown inside out',
      'Fold or roll into a bundle and discard in a waste container'
    ],
  ),
  handHygieneStep,
  PPEStepInfo(
    image: 'assets/images/steps/off_goggles.png',
    text: 'Goggles or Face Shield',
    notes: [
      'Remove goggles or faceshield from the back by lifting head band or ear pieces',
      'If the item is reusable, place in designated receptacle for reprocessing. Otherwise, discard in a waste container.'
    ],
  ),
  handHygieneStep,
  PPEStepInfo(
    image: 'assets/images/steps/off_mask.png',
    text: 'Mask or Respirator',
    notes: [
      'Grasp bottom ties or elastics of the mask/respirator, then the ones at the top, and remove without touching the front',
      'Discard in a waste container'
    ],
  ),
  handHygieneStep,
];

const List<PPEStepInfo> ppeOffMethod2Steps = [
  PPEStepInfo(
    image: 'assets/images/steps/off_gownandgloves.png',
    text: 'Gown and Gloves',
    notes: [
      'Grasp the gown in the front and pull away from your body so that the ties break, touching outside of gown only with gloved hands',
      'While removing the gown, fold or roll the gown inside-out into a bundle',
      'As you are removing the gown, peel off your gloves at the same time, only touching the inside of the gloves and gown with your bare hands. Place the gown and gloves into a waste container'
    ],
  ),
  handHygieneStep,
  PPEStepInfo(
    image: 'assets/images/steps/off_goggles.png',
    text: 'Goggles or Face Shield',
    notes: [
      'Remove goggles or faceshield from the back by lifting head band or ear pieces',
      'If the item is reusable, place in designated receptacle for reprocessing. Otherwise, discard in a waste container.'
    ],
  ),
  handHygieneStep,
  PPEStepInfo(
    image: 'assets/images/steps/off_mask.png',
    text: 'Mask or Respirator',
    notes: [
      'Grasp bottom ties or elastics of the mask/respirator, then the ones at the top, and remove without touching the front',
      'Discard in a waste container'
    ],
  ),
  handHygieneStep,
];

const List<IntubationChecklist> intubationChecklist = [
  IntubationChecklist(
    title: 'Team',
    checklist: [
      IntubationChecklistItem(
        title: 'Contact Anaesthesia',
        notes: [
          'FH - 8345 6590',
          'SH - 9055 3021',
        ],
      ),
      IntubationChecklistItem(
        title: 'Allocate Roles',
        notes: [
          'Team Leader',
          'Airway Doctor',
          'Airway Nurse',
          'Runner',
          'Scribe',
        ],
      ),
      IntubationChecklistItem(
        title: 'Don PPE in Anteroom & Buddy Check',
      ),
    ],
  ),
  IntubationChecklist(
    title: 'Patient',
    checklist: [
      IntubationChecklistItem(
        title: 'Patient Assessment',
        notes: [
          'Airway',
          'Allergies',
          'Medication',
          'Past History',
        ],
      ),
      IntubationChecklistItem(
        title: 'Haemodynamics optimised',
      ),
      IntubationChecklistItem(
        title: 'IV access',
        notes: ['2 preferable'],
      ),
      IntubationChecklistItem(
        title: 'Positioning',
        notes: ['Head up 45°', 'Oxford Pillow/Ramp'],
      ),
    ],
  ),
  IntubationChecklist(title: 'Equipment', checklist: [
    IntubationChecklistItem(
      title: 'Set up airway trolley',
      notes: ['Select CMAC blade'],
    ),
    IntubationChecklistItem(
      title: 'Induction Drugs',
      notes: [
        'Ketamine(Pack A) OR',
        'Propofol/Midazolam (Pack B)',
        'Sux & Rocuronium in both packs',
      ],
    ),
    IntubationChecklistItem(title: 'Vasopressor'),
    IntubationChecklistItem(
      title: 'Post-Intubation Planning',
      notes: [
        'Ventilator & Settings',
        'Sedation',
      ],
    ),
  ]),
  IntubationChecklist(title: 'Plan', checklist: [
    IntubationChecklistItem(
      title: 'Induction Plan',
      notes: ['Induction', 'Paralysis', 'Vasopressor'],
    ),
    IntubationChecklistItem(
      title: 'Plan A - Intubation',
      notes: [
        'CMAC',
        'Stylet/Bougie',
      ],
    ),
    IntubationChecklistItem(title: 'Plan B - LMA(iGEL)'),
    IntubationChecklistItem(
      title: 'Plan C - Mask Ventilation',
      notes: ['2 handed grip', '2 person technique', 'Consider OPA/NPA'],
    ),
    IntubationChecklistItem(
      title: 'Plan D - Surgical Airway',
      notes: ['Scalpel-Bougie-ETT'],
    ),
  ]),
  IntubationChecklist(
    title: 'Final',
    checklist: [
      IntubationChecklistItem(title: 'Patient Position Optimised'),
      IntubationChecklistItem(title: 'Turn CMAC on'),
      IntubationChecklistItem(title: 'Suction Working'),
      IntubationChecklistItem(
          title: 'Connect Monitoring', notes: ['BP (1 min cycle)']),
      IntubationChecklistItem(title: 'Confirm etCO2 Trace'),
      IntubationChecklistItem(title: 'Pre-oxygenation'),
      IntubationChecklistItem(
          title: 'Order of Placement:',
          notes: ['Mask', 'Filter', 'ETCO2', 'PEEP', 'self-inflating bag']),
      IntubationChecklistItem(title: 'Oxygen 15l/min'),
      IntubationChecklistItem(title: 'Fluid running'),
      IntubationChecklistItem(title: 'Induction Plan Clear'),
      IntubationChecklistItem(title: 'Airway Plans Clear'),
      IntubationChecklistItem(title: 'Everyone Ready')
    ],
  ),
];
const List<IntubationContent> intubationGuide = [
  IntubationContent(
    'Activation',
    [
      IntubationSection(
        items: [
          IntubationItem('Prior to activating Intubation team:',
              subtitle:
                  '• Clearly documented goals of care \n• Acute Resuscitation Plan (ARP)\n• Appropriate for intubation?',
              icon: '💬'),
          IntubationItem('Call EARLY for deteriorating patient review',
              icon: '📞',
              subtitle:
                  'Clinical concern:\n • SaO2 <92% on 6l/M\n • Resp. distress or RR >24'),
          IntubationItem('MET and code blue calls as per WH guidelines:',
              icon: '🚨',
              subtitle:
                  '• ICU liaison nurses to escalate if required\n• Code blue - Intubation team if COVID high risk/confirmed'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Preparation',
    [
      IntubationSection(
        name: 'Location',
        items: [
          IntubationItem(
              'Intubating team to decide if patient is stable enough for transfer'),
          IntubationItem(
            'Preference of Intubation location:',
            subtitle:
                '1. ICU NPR\n2. NPR in ED or other sites\n3. Designated COVID19 theatre\n4. ED rooms, ward rooms',
          ),
        ],
      ),
      IntubationSection(
        name: 'PPE',
        items: [
          IntubationItem('Don AGE PPE prior to entering Intubation room',
              icon: '🚨', subtitle: 'Follow step-by-step guide'),
          // ignore: prefer_single_quotes
          IntubationItem("“Buddy system” - use a Spotter", icon: '😊'),
        ],
      ),
      IntubationSection(
        name: 'Staff Positioning',
        items: [
          IntubationItem('Refer to SAS Infographic',
              subtitle: ' available through PDF icon ↗️'),
        ],
      ),
      IntubationSection(
        name: 'Communication',
        items: [
          IntubationItem(
            'Support team will stand outside the anteroom',
          ),
          IntubationItem(
            'Place any clean equipment required on "exchange trolley" inside the anteroom',
          ),
          IntubationItem(
            'Use Walkie talkie or other means for communication',
            icon: '📞',
          ),
        ],
      ),
    ],
  ),
  IntubationContent(
    'Intubation',
    [
      IntubationSection(
        name: 'Preoxygenation',
        items: [
          IntubationItem('Circuit osrder of Placement:',
              subtitle:
                  ' • Mask\n • Filter\n • ETCO2\n • PEEP\n • Laerdal bag'),
          IntubationItem(
            'Tight fitting mask, with two-hand grip',
          ),
          IntubationItem(
            '45° head up',
          ),
        ],
      ),
      IntubationSection(
        name: 'Rapid sequence induction',
        items: [
          IntubationItem('Modified RSI technique',
              subtitle:
                  '• Rocuronium >1.5mg/kg IBW or\n• Suxamethonium 1.5mg/kg IBW\n• Wait 60s for paralysis'),
          IntubationItem('Avoid routine cricoid pressure'),
          IntubationItem(
            'Avoid BMV during apnoea unless life threatening hypoxia',
            icon: '⚖',
          ),
        ],
      ),
      IntubationSection(
        name: 'Intubation',
        items: [
          IntubationItem('Use Videolaryngoscopy for 1st attempt',
              subtitle: '• Indirect view'),
          IntubationItem(' Size 8.0 ETT if available'),
          IntubationItem('Cuff up with 10ml air prior to ventilating',
              icon: '🛑'),
          IntubationItem(
            'Confirm ventilation:',
            subtitle:
                '• Capnography waveform\n• Chest movement\n• Auscultation',
          ),
          IntubationItem(
            'If Plan A - Intubation fails:',
            subtitle:
                '• Plan B i-gel LMA\n• Plan C 2-handed BMV\n• Plan D Scalpel-bougie-tube',
          ),
        ],
      )
    ],
  ),
  IntubationContent(
    'Transfer to ventilator',
    [
      IntubationSection(
        items: [
          IntubationItem('Ventilator preferences:',
              subtitle:
                  ' 1. ICU Marquet\n 2. ED Hamilton\n 3. ICU/Other Oxylog/Hamilton'),
          IntubationItem(
            'Circuit of Marquet to be prepared by ICU nurse',
            subtitle:
                '• SIMV + PS, volume control\n• Vt 6-8ml/kg IBW (often 400-500ml)\n• RR 12',
          ),
          IntubationItem('Airway doctor:',
              subtitle:
                  ' • Turn off O2 flow to self-inflating bag\n • Clam the ETT with a chest drain clamp\n • Disconnect ETT from HME\n • Connect prepared circuit to ETT\n • Unclamp ETT\n •Turn ventilator on\n • Commence ventilation\n • Sleek ETT connections '),
          IntubationItem('ETCO2:',
              subtitle:
                  '• In ICU NPR: ETCO2 not part of ventilator circuit\n • In ED/Ward: ETCO2 should be part of circuit for transport'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Post-ETT',
    [
      IntubationSection(
        items: [
          IntubationItem(
              'Insert NG tube immediately post-intubation in the NPR'),
          IntubationItem('PPE removed as per WH guidelines', icon: '🛑'),
          IntubationItem(
            'Move patient to a COVID19 cubicle in ICU as soon as available',
          ),
          IntubationItem('Lines and CXR outside NPR'),
          IntubationItem('Debrief and share lessons', icon: '💬'),
        ],
      )
    ],
  )
];

const List<IntubationContent> extubationGuide = [
  IntubationContent(
    'Planning',
    [
      IntubationSection(
        items: [
          IntubationItem('Is patient clinically stable to extubate now?'),
          IntubationItem('Assemble team',
              subtitle: 'Anaesthetists and anaesthetic nurse ONLY'),
          IntubationItem('Discuss extubation plan', icon: '💬'),
          IntubationItem(
              'Consider strategies to reduce coughing if you are familiar with them',
              subtitle: '• Lignocaine\n'
                  '• Remifentanil\n'
                  '• Spont breathing deep extubation\n'
                  '• Dexmedetomidine\n'
                  '• LMA exchange',
              icon: '🤔'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Prepare',
    [
      IntubationSection(
        items: [
          IntubationItem('Have equipment available for reintubation',
              icon: '⚙'),
          IntubationItem('Have a runner in the anaesthetic bay', icon: '🏃'),
          IntubationItem(
              'Ensure viral filter and etCO2 ready to be connected to disposable mask following extubation',
              icon: '🦠'),
        ],
      )
    ],
  ),
  IntubationContent(
    'PPE',
    [
      IntubationSection(
        items: [
          IntubationItem('All staff in the room must wear FULL PPE',
              subtitle: 'Including N95 mask and eye protection'),
          IntubationItem(
              'Buddy check each other PPE prior to performing extubation',
              icon: '😊'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Perform',
    [
      IntubationSection(
        items: [
          IntubationItem('Extubate patient with cuff down and APL fully open',
              subtitle: 'NO positive pressure'),
          IntubationItem('Carefully discard ETT into clinical waste bin',
              icon: '🚮'),
          IntubationItem(
              'Immediately apply face mask to patient with 2 hand grip',
              subtitle: 'Over nasal prongs if present'),
          IntubationItem(
              'Continue to apply face mask until able to protect their own airway'),
          IntubationItem(
              'Switch to Hudson or nasal prongs O2 with a surgical mask over the top'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Post-ETT',
    [
      IntubationSection(
        items: [
          IntubationItem(
              'Carefully discard face mask and other disposable equipment into clinical waste',
              icon: '🚮'),
          IntubationItem(
              'Patient must wear surgical mask on transfer back to ward',
              icon: '😷'),
          IntubationItem('Doff PPE with buddy check', icon: '😊'),
        ],
      )
    ],
  ),
];

const ventilationGuide = [
  IntubationContent(
    'Principles',
    [
      IntubationSection(
        items: [
          IntubationItem('Do the simple things well!', icon: '✅'),
          IntubationItem('Follow a stepwise approach!', icon: '👟'),
          IntubationItem('Balance the risks of organ support', icon: '⚖️'),
          IntubationItem('Minimise the risks of cross-infection (see PPE)',
              icon: '😷'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Initial Steps', sections: [
    ICUDailyRoundStepSection(
      heading: 'Lung Protective Ventilation',
      subsections: [
        ICUDailyRoundStepSubsection(
          list: [
            ICUDailyRoundItem(title: 'Ventilator setting: SIMV/VC', icon: '🔈'),
            ICUDailyRoundItem(
                title: 'Low tidal volume commence with 6ml/kg body weight',
                icon: '🌊'),
            ICUDailyRoundItem(title: 'RR 20', icon: '🎚'),
            ICUDailyRoundItem(
                title: 'PEEP: aim high, start 10cmH20, see table!', icon: '👀'),
          ],
        )
      ],
    ),
    ICUDailyRoundStepSection(heading: 'Aims', subsections: [
      ICUDailyRoundStepSubsection(
        list: [
          ICUDailyRoundItem(title: 'SaO₂ 88-92%', icon: '😅'),
          ICUDailyRoundItem(title: 'PaO₂ 55-70mmHg', icon: '😬'),
          ICUDailyRoundItem(title: 'Pplat < 30', icon: '🙃'),
          ICUDailyRoundItem(
              title: 'pH > 7.20',
              subtitle: '(Permissive hypercapnia is ok)',
              icon: '🤔'),
        ],
      )
    ]),
    ICUDailyRoundStepSection(
      heading: 'If Deteriorating',
      subsections: [
        ICUDailyRoundStepSubsection(
          list: [
            ICUDailyRoundItem(title: 'ICU consultant review!', icon: '🚨'),
            ICUDailyRoundItem(title: 'Proceed to Adjuncts page', icon: '👉'),
          ],
        )
      ],
    )
  ]),
  ICUDailyRoundSteps(heading: 'Adjuncts', sections: [
    ICUDailyRoundStepSection(
      heading: 'If Initial Stepwise Approach Fails Try',
      subsections: [
        ICUDailyRoundStepSubsection(
          list: [
            ICUDailyRoundItem(title: 'Deep sedation', icon: '🛌'),
            ICUDailyRoundItem(
                title: 'Restrictive fluid regime',
                icon: '💧',
                subtitle: 'Aim for Negative fluid balance'),
            ICUDailyRoundItem(title: 'Ensure senior ICU review', icon: '👉'),
            ICUDailyRoundItem(
              title: 'Neuromuscular blockade',
              icon: '💪',
              subtitle:
                  'NOT first-line management - discuss with ICU consultant',
            ),
            ICUDailyRoundItem(title: 'Try prone position', icon: '🙇‍♀️'),
          ],
        ),
      ],
    )
  ])
];

const List<ICUDailyRoundSteps> icuDailyRoundSteps = [
  ICUDailyRoundSteps(heading: 'A - Airway', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'ETT (Endotracheal Tube)',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '👀', title: 'Size?'),
            ICUDailyRoundItem(icon: '📍', title: 'Position?'),
            ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
            ICUDailyRoundItem(
                icon: '🔒', title: 'Are all connections secured with sleek?'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If planned for extubation:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'When?'),
            ICUDailyRoundItem(icon: '📍', title: 'Where?'),
            ICUDailyRoundItem(icon: '💨', title: 'How? (see airway resources)'),
            ICUDailyRoundItem(
                icon: '😮', title: 'Does ETT need advancing / withdrawing?'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'B - Breathing', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '💨', title: 'SpO₂?'),
        ICUDailyRoundItem(icon: '💉', title: 'PaO₂?'),
        ICUDailyRoundItem(icon: '🔍', title: 'CXR reviewed?'),
        ICUDailyRoundItem(icon: '🅰️', title: 'ABG reviewed?'),
        ICUDailyRoundItem(
            icon: '🌬', title: 'Current ventilator settings reviewed?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Standard Targets',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: '🎯', title: 'PaO₂ > 55-60mmHg\nSaO₂ > 88-92%'),
            ICUDailyRoundItem(
                icon: '🎯', title: 'pH > 7.20\nif pH normal, CO₂ 35-45'),
            ICUDailyRoundItem(
                icon: '🎯', title: 'VTe 4-8 ml/kg\nwith Pplat < 30'),
            ICUDailyRoundItem(
                icon: '🎯',
                title:
                    'PEEP: According to PEEP Table\nAlso check ETT lines NG ICC'),
          ]),
      ICUDailyRoundStepSubsection(
          heading: 'If FiO₂ > 0.6 and PEEP > 15',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: '🕵️‍♀️', title: 'Specialist review and see resources'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'C - Circulation', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '❤️', title: 'HR / rhythm / MAP?'),
        ICUDailyRoundItem(icon: '📈', title: 'ECG / Echocardigram?'),
        ICUDailyRoundItem(
            icon: '💉',
            title:
                'Lactate? (Signs of end organ perfusion: mottled / cool peripheries / cap refill time?)'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: 'Aims', footer: '', list: [
        ICUDailyRoundItem(icon: '🎯', title: 'MAP > 65'),
        ICUDailyRoundItem(icon: '🎯', title: '[Hb] > 70'),
      ]),
      ICUDailyRoundStepSubsection(
          heading: 'If haemodyamically unstable / MAP < 65',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: '💉',
                title:
                    'Commence noradrenaline, see resources / echocardiogram'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'D - Neurological', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '😣', title: 'Riker score & pain assessment?'),
        ICUDailyRoundItem(
            icon: '😴', title: 'Current sedation / analgesic infusions?'),
        ICUDailyRoundItem(icon: '💪', title: 'Neuromuscular blockers?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: '🎯',
            title: 'Analgesia / sedation plan and target (see resources)'),
        ICUDailyRoundItem(
            icon: '✋',
            title:
                'Consider sedation break (see resources) / cessation of neuromuscular blocker'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'E - Infection/Exposure', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '🤒', title: 'Temperature?'),
        ICUDailyRoundItem(icon: '🧫', title: 'Culture results?'),
        ICUDailyRoundItem(icon: '💊', title: 'Current antibiotics?'),
        ICUDailyRoundItem(icon: '⚔️', title: 'Invasive lines?'),
        ICUDailyRoundItem(
            icon: '🤕', title: 'Pressure areas / wounds / cellulitis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '🦠', title: 'Antimicrobials (see resources)'),
        ICUDailyRoundItem(
            icon: '😷',
            title: 'If patient deteriorating / septic workup (see resources)'),
        ICUDailyRoundItem(icon: '🔍', title: 'Can lines be removed?'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'F - Renal', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '🚽', title: 'Current urine output?'),
        ICUDailyRoundItem(icon: '💧', title: 'Fluid balance last 24 hours?'),
        ICUDailyRoundItem(icon: '⚡️', title: 'Electrolytes?'),
        ICUDailyRoundItem(icon: '⚖️', title: 'Acid-Base status?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Fluid Balance',
          footer: 'Target for next 24 hours + diuretics',
          list: [
            ICUDailyRoundItem(
                icon: '🎯',
                title: 'Aim for negative fluid balance around 1L/d stable'),
          ]),
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: '🔋', title: 'Electrolyte supplementation / goals'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'G - GIT', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: '📍', title: 'NGT confirmed correctly positioned?'),
        ICUDailyRoundItem(icon: '👀', title: 'Abdominal examination?'),
        ICUDailyRoundItem(icon: '🔍', title: 'LFTs checked?'),
        ICUDailyRoundItem(icon: '🥣', title: 'Absorbing feeds?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: '🍎', title: 'Nutrition (resources)'),
        ICUDailyRoundItem(icon: '🤕', title: 'Any surgical issues?'),
        ICUDailyRoundItem(icon: '🔍', title: 'Any liver issues?'),
        ICUDailyRoundItem(
            icon: '💊', title: 'Change meds\n(NG → IV or vice versa)'),
      ]),
    ])
  ])
];

const List<ICUDailyRoundChecklist> icuDailyRoundChecklist = [
  ICUDailyRoundChecklist(heading: 'Final Check', sectionList: [
    ICUDailyRoundChecklistSection(
        heading: 'Resuscitation status', comment: 'Goals of care determined?'),
    ICUDailyRoundChecklistSection(
        heading: 'Feeds', comment: 'Charted and considered?'),
    ICUDailyRoundChecklistSection(
        heading: 'Lines', comment: 'Can they be removed?'),
    ICUDailyRoundChecklistSection(
        heading: 'Aperients',
        comment:
            'When were bowels last open? Regular laxatives and early insertion of faecal containment device'),
    ICUDailyRoundChecklistSection(
        heading: 'Thromboprophylaxis',
        comment:
            'In general enoxaparin 40mg/d (20mg/d with severe renal failure)'),
    ICUDailyRoundChecklistSection(
        heading: 'Communication / Family',
        comment:
            'Is patient aware of what is happening? Is family aware of what is happening?'),
    ICUDailyRoundChecklistSection(
        heading: 'Head up',
        comment:
            'Head of the bead elevated to 30 degrees in the intubated patient'),
    ICUDailyRoundChecklistSection(
        heading: 'Ulcer prophylaxis',
        comment: 'Esomeprazole 20mg iv d in the intubated patient'),
    ICUDailyRoundChecklistSection(
        heading: 'Glucose target',
        comment: '6 – 12 (start actrapid if 2 X BSL > 12, titrate to BSL)'),
  ])
];
const yourWelfareSteps = [
  ICUDailyRoundSteps(
      heading: 'The basics',
      subheading: "It's okay to not be okay.\nPlease look after yourself.",
      sections: [
        ICUDailyRoundStepSection(
          heading: 'Basic tips',
          subsections: [
            ICUDailyRoundStepSubsection(list: [
              ICUDailyRoundItem(icon: '🛑', title: 'STOP, BREATHE then think'),
              ICUDailyRoundItem(icon: '🗞', title: 'Limit news intake'),
            ])
          ],
        ),
        ICUDailyRoundStepSection(
            heading: 'Take care of basic needs ',
            subsections: [
              ICUDailyRoundStepSubsection(list: [
                ICUDailyRoundItem(icon: '🛌', title: 'Rest'),
                ICUDailyRoundItem(icon: '🥦', title: 'Eat well'),
                ICUDailyRoundItem(
                    icon: '🏃‍♀️', title: 'Engage in physical activity'),
                ICUDailyRoundItem(
                    icon: '🥰', title: 'Stay in contact with loved ones'),
                ICUDailyRoundItem(
                    icon: '🧻',
                    title:
                        'Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)'),
                ICUDailyRoundItem(
                    icon: '🔋',
                    title:
                        'Consider psychological energy levels. “Fill up” after “Emptying the tank”')
              ])
            ])
      ]),
  ICUDailyRoundSteps(heading: 'Pre-phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'Pre-phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: 0', list: [
          ICUDailyRoundItem(
              icon: '😟',
              title: 'Anticipatory anxiety about what’s on its way.'),
          ICUDailyRoundItem(
              icon: '🤪',
              title:
                  'Inability to think clearly, feeling overwhelmed, planning.'),
          ICUDailyRoundItem(icon: '🤷‍♂️', title: 'Communication errors.'),
          ICUDailyRoundItem(
              icon: '😤', title: 'Tension in working relationships.'),
          ICUDailyRoundItem(icon: '🔥', title: '“Readiness” burnout.'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👫', title: 'Reassure colleagues'),
        ICUDailyRoundItem(icon: '💪', title: 'Family and personal planning'),
        ICUDailyRoundItem(icon: '💡', title: 'Communication updates'),
        ICUDailyRoundItem(icon: '🙋‍♀️', title: 'Employee wellbeing officer'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Initial phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'Initial phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: 1', list: [
          ICUDailyRoundItem(
              icon: '🤮',
              title:
                  'Starting to get going, lots of trying out, lost time, repetition and frustration.'),
          ICUDailyRoundItem(icon: '😰', title: 'Further anticipatory anxiety'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👫', title: 'Battlefield central plan'),
        ICUDailyRoundItem(icon: '📢', title: 'Centralised communication'),
        ICUDailyRoundItem(icon: '🗣', title: 'It’s OK to say you’re not OK!'),
        ICUDailyRoundItem(icon: '💬', title: 'Pre-brief and debrief each day'),
        ICUDailyRoundItem(icon: '🛀', title: 'Sleep hygiene!'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Core phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'Core phase',
      subsections: [
        ICUDailyRoundStepSubsection(
            heading: 'Number of cases: Full scale/Multiple',
            list: [
              ICUDailyRoundItem(
                  icon: '🚨', title: 'Greatest risk period psychologically'),
              ICUDailyRoundItem(
                  icon: '😨',
                  title: 'Fear infection and implications for families'),
              ICUDailyRoundItem(icon: '😩', title: 'Overwhelming workload'),
              ICUDailyRoundItem(icon: '🤖', title: 'Adrenaline and auto-pilot'),
              ICUDailyRoundItem(icon: '🥵', title: 'Exhaustion'),
              ICUDailyRoundItem(icon: '😵', title: 'Distress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👥', title: 'Promote peer support'),
        ICUDailyRoundItem(
            icon: '✋', title: 'Management are visible and available'),
        ICUDailyRoundItem(icon: '📝', title: 'Regular communication bulletins'),
        ICUDailyRoundItem(icon: '💬', title: 'Small pre-brief and debrief'),
        ICUDailyRoundItem(icon: '🧸', title: 'Psychological first-aid'),
        ICUDailyRoundItem(
            icon: '💤', title: 'Ensure the basics (as per previous page)'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'End phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'End phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: Few', list: [
          ICUDailyRoundItem(icon: '👀', title: 'Lookout for each other!'),
          ICUDailyRoundItem(icon: '🥵', title: 'Exhaustion'),
          ICUDailyRoundItem(icon: '🤬', title: 'Stress'),
          ICUDailyRoundItem(icon: '😖', title: 'Post-traumatic stress'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👫', title: 'Staff and 1:1 group sessions'),
        ICUDailyRoundItem(
            icon: '👏', title: 'Gratitude and thanks to all our colleagues'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Long term', sections: [
    ICUDailyRoundStepSection(
      heading: 'Long term',
      subsections: [
        ICUDailyRoundStepSubsection(
            heading: 'Number of cases: 0 (or very low)',
            list: [
              ICUDailyRoundItem(icon: '👀', title: 'Lookout for each other!'),
              ICUDailyRoundItem(icon: '🧐', title: 'Reflection and learning'),
              ICUDailyRoundItem(icon: '😖', title: 'Post-traumatic stress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '💬', title: 'Debriefing (Staff and 1:1 group sessions)'),
        ICUDailyRoundItem(
            icon: '‼️',
            title: 'Look out for signs of PTSD:',
            subtitle: '• Edgy\n• Poor sleep\n• Avoid reminders'),
        ICUDailyRoundItem(
            icon: '📖', title: 'Learning and preparing for future'),
        ICUDailyRoundItem(
            icon: '👏', title: 'Gratitude and thanks to all our colleagues'),
      ])
    ])
  ])
];

const proningGuide = [
  ICUDailyRoundSteps(heading: 'Indication', sections: [
    ICUDailyRoundStepSection(heading: 'Indications', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '😓', title: 'Severe ARDS with hypoxia'),
        ICUDailyRoundItem(icon: '🤕', title: 'Posterior wounds / skin flaps'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Contraindications', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '😓', title: 'Lack of staff'),
        ICUDailyRoundItem(icon: '❌', title: 'Untrained staff'),
        ICUDailyRoundItem(icon: '⏰', title: 'Out of hours'),
        ICUDailyRoundItem(icon: '🤲', title: 'Open abdomen'),
        ICUDailyRoundItem(icon: '🛌', title: 'C spine precautions'),
        ICUDailyRoundItem(icon: '⚖️', title: 'Haemodynamic instability'),
      ])
    ]),
  ]),
  ICUDailyRoundSteps(heading: 'Staff Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Team', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '🤓', title: 'ICU consultant aware'),
        ICUDailyRoundItem(
            icon: '👩‍⚕️',
            title: 'Specialised proning team on site?',
            subtitle: '(Contact ICU physio)'),
        ICUDailyRoundItem(icon: '👫', title: 'Adequate staffing on unit?'),
        ICUDailyRoundItem(
            icon: '👍', title: 'Staff trained in proning procedure'),
        ICUDailyRoundItem(icon: '6', title: '6 x staff available for proning'),
        ICUDailyRoundItem(
            icon: '☝️',
            title: 'Allocate roles',
            subtitle:
                '• Airway x 1\n• Trunk and limbs x 4\n• Lines and equipment x1'),
        ICUDailyRoundItem(icon: '😮', title: 'Able to reintubate?'),
      ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Equipment and Preparation',
        subsections: [
          ICUDailyRoundStepSubsection(list: [
            ICUDailyRoundItem(icon: '🛒', title: 'Crash trolley'),
            ICUDailyRoundItem(icon: '⚫', title: 'ECG dots'),
            ICUDailyRoundItem(icon: '✨', title: 'Fresh sheet x 2'),
            ICUDailyRoundItem(icon: '🛹', title: 'Slide sheet x 2'),
            ICUDailyRoundItem(icon: '☁️', title: 'Foldable Pillows x 3'),
            ICUDailyRoundItem(icon: '🛏️', title: 'Clear bed area'),
          ])
        ])
  ]),
  ICUDailyRoundSteps(heading: 'Patient Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'General Considerations', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '🔍', title: 'Review indications and contraindications'),
        ICUDailyRoundItem(icon: '📐', title: 'Check ROM of neck - 90°'),
        ICUDailyRoundItem(
            icon: '☝️', title: 'Explain procedure to patient/family'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Airway', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '🕵️',
            title: 'Check ETT position on CXR',
            subtitle: '(Document lip level)'),
        ICUDailyRoundItem(icon: '🌬️', title: 'Check patient airway grade'),
        ICUDailyRoundItem(icon: '🤐', title: 'Secure ETT'),
        ICUDailyRoundItem(icon: '🔌', title: 'Sleek connections'),
        ICUDailyRoundItem(icon: '🔍', title: 'Check for cuff leak'),
        ICUDailyRoundItem(
            icon: '😤', title: 'Suction mouth and nasal passages'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Breathing', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '💨', title: 'Pre-oxygenate'),
        ICUDailyRoundItem(icon: '🎚️', title: 'Confirm ventilator settings'),
        ICUDailyRoundItem(icon: '♨', title: 'Check capnography'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Circulation', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '💉️', title: 'Check adequate vascular access + secure'),
        ICUDailyRoundItem(icon: '✅', title: 'Confirm haemodynamically stable'),
        ICUDailyRoundItem(
            icon: '📉', title: 'Confirm plan if patient becomes unstable'),
        ICUDailyRoundItem(
            icon: '💊',
            title: 'Identify drug access point and metaraminol accessible'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Disability', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '😴', title: 'Sedated'),
        ICUDailyRoundItem(
            icon: '💬', title: 'Plan for further sedation discussed'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Equipment & Lines', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '🔐', title: 'Secure all tubes and lines'),
        ICUDailyRoundItem(
            icon: '✂️', title: 'Consider disconnecting unnecessary infusions'),
        ICUDailyRoundItem(
            icon: '🗑️', title: 'Remove unnecessary indwelling devices'),
        ICUDailyRoundItem(icon: '🔌', title: 'Consider disconnecting RRT'),
        ICUDailyRoundItem(icon: '🐽', title: 'NGT - aspirate and spigot'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Other', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '🔍',
            title: 'Assess for device potential for pressure injury'),
        ICUDailyRoundItem(
            icon: '🛏️', title: 'Apply padding to bony prominences'),
        ICUDailyRoundItem(icon: '👄', title: 'Mouth care'),
        ICUDailyRoundItem(icon: '💃', title: 'Dress anterior wounds'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Prepare', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '👸',
            title: 'Position team',
            subtitle: 'Team leader at head of bed'),
        ICUDailyRoundItem(
            icon: '📝',
            title: 'Brief team on steps',
            subtitle: 'Turning direction'),
        ICUDailyRoundItem(icon: '👇', title: 'Position ETT on opposite side'),
        ICUDailyRoundItem(
            icon: '🛌',
            title: 'Remove patient pillow and set air mattress to firm'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Horizontal Move', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👉', title: 'Move patient to edge of bed'),
        ICUDailyRoundItem(
            icon: '🏂',
            title: 'Tuck original sheet + new slide sheet under patient'),
        ICUDailyRoundItem(
            icon: '👈',
            title:
                'Tuck new sheet and slide sheet on side patient turning towards'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Side Lying Position', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: '🙋‍♀️', title: 'Tuck lower arm under buttock with palm up'),
        ICUDailyRoundItem(
            icon: '👉', title: 'Turn patient into lateral position'),
        ICUDailyRoundItem(
            icon: '🧶',
            title: 'Untangle lines and remove ECG leads to anterior thorax'),
        ICUDailyRoundItem(
            icon: '📍', title: 'Place ECG leads on posterior thorax'),
        ICUDailyRoundItem(icon: '🗑️', title: 'Remove old sheet'),
        ICUDailyRoundItem(
            icon: '🏂', title: 'Pull new sheet + slide sheet through'),
        ICUDailyRoundItem(
            icon: '👈',
            title: 'Slide patient to end of bed - away from ventilator'),
        ICUDailyRoundItem(
            icon: '🛏️',
            title: 'Fold pillows by 1/3 and place under chest and pelvis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Complete Prone', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: '👉', title: 'Turn patient onto stomach'),
        ICUDailyRoundItem(
            icon: '🏊',
            title: 'Pull pillows through position in swimmer position'),
        ICUDailyRoundItem(icon: '🦶', title: 'Place pillow under lower legs'),
      ])
    ])
  ]),
  ProneChecklist(heading: 'Post-Manoeuvre', sections: [
    ProneChecklistSection(title: 'Position', checklist: [
      ProneChecklistItem(
          title:
              'One arm above head, other by side. Shoulder in neutral position.'),
      ProneChecklistItem(title: 'Reposition patient in centre of bed'),
      ProneChecklistItem(
          title: 'Adjust position to ensure abdomen is hanging freely'),
      ProneChecklistItem(
          title:
              'Position head to reduce pressure on eyes and enable access to airway'),
      ProneChecklistItem(
          title: 'Readjust lines for comfort and NG on free drainage'),
    ]),
    ProneChecklistSection(title: 'Airway', checklist: [
      ProneChecklistItem(
          title: 'Check ETT lip level and ventilator circuit for kinks'),
      ProneChecklistItem(title: 'Suction if indicated'),
      ProneChecklistItem(title: 'Cuff pressure'),
    ]),
    ProneChecklistSection(title: 'Breathing', checklist: [
      ProneChecklistItem(title: 'Auscultate for bilateral breath sounds'),
      ProneChecklistItem(title: 'Respiratory parameters'),
      ProneChecklistItem(
          title: 'Check peak inspiratory pressures and minute ventilation'),
    ]),
    ProneChecklistSection(title: 'Circulation', checklist: [
      ProneChecklistItem(title: 'Check haemodynamics'),
      ProneChecklistItem(title: 'ABG - 30 minute post proning'),
    ]),
    ProneChecklistSection(title: 'Pressure Area Care', checklist: [
      ProneChecklistItem(
          title: 'Air mattress to usual setting - ensure functioning'),
      ProneChecklistItem(
          title:
              'Reposition head hourly - frequent eye toilets may be necessary'),
      ProneChecklistItem(title: 'Ensure tongue in mouth'),
      ProneChecklistItem(title: 'Document skin assessment'),
      ProneChecklistItem(title: 'Lateral tilt patient 2 hourly'),
    ])
  ])
];

const alsBlsGuide = [
  IntubationContent(
    'Principles',
    [
      IntubationSection(
        items: [
          IntubationItem('CPR is an Aerosol Generating Procedure (AGP)!',
              icon: '🌬'),
          IntubationItem('Your safety is a priority', icon: '☝️'),
          IntubationItem(
              'Do NOT enter the bed space until appropriate PPE applied',
              icon: '😷'),
          IntubationItem('Limit number of responders to essential staff only',
              icon: '👩‍⚕️'),
          IntubationItem('Minimise interruptions to compressions', icon: '🤫'),
          IntubationItem('Rhythm check at appropriate times', icon: '⏱'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'PPE', sections: [
    ICUDailyRoundStepSection(
      subsections: [
        ICUDailyRoundStepSubsection(
          heading: 'For COVID-19 proven, suspected or unknown patients',
          list: [
            ICUDailyRoundItem(title: 'Full PPE including N95 mask', icon: '☣️'),
          ],
        )
      ],
    ),
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'For non-COVID-19 patients',
          list: [
            ICUDailyRoundItem(
                title: 'Please use universal precautions', icon: '😷'),
          ],
          footer: 'Surgical mask, eye protection and gloves')
    ]),
    ICUDailyRoundStepSection(
      subsections: [
        ICUDailyRoundStepSubsection(
          heading: 'If you are unsure',
          list: [
            ICUDailyRoundItem(title: 'Full PPE', icon: '☣️'),
          ],
        )
      ],
    )
  ]),
  IntubationContent(
    'BLS',
    [
      IntubationSection(
        items: [
          IntubationItem('COMPRESSION ONLY CPR', icon: '👐'),
          IntubationItem('Do NOT use airway adjuncts or ventilate with BMV',
              icon: '☝️'),
          IntubationItem('Apply Hudson mask at 10L O₂.', icon: '🌬'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'ALS', sections: [
    ICUDailyRoundStepSection(
      subsections: [
        ICUDailyRoundStepSubsection(
          heading: 'Early Intubation',
          list: [
            ICUDailyRoundItem(
                title: 'The most experienced operator needs to be present',
                icon: '👩‍⚕️'),
            ICUDailyRoundItem(
                title: 'Use video laryngoscope',
                icon: '📺',
                subtitle:
                    '• McGrath on Code Blue response trolley\n• Intubating anaesthetist will attend where possible'),
            ICUDailyRoundItem(
                title:
                    'The viral filter MUST be placed on circuit closest to the airway device',
                icon: '🦠'),
            ICUDailyRoundItem(
                title:
                    'Follow the airway strategy as per Safe Airway Society/WH guidelines',
                icon: '🛩'),
            ICUDailyRoundItem(
                title: 'If BMV required: 2 handed vice-like grip', icon: '👐'),
          ],
        )
      ],
    ),
  ]),
];

const airwayAssessmentGuide = [
  IntubationContent(
    'Principles',
    [
      IntubationSection(
        items: [
          IntubationItem(
              'Incident of difficult airway INCREASED up to 10x in ICU',
              icon: '🚨'),
          IntubationItem(
              'Always take advantage of assessing before patient deteriorates',
              icon: '⏰'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Assessment', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'History', footer: '', list: [
        ICUDailyRoundItem(icon: '👀', title: 'Hx of difficult BMV/intubation?'),
        ICUDailyRoundItem(icon: '📜', title: 'PMH - ?RA/Reflux/OSA'),
        ICUDailyRoundItem(
            icon: '🤕', title: 'HPC - burns/Airway swelling/trauma?'),
      ]),
      ICUDailyRoundStepSubsection(heading: 'Examination', footer: '', list: [
        ICUDailyRoundItem(icon: '🦷', title: 'Teeth/Dentition?'),
        ICUDailyRoundItem(icon: '📜', title: 'Mouth opening?'),
        ICUDailyRoundItem(icon: '📏', title: 'Mallampati score?'),
        ICUDailyRoundItem(icon: '🔍', title: 'Thyromental distance'),
        ICUDailyRoundItem(icon: '🦒', title: 'Neck extension'),
        ICUDailyRoundItem(icon: '🤔', title: 'Receding chin?'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Predictors of difficulty:', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'Difficult BMV?', footer: '', list: [
        ICUDailyRoundItem(icon: '🤔', title: 'Previous difficult BMV'),
        ICUDailyRoundItem(icon: '🦷', title: 'Neck Irradiation'),
        ICUDailyRoundItem(icon: '📜', title: 'Obese'),
        ICUDailyRoundItem(icon: '📏', title: 'Age > 55'),
        ICUDailyRoundItem(icon: '🔍', title: 'Snorer/OSA'),
        ICUDailyRoundItem(icon: '🦒', title: 'Edentulous'),
        ICUDailyRoundItem(icon: '🤔', title: 'MP 3/4'),
        ICUDailyRoundItem(icon: '🤔', title: 'Male'),
      ]),
      ICUDailyRoundStepSubsection(heading: 'Difficult ETT?', footer: '', list: [
        ICUDailyRoundItem(icon: '🤔', title: 'Previous difficult intubation'),
        ICUDailyRoundItem(icon: '🦷', title: 'Mouth Opening < 3cm'),
        ICUDailyRoundItem(icon: '📜', title: 'Obese/Large breasts'),
        ICUDailyRoundItem(icon: '📏', title: 'Reduced neck extension'),
        ICUDailyRoundItem(icon: '🔍', title: 'Retrognathia'),
        ICUDailyRoundItem(icon: '🦒', title: 'Prominent incisors'),
        ICUDailyRoundItem(icon: '🤔', title: 'Large tongue'),
      ])
    ])
  ]),
];

const ventBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('SpO2: 92-96%\n COVID-19/COPD:88-92% ', icon: '🎯'),
          IntubationItem('PaO2> 55-60mmHg', icon: '🎯'),
          IntubationItem('PaCO2 35-45mmHg or pH > 7.2', icon: '🎯'),
          IntubationItem('Normal / stable work od breathing / RR', icon: '🎯️'),
          IntubationItem('I:E ratio 1:2', icon: '🎯'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'Default Ventilator settings',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Ventilator settings',
              footer: '',
              list: [
                ICUDailyRoundItem(icon: '👀', title: 'SIMV VC'),
                ICUDailyRoundItem(icon: '📍', title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • Secondary pathology\n • NM blockade\n • Diuresis\n • Recruitment manoeuvre\n • Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'CXR frequency - COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: '📍', title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: '📍', title: 'If significant clinical change'),
          ])
    ])
  ]),
];

const cvsBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('MAP > 65mmHg', icon: '🎯'),
          IntubationItem('HR < 130', icon: '🎯'),
          IntubationItem('Cap refill < 2', icon: '🎯'),
          IntubationItem('Cardiac index > 2.2', icon: '🎯'),
          IntubationItem(
              'Common ❤️ medications and doses:\n • Noradrenaline\n     • 0.5-100mcg/min\n • Amiodarone\n     • 15mg/kg/d',
              icon: '🤫'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(heading: 'Actions', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Basic vasopressor guidance',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: '👀',
                title: 'If MAP < 65 & adequately fluid resuscitated'),
            ICUDailyRoundItem(icon: '📍', title: 'Start noradrenaline'),
            ICUDailyRoundItem(icon: '🔍', title: 'Starting dose 5mcg/min'),
            ICUDailyRoundItem(icon: '🔒', title: 'Titrate to MAP'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If Haemodynamically unstable/ Norad > 20mcg/min',
          footer: 'Discuss with Intensivist',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Re-examine'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • ECG\n • Echocardiography\n • Troponin\n • Invasive cardiac monitoring'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: '', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If Haemodynamically unstable/ Norad > 30mcg/min',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '💬', title: 'Discuss with Intensivist'),
            ICUDailyRoundItem(
                icon: '⏰', title: 'Consider Hydrocortisone 50mg IV QID'),
            ICUDailyRoundItem(
                icon: '📍', title: 'Consider Argipressin 1-2 units/hr'),
            ICUDailyRoundItem(
                icon: '📍', title: 'Consider not giving fluid bolus'),
          ])
    ])
  ]),
];

const neuroBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('SpO2: 92-96% (COVID-19/COPD):88-92% ', icon: '🌬'),
          IntubationItem('PaO2> 55-60mmHg', icon: '☝️'),
          IntubationItem('PaCO2 35-45mmHg or pH > 7.2', icon: '😷'),
          IntubationItem('Normal / stable work od breathing / RR',
              icon: '👩‍⚕️'),
          IntubationItem('I:E ratio 1:2', icon: '🤫'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'Default Ventilator settings',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Ventilator settings',
              footer: '',
              list: [
                ICUDailyRoundItem(icon: '👀', title: 'SIMV VC'),
                ICUDailyRoundItem(icon: '📍', title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
                ICUDailyRoundItem(
                    icon: '🔒',
                    title: 'Are all connections secured with sleek?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • Secondary pathology\n • NM blockade\n • Diuresis\n • Recruitment manoeuvre\n • Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'CXR frequency - COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: '📍', title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: '📍', title: 'If significant clinical change'),
          ])
    ])
  ]),
];

const idBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('SpO2: 92-96% (COVID-19/COPD):88-92% ', icon: '🌬'),
          IntubationItem('PaO2> 55-60mmHg', icon: '☝️'),
          IntubationItem('PaCO2 35-45mmHg or pH > 7.2', icon: '😷'),
          IntubationItem('Normal / stable work od breathing / RR',
              icon: '👩‍⚕️'),
          IntubationItem('I:E ratio 1:2', icon: '🤫'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'Default Ventilator settings',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Ventilator settings',
              footer: '',
              list: [
                ICUDailyRoundItem(icon: '👀', title: 'SIMV VC'),
                ICUDailyRoundItem(icon: '📍', title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
                ICUDailyRoundItem(
                    icon: '🔒',
                    title: 'Are all connections secured with sleek?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • Secondary pathology\n • NM blockade\n • Diuresis\n • Recruitment manoeuvre\n • Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'CXR frequency - COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: '📍', title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: '📍', title: 'If significant clinical change'),
          ])
    ])
  ]),
];
const renalBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('SpO2: 92-96% (COVID-19/COPD):88-92% ', icon: '🌬'),
          IntubationItem('PaO2> 55-60mmHg', icon: '☝️'),
          IntubationItem('PaCO2 35-45mmHg or pH > 7.2', icon: '😷'),
          IntubationItem('Normal / stable work od breathing / RR',
              icon: '👩‍⚕️'),
          IntubationItem('I:E ratio 1:2', icon: '🤫'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'Default Ventilator settings',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Ventilator settings',
              footer: '',
              list: [
                ICUDailyRoundItem(icon: '👀', title: 'SIMV VC'),
                ICUDailyRoundItem(icon: '📍', title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
                ICUDailyRoundItem(
                    icon: '🔒',
                    title: 'Are all connections secured with sleek?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • Secondary pathology\n • NM blockade\n • Diuresis\n • Recruitment manoeuvre\n • Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'CXR frequency - COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: '📍', title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: '📍', title: 'If significant clinical change'),
          ])
    ])
  ]),
];

const gitBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem('SpO2: 92-96% (COVID-19/COPD):88-92% ', icon: '🌬'),
          IntubationItem('PaO2> 55-60mmHg', icon: '☝️'),
          IntubationItem('PaCO2 35-45mmHg or pH > 7.2', icon: '😷'),
          IntubationItem('Normal / stable work od breathing / RR',
              icon: '👩‍⚕️'),
          IntubationItem('I:E ratio 1:2', icon: '🤫'),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'Default Ventilator settings',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Ventilator settings',
              footer: '',
              list: [
                ICUDailyRoundItem(icon: '👀', title: 'SIMV VC'),
                ICUDailyRoundItem(icon: '📍', title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(icon: '🔍', title: 'Confirmed with CXR?'),
                ICUDailyRoundItem(
                    icon: '🔒',
                    title: 'Are all connections secured with sleek?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: '📍',
                title:
                    'Consider:\n • Secondary pathology\n • NM blockade\n • Diuresis\n • Recruitment manoeuvre\n • Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'CXR frequency - COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: '⏰', title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: '📍', title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: '📍', title: 'If significant clinical change'),
          ])
    ])
  ]),
];

// '💬' '😷' '❤️''✅' '👟'
// '⚖️'),'🔈''🌊' '🎚''👀' '😅'),'😬''🙃''🤔''🚨''👉''🛌''💧''👉')'💪''🙇‍♀️''•'
