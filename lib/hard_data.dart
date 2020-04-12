// A list of two cards
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/IntubationChecklist.dart';
import 'models/PPEStepInfo.dart';
import 'models/icu_daily_round_checklist.dart';
import 'models/icu_daily_round_steps.dart';
import 'models/intubation_guide.dart';
import 'models/ventilation_guide.dart';
import 'routes.dart';
import 'strings.dart';
import 'style.dart';
import 'widget/reusable_card.dart';

/// Web urls
const String whURL = 'http://wh.cyphix.net/';
const String whCoronavirusInfoURL = 'https://coronavirus.wh.org.au/';
const String whAnaestheticMicrositeURL =
    'https://whcovid19.wixsite.com/covid19';
const String whIcuMicrositeURL = 'https://whicu2020.wixsite.com/icuquickguide';
const String feedbackFormUrl = 'https://forms.gle/zQtfhvswrKmjJjNV7';

// Staff Welfare card list composition
const List<ReusableCard> staffWelfare = [
  ReusableCard(
    title: Strings.ppeTitle,
    description: '3 guides',
    color: Colors.white,
    routeTo: Routes.ppe,
    margin: EdgeInsets.all(0.0),
  ),
  ReusableCard(
    title: Strings.yourWelfareTitle,
    description: 'Vital info & contacts',
    color: Colors.white,
    routeTo: Routes.staffWelfare,
    margin: EdgeInsets.all(0.0),
  )
];

// Airway card list composition
const List<ReusableCard> airway = [
  ReusableCard(
    title: Strings.intubationGuideTitle,
    description: 'Step by step guide',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationGuidance,
    height: 70,
    margin: EdgeInsets.all(0.0),
  ),
  ReusableCard(
    title: Strings.intubationChecklistTitle,
    description: 'Checklist',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationChecklist,
    height: 70,
    margin: EdgeInsets.all(0.0),
  ),
  ReusableCard(
    title: Strings.extubationGuideTitle,
    description: 'Step by step guide',
    color: AppColors.backgroundGreen,
    routeTo: Routes.extubationGuidance,
    height: 70,
    margin: EdgeInsets.all(0.0),
  )
];

// ICU card list composition
const List<ReusableCard> icu = [
  ReusableCard(
    title: Strings.ventilationTitle,
    description: 'Description',
    color: AppColors.backgroundBlue,
    routeTo: Routes.ventilation,
    margin: EdgeInsets.all(0.0),
  ),
  ReusableCard(
    title: Strings.dailyRoundTitle,
    color: AppColors.backgroundBlue,
    routeTo: Routes.generalCare,
    margin: EdgeInsets.all(0.0),
  ),
  ReusableCard(
    title: Strings.tipsForCrossSkillingTitle,
    color: AppColors.backgroundBlue,
    routeTo: Routes.tipsJuniorStaff,
    margin: EdgeInsets.all(0.0),
  ),
];

/// Map of Route to ScreenData.
/// For simple data screens that can be represented with eg a title
/// and html text body in a card, there's no need to create separate
/// *_view.dart files for each one. Instead, represent the screen as data
const Map<String, HtmlTextScreenData> routeToScreenData = {
  Routes.ventilationInitialActions: HtmlTextScreenData(
    'Suggested initial actions',
    'assets/text/icu_ventilation_initial_actions_content.html',
    AppColors.backgroundBlue,
  ),
  Routes.ventilationAdjuncts: HtmlTextScreenData(
    'Adjuncts',
    'assets/text/icu_ventilation_adjuncts_content.html',
    AppColors.backgroundBlue,
  ),
};

/// Data for a screen that can be rendered with
/// html_text_card_view_template.dart
class HtmlTextScreenData {
  final String title;
  final String htmlFile;
  final Color bgColor;

  const HtmlTextScreenData(this.title, this.htmlFile, this.bgColor);

  Future<String> readFile() async {
    return await rootBundle.loadString(htmlFile);
  }
}

/// PPE - all the PPE content
const String ppeOffWarning = '''
Outside of PPE is contaminated!
If your hands get contaminated during PPE removal, immediately wash your hands or use an alcohol-based hand sanitizer.
''';

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
        title: 'Team Introduced:',
        notes: [
          'Airway Operator',
          'Airway Assistant',
          'Team Leader/Drugs',
          'In-room Runner: (optional)',
          'Door Runner',
          'Outside room Runner'
        ],
      ),
      IntubationChecklistItem(title: 'Communication device checked'),
      IntubationChecklistItem(
        title: 'Problems anticipated?',
      ),
    ],
  ),
  IntubationChecklist(
    title: 'Patient',
    checklist: [
      IntubationChecklistItem(
        title: 'ECG, BP, Sats',
      ),
      IntubationChecklistItem(
        title: 'Pre-oxygenation',
        notes: [
          'FiO2 100%',
          'Sitting position '
              '45°'
        ],
      ),
      IntubationChecklistItem(
        title: 'IV access working',
        notes: ['Fluid running'],
      ),
      IntubationChecklistItem(
        title: 'Haemodynamics optimised',
        notes: ['Fluid bolus?', 'Pressor infusion?'],
      ),
    ],
  ),
  IntubationChecklist(
    title: 'Drugs',
    checklist: [
      IntubationChecklistItem(title: 'RSI drugs prepared & doses chosen'),
      IntubationChecklistItem(
        title: 'Rescue drugs',
        notes: ['Metaraminol', 'Adrenaline'],
      ),
      IntubationChecklistItem(title: 'Post intubation sedation plan'),
      IntubationChecklistItem(title: 'Drug C/I or allergies?'),
    ],
  ),
  IntubationChecklist(
    title: 'Equipment',
    checklist: [
      IntubationChecklistItem(
        title: '2 Laryngoscopes (1 VL, 1 Mac)',
        notes: ['Blade available', 'Back-up laryngoscope available'],
      ),
      IntubationChecklistItem(
        title: 'Tube chosen; cuff tested',
      ),
      IntubationChecklistItem(title: 'Bougie/stylet'),
      IntubationChecklistItem(title: '10ml syringe'),
      IntubationChecklistItem(title: 'Tube tie'),
      IntubationChecklistItem(title: 'Supraglottic airway sized to pt'),
      IntubationChecklistItem(title: 'Scalpel + bougie CICO kit'),
      IntubationChecklistItem(
          title: 'Airway trolley with 3 backup boxes (LMA, Facemask, CICO)'),
      IntubationChecklistItem(title: 'etCO2'),
      IntubationChecklistItem(title: 'Viral filter'),
    ],
  ),
  IntubationChecklist(
    title: 'Final',
    checklist: [
      IntubationChecklistItem(title: 'Patient position optimal'),
      IntubationChecklistItem(
        title: 'Fluid runs easily',
      ),
      IntubationChecklistItem(title: 'Suction working'),
      IntubationChecklistItem(title: 'Tube tie under neck'),
      IntubationChecklistItem(title: 'Ventilator +/- BVM functional'),
      IntubationChecklistItem(title: 'Facemask with viral filter connected'),
      IntubationChecklistItem(title: 'etCO2 trace'),
      IntubationChecklistItem(title: 'O2 at 6l/min'),
      IntubationChecklistItem(
          title: 'Clinical waste bin & Mayo table/dirty tray'),
      IntubationChecklistItem(
        title: 'Airway plans:',
        notes: [
          'Plan A: Videolaryngoscopy with bougie/stylet',
          'Plan B: Supraglottic airway',
          'Plan C: Vice grip, 2-person +/- Guedel/NPA',
          'Plan D: Scalpel/bougie/tube'
        ],
      ),
    ],
  ),
];
const List<IntubationContent> intubationGuide = [
  IntubationContent(
    'Planning',
    [
      IntubationSection(
        items: [
          IntubationItem('Intervene early'),
          IntubationItem('Negative pressure room', subtitle: 'If possible'),
          IntubationItem('Meticulous airway assessment'),
          IntubationItem('Discuss ventilation plan',
              subtitle: 'Protective lung ventilation', icon: '💬'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Prepare',
    [
      IntubationSection(
        items: [
          IntubationItem('Assemble airway team', subtitle: 'See checklist'),
          IntubationItem('Allocate roles and share airway plan',
              subtitle: 'See checklist'),
          IntubationItem('Use COVID-19 Intubation tray',
              subtitle: 'See checklist'),
          IntubationItem(
              'Ensure viral filter and etCO2 in ventilation circuit'),
        ],
      )
    ],
  ),
  IntubationContent(
    'PPE',
    [
      IntubationSection(
        items: [
          IntubationItem('As per WH guidelines',
              subtitle: 'See step-by-step guide'),
          // ignore: prefer_single_quotes
          IntubationItem("“Buddy system” - use a Spotter", icon: '😊'),
          IntubationItem('Airway operator, Assistant, Team Leader'),
          IntubationItem('Airway operator consider double gloves'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Pre-oxygenation',
    [
      IntubationSection(
        items: [
          IntubationItem('45-degree head-up position'),
          IntubationItem(
              'Stop high flow O2 via HFNP, NP, face mask or non-rebreather',
              icon: '❌'),
          IntubationItem('Use best-fitting face mask'),
          IntubationItem('2-handed vice grip'),
          IntubationItem('Ensure square etCO2 waveform'),
          IntubationItem('Avoid manual bagging unless rescue oxygenation',
              icon: '❌'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Perform',
    [
      IntubationSection(
        name: 'Induction',
        items: [
          IntubationItem('Modified RSI technique'),
          IntubationItem('Generous dosing of NMBA',
              subtitle:
                  '• Rocuronium >1.5mg/kg IBW or\n• Suxamethonium 1.5mg/kg IBW'),
          IntubationItem('Minimise apnoea time while minimising risk of cough',
              icon: '⚖'),
          IntubationItem('Avoid ventilation unless rescue oxygenation',
              icon: '❌'),
        ],
      ),
      IntubationSection(
        name: 'Intubation',
        items: [
          IntubationItem('Use Videolaryngoscope CMAC'),
          IntubationItem('Indirect view'),
          IntubationItem('Tube to correct depth 1st time',
              subtitle: 'Cuff manometry not required'),
          IntubationItem('Inflate cuff generously before ventilation',
              subtitle: '10mls of air', icon: '🛑'),
        ],
      )
    ],
  ),
  IntubationContent(
    'Post-ETT',
    [
      IntubationSection(
        items: [
          IntubationItem('Consider NG tube and in-line suction'),
          IntubationItem(
              'Remove outer gloves, dispose of airway equipment in sealed bag',
              icon: '🛑'),
          IntubationItem('PPE removed as per WH guidelines', icon: '🛑'),
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
              'Switch to surgical mask with hudson or nasal prongs over the top'),
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

const List<VentilationGuideItem> ventilationGuide = [
  VentilationGuideItem(
    'Principles',
    guideList: [
      VentiliationGuideSection(
        list: [
          VentilationGuideItemListItem(
              title: 'Do the simple things well!', icon: '✅'),
          VentilationGuideItemListItem(
              title: 'Follow a stepwise approach!', icon: '👟'),
          VentilationGuideItemListItem(
              title: 'Balance the risks of organ support', icon: '⚖️'),
          VentilationGuideItemListItem(
              title: 'Minimise the risks of �cross-infection (see PPE)',
              icon: '😷'),
        ],
      )
    ],
  ),
  VentilationGuideItem(
    'Initial Steps',
    guideList: [
      VentiliationGuideSection(
        heading: 'Lung Protection',
        list: [
          VentilationGuideItemListItem(
              title: 'Ventilator setting: SIMV/VC', icon: '🔈'),
          VentilationGuideItemListItem(
              title: 'Low tidal Volume commence with 6ml/kg body weight',
              icon: '🌊'),
          VentilationGuideItemListItem(title: 'RR 20', icon: '🎚'),
          VentilationGuideItemListItem(
              title: 'PEEP: aim high, start 10cmH20, see table!', icon: '👀'),
        ],
      ),
      VentiliationGuideSection(
        heading: 'Aims',
        list: [
          VentilationGuideItemListItem(title: 'SpO2 88-92%', icon: '😅'),
          VentilationGuideItemListItem(title: 'PaO2 55-70mmHg', icon: '😬'),
          VentilationGuideItemListItem(title: 'Pplat <30', icon: '🙃'),
          VentilationGuideItemListItem(
              title: 'Ph>7.2 (Permissive hypercapnia is ok)', icon: '🤔'),
        ],
      ),
      VentiliationGuideSection(
        heading: 'If deteriorating ',
        list: [
          VentilationGuideItemListItem(
              title: 'ICU consultant review!', icon: '🚨'),
          VentilationGuideItemListItem(
              title: 'Proceed to Adjuncts page', icon: '👉'),
        ],
      )
    ],
  ),
  VentilationGuideItem(
    'Adjuncts',
    guideList: [
      VentiliationGuideSection(
        heading: 'If initial stepwise approach fails try',
        list: [
          VentilationGuideItemListItem(title: 'Deep sedation', icon: '🛌'),
          VentilationGuideItemListItem(
              title: 'Restrictive fluid regime',
              icon: '💧',
              notes: ['Aim for Negative fluid balance']),
          VentilationGuideItemListItem(
              title: 'Ensure senior ICU review', icon: '👉'),
          VentilationGuideItemListItem(
            title: 'Neuromuscular blockade',
            icon: '💪',
            notes: [
              'NOT first-line management',
              'Consider infusion of cisatracurium in a patient with refractory hypoxia'
            ],
          ),
          VentilationGuideItemListItem(title: 'Try prone position', icon: '↪️'),
        ],
      ),
    ],
  ),
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
        ICUDailyRoundItem(icon: '🩸', title: 'PAO₂?'),
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
            ICUDailyRoundItem(icon: '🎯', title: 'PAO₂ > 55-60\nSaO₂ > 88-92'),
            ICUDailyRoundItem(
                icon: '🎯', title: 'pH > 7.20\nif pH normal, CO₂ 35-45'),
            ICUDailyRoundItem(
                icon: '🎯', title: 'VTe 4-8 ml/kg\nwith PPlat < 30'),
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
            icon: '🩸',
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
  ICUDailyRoundSteps(heading: 'G - Git', sections: [
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
      subHeading: "It's okay to not be okay.\nPlease look after yourself.",
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
            heading: 'Number of case: Full scale - Multiple',
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
            heading: 'Number of case: 0 (or very low)',
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
