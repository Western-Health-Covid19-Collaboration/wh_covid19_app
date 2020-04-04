// A list of two cards
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/IntubationChecklist.dart';
import 'models/PPEStepInfo.dart';
import 'models/intubation_guide.dart';
import 'routes.dart';
import 'strings.dart';
import 'style.dart';
import 'widget/reusable_card.dart';

// Staff Welfare card list composition
const List<ReusableCard> staffWelfare = [
  ReusableCard(
    title: Strings.ppeTitle,
    description: '3 guides',
    color: Colors.white,
    routeTo: Routes.ppe,
  ),
  ReusableCard(
    title: 'Your Welfare',
    description: 'Vital info & contacts',
    color: Colors.white,
    routeTo: Routes.staffWelfare,
  )
];

// Airway card list composition
const List<ReusableCard> airway = [
  ReusableCard(
    title: 'Intubation Guide',
    description: 'Step by step guide',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationGuidance,
  ),
  ReusableCard(
    title: 'Intubation Checklist',
    description: 'Checklist',
    color: AppColors.backgroundGreen,
    routeTo: Routes.intubationChecklist,
  ),
  ReusableCard(
    title: 'Extubation Guide',
    description: 'Step by step guide',
    color: AppColors.backgroundGreen,
    routeTo: Routes.extubation,
  )
];

// ICU card list composition
const List<ReusableCard> icu = [
  ReusableCard(
    title: 'Ventilation',
    description: 'Description',
    color: AppColors.backgroundBlue,
    routeTo: Routes.ventilation,
  ),
  ReusableCard(
    title: 'Daily Round',
    color: AppColors.backgroundBlue,
    routeTo: Routes.generalCare,
  ),
  ReusableCard(
    title: 'Tips for Cross-skilling',
    color: AppColors.backgroundBlue,
    routeTo: Routes.tipsJuniorStaff,
  ),
];

// Info card list composition
const List<ReusableCard> info = [
  ReusableCard(
    title: 'Numbers',
    description: 'Important contacts',
  ),
  ReusableCard(
    title: 'WH COVID19',
    description: 'Daily Bullettin',
  ),
  ReusableCard(
    title: 'Recommendations',
    description: 'Descriptions',
  ),
];

///Map of Route to ScreenData.
///For simple data screens that can be represented with eg a title
///and html text body in a card, there's no need to create separate
///*_view.dart files for each one. Instead, represent the screen as data
const Map<String, HtmlTextScreenData> routeToScreenData = {
  Routes.ventilationInitialActions: HtmlTextScreenData(
      'Suggested initial actions',
      'assets/text/icu_ventilation_initial_actions_content.html',
      AppColors.backgroundBlue),
  Routes.ventilationAdjuncts: HtmlTextScreenData(
      'Adjuncts',
      'assets/text/icu_ventilation_adjuncts_content.html',
      AppColors.backgroundBlue),
};

///Data for a screen that can be rendered with
///html_text_card_view_template.dart
class HtmlTextScreenData {
  final String title;
  final String htmlFile;
  final Color bgColor;
  const HtmlTextScreenData(this.title, this.htmlFile, this.bgColor);
  Future<String> readFile() async {
    return await rootBundle.loadString(htmlFile);
  }
}

// Contacts web url
const String whURL = 'http://wh.cyphix.net/';

// WH Novel Coronavirus information url
const String whCoronavirusInfoURL = 'https://coronavirus.wh.org.au/#';

// Disclaimer text
const String disclaimerBody = '''
This app is designed to be used by Anaesthetic and Critical Care doctors at Western Health who are caring for patients during the COVID-19 Pandemic. The guidelines, protocols and advice within this app are designed to educate staff and suggest recommended management of patients with COVID-19. The recommendations within this application do not indicate an exclusive course of action as the results must be contextualised to the patient at hand and variations may be appropriate.

The authors of this app have made efforts to ensure the information is up to date, but encourage users to confirm the indicated therapy with existing guidelines. The responsibility is on you, the treating physician, to ensure the correct therapy is being used.

The authors accept no responsibility for any information perceived as misleading or the success of any treatment regimen detailed in the guidelines.

The app is made available on the understanding that Western Health and its employees shall have no liability (including liability by reason of negligence) to the users for any loss, damage, cost or expense incurred or arising by reason of any person using or relying on the information and whether caused by reason of any error, negligent act, omission or misinterpretation in the app or otherwise.

The Western Health trademark and app cannot be copied, modified, reproduced, published, uploaded, distributed or posted without the prior written consent of Western Health.

You must agree to accept these terms and conditions before proceeding to use the app.
''';

const String ppeOffWarning = '''
Outside of PPE is contaminated!
If your hands get contaminated during PPE removal, immediately wash your hands or use an alcohol-based hand sanitizer.
''';

const List<PPEStepInfo> ppeOnSteps = [
  PPEStepInfo(
      image: 'assets/images/steps/on_hand_hygiene.png',
      text: 'Hand Hygiene',
      notes: ['Wash hands or use an alcohol-based hand sanitizer']),
  PPEStepInfo(image: 'assets/images/steps/on_gown.png', text: 'Gown', notes: [
    'Fully cover torso from neck to knees, arms to end of wrists, and wrap around the back.',
    'Fasten in back neck and waist'
  ]),
  PPEStepInfo(
      image: 'assets/images/steps/on_mask.png',
      text: 'Mask or Respirator',
      notes: [
        'Secure ties or elastic bands at middle of head and neck',
        'Fit flexible band to nose bridge',
        'Fit snug to face and below chin',
        'Fit-check respirator'
      ]),
  PPEStepInfo(
      image: 'assets/images/steps/on_goggles.png',
      text: 'Goggles or face shield',
      notes: ['Place over face and eyes', 'Adjust to fit']),
  PPEStepInfo(
      image: 'assets/images/steps/on_hand_hygiene.png',
      text: 'Hand Hygiene',
      notes: ['Wash hands or use an alcohol-based hand sanitizer']),
  PPEStepInfo(
      image: 'assets/images/steps/on_gloves.png',
      text: 'Gloves',
      notes: ['Extend to cover wrist of isolation gown'])
];

const PPEStepInfo handHygieneStep = PPEStepInfo(
    image: 'assets/images/steps/off_hand_hygiene.png',
    text: 'Hand Hygiene',
    notes: [
      'Wash hands or use an alcohol-based hand sanitizer immediately after removing PPE'
    ]);

const List<PPEStepInfo> ppeOffMethod1Steps = [
  PPEStepInfo(
      image: 'assets/images/steps/off_gloves.png',
      text: 'Gloves',
      notes: [
        'Using a gloved hand, grasp the palm area of the other gloved hand and peel off first glove',
        'Hold removed glove in gloved hand',
        'Slide fingers of ungloved hand under remaining glove at wrist and peel off second glove over first glove',
        'Discard gloves in a waste container'
      ]),
  handHygieneStep,
  PPEStepInfo(image: 'assets/images/steps/off_gown.png', text: 'Gown', notes: [
    "Unfasten gown ties, taking care that sleeves don't contact your body when reaching for ties",
    'Pull gown away from neck and shoulders, touching inside of gown only',
    'Turn gown inside out',
    'Fold or roll into a bundle and discard in a waste container'
  ]),
  handHygieneStep,
  PPEStepInfo(
      image: 'assets/images/steps/off_goggles.png',
      text: 'Goggles or Face Shield',
      notes: [
        'Remove goggles or faceshield from the back by lifting head band or ear pieces',
        'If the item is reusable, place in designated receptacle for reprocessing. Otherwise, discard in a waste container.'
      ]),
  handHygieneStep,
  PPEStepInfo(
      image: 'assets/images/steps/off_mask.png',
      text: 'Mask or Respirator',
      notes: [
        'Grasp bottom ties or elastics of the mask/respirator, then the ones at the top, and remove without touching the front',
        'Discard in a waste container'
      ]),
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
      ]),
  handHygieneStep,
  PPEStepInfo(
      image: 'assets/images/steps/off_goggles.png',
      text: 'Goggles or Face Shield',
      notes: [
        'Remove goggles or faceshield from the back by lifting head band or ear pieces',
        'If the item is reusable, place in designated receptacle for reprocessing. Otherwise, discard in a waste container.'
      ]),
  handHygieneStep,
  PPEStepInfo(
      image: 'assets/images/steps/off_mask.png',
      text: 'Mask or Respirator',
      notes: [
        'Grasp bottom ties or elastics of the mask/respirator, then the ones at the top, and remove without touching the front',
        'Discard in a waste container'
      ]),
  handHygieneStep,
];

const List<IntubationChecklist> intubationChecklist = [
  IntubationChecklist(title: 'Team', checklist: [
    IntubationChecklistItem(
      title: 'Anaesthesia contacted if difficulty anticipated',
    ),
    IntubationChecklistItem(title: 'Team Introduced:', notes: [
      'Airway Operator',
      'Airway Assistant',
      'Team Leader/Drugs',
      'In-room Runner: (optional)',
      'Door Runner',
      'Outside room Runner'
    ]),
    IntubationChecklistItem(
      title: 'Problems Anticipated?',
    ),
  ]),
  IntubationChecklist(title: 'Patient', checklist: [
    IntubationChecklistItem(
      title: 'ECG, BP, Sats',
    ),
    IntubationChecklistItem(
        title: 'Pre-oxygenation', notes: ['FIO2 100%', 'Sitting position 45°']),
    IntubationChecklistItem(
      title: 'IV access x 2', notes: ['1L fluid on pump set']
    ),
    IntubationChecklistItem(
        title: 'Haemodynamics optimised', notes: ['Fluid bolus', 'Pressor']),
  ]),
  IntubationChecklist(title: 'Drugs', checklist: [
    IntubationChecklistItem(title: 'RSI drugs drawn up, doses chosen'),
    IntubationChecklistItem(
        title: 'Rescue drugs', notes: ['Metaraminol', 'Sugammadex']),
    IntubationChecklistItem(title: 'Post intubation sedation plan'),
    IntubationChecklistItem(title: 'Drug C/I or allergies?'),
  ]),
  IntubationChecklist(title: 'Equipment', checklist: [
    IntubationChecklistItem(title: '2 Laryngoscopes (tested)'),
    IntubationChecklistItem(
      title: 'Tube chosen; cuff tested',
    ),
    IntubationChecklistItem(title: 'Bougie/stylet'),
    IntubationChecklistItem(title: '10ml syringe'),
    IntubationChecklistItem(title: 'Tube tie'),
    IntubationChecklistItem(title: 'Lubricant'),
    IntubationChecklistItem(title: 'Supraglottic airway sized to pt'),
    IntubationChecklistItem(title: 'Scalpel + bougie CICO kit'),
    IntubationChecklistItem(title: 'Airway trolley/bronchoscope outside room'),
    IntubationChecklistItem(title: 'ETCO2'),
    IntubationChecklistItem(title: 'Viral filter'),
  ]),
  IntubationChecklist(title: 'Final', checklist: [
    IntubationChecklistItem(title: 'Patient position optimal'),
    IntubationChecklistItem(
      title: 'Fluid runs easily',
    ),
    IntubationChecklistItem(title: 'Suction working'),
    IntubationChecklistItem(title: 'Facemask with viral filter connected'),
    IntubationChecklistItem(title: 'ECTO2 trace'),

    /// Note: \u{207B}\u{00B9} is unicode representation for ^-1
    IntubationChecklistItem(title: 'O2 running at 15L. min\u{207B}\u{00B9}'),
    IntubationChecklistItem(title: 'Oropharyngeal/nasal airways'),
    IntubationChecklistItem(title: 'Airway plans:', notes: [
      'Plan A: Videolaryngoscopy with bougie/stylet',
      'Plan B: Supraglottic airway',
      'Plan C: Vice grip, 2-person +/- Guedel/NPA',
      'Plan D: Scalpel/bougie/tube'
    ]),
  ]),
];
const List<IntubationContent> intubationGuide = [
  IntubationContent('Planning', [
    IntubationSection(items: [
      IntubationItem('Intervene Early'),
      IntubationItem('Negative pressure room', subtitle: 'If possible'),
      IntubationItem('Meticulous airway assessment'),
      IntubationItem('Discuss ventilation plan',
          subtitle: 'Protective lung ventilation', icon: '💬'),
    ])
  ]),
  IntubationContent('Prepare', [
    IntubationSection(items: [
      IntubationItem('Assemble airway team', subtitle: 'See checklist'),
      IntubationItem('Allocate roles & Share airway',
          subtitle: 'See checklist'),
      IntubationItem('Use COVID-19 Intubation tray', subtitle: 'See checklist'),
      IntubationItem('Ensure Viral filter and etCO2 in ventilation circuit'),
    ])
  ]),
  IntubationContent('PPE', [
    IntubationSection(items: [
      IntubationItem('As per WH guidelines',
          subtitle: 'See step-by-step guide'),
      // ignore: prefer_single_quotes
      IntubationItem("“Buddy system” - use a Spotter", icon: '😊'),
      IntubationItem('Airway operator, Assistant, Team Leader'),
      IntubationItem('Airway operator consider double gloves'),
    ])
  ]),
  IntubationContent('Pre-oxygenation', [
    IntubationSection(items: [
      IntubationItem('45-degree head-up position'),
      IntubationItem(
          'Stop high flow O2 via HFNP, NP, facemark or non-rebreather',
          icon: '❌'),
      IntubationItem('Use Best-fitting Face mask'),
      IntubationItem('2-handed vice grip'),
      IntubationItem('Ensure square etCO2 waveform'),
      IntubationItem('Avoid manual bagging unless rescue oxygenation',
          icon: '❌'),
    ])
  ]),
  IntubationContent('Perform', [
    IntubationSection(name: 'Induction', items: [
      IntubationItem('Modified RSI technique'),
      IntubationItem('Generous dosing of NMBA',
          subtitle:
              '• Rocuronium >1.5mg/kg IBW or\n• Suxamethonium 1.5mg/kg IBW'),
      IntubationItem('Minimise apnoea time while minimising risk of cough',
          icon: '⚖'),
      IntubationItem('Avoid ventilation unless rescue oxygenation', icon: '❌'),
    ]),
    IntubationSection(name: 'Intubation', items: [
      IntubationItem('Use Videolaryngoscope CMAC'),
      IntubationItem('Indirect view'),
      IntubationItem('Tube to correct depth 1st time',
          subtitle: 'Cuff manometry not required'),
      IntubationItem('Inflate cuff before ventilation', icon: '🛑'),
      IntubationItem('Generously inflate cuff'),
    ])
  ]),
  IntubationContent('Post-ETT', [
    IntubationSection(items: [
      IntubationItem('Consider placing NG tube'),
      IntubationItem(
          'Remove outer gloves, dispose of airway equipment in sealed bag',
          icon: '🛑'),
      IntubationItem('PPE removed as per WH guidelines', icon: '🛑'),
      IntubationItem('Debrief and share lessons', icon: '💬'),
    ])
  ])
];

// Feedback form
const String feedbackFormUrl = 'https://forms.gle/zQtfhvswrKmjJjNV7';
