// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/IntubationChecklist.dart';
import 'models/PPEStepInfo.dart';
import 'models/home_card.dart';
import 'models/icu_daily_round_checklist.dart';
import 'models/icu_daily_round_steps.dart';
import 'models/intubation_guide.dart';
import 'models/onboardingPage_model.dart';
import 'models/prone_checklist.dart';
import 'routes.dart';
import 'strings.dart';
import 'style.dart';

/// Web urls
const String whURL = 'http://wh.cyphix.net/';
const String whCoronavirusInfoURL = 'https://coronavirus.wh.org.au/';
const String whAnaestheticMicrositeURL =
    'https://whcovid19.wixsite.com/covid19';
const String whIcuMicrositeURL = 'https://whicu2020.wixsite.com/icuquickguide';
const String feedbackFormUrl = 'https://forms.gle/zQtfhvswrKmjJjNV7';
const String proningTechniqueUrl =
    'https://www.youtube.com/watch?v=YFrA1cCuDnY&feature=youtu.be';
const String googleAnalyticsURL = 'https://analytics.google.com/';
const String sentryURL = 'https://sentry.io/welcome/';

// Onboarding screens composition
const List<OnboardingSinglePage> onboardingPages = [
  OnboardingSinglePage(
    graphicAssetPath: 'assets/images/onboarding/staff-use.svg',
    color: AppColors.backgroundBlue,
    title: Strings.onboarding1Title,
    subTitle:
        'This app is for Western Health clinicians and hospital staff use ONLY !',
  ),
  OnboardingSinglePage(
    graphicAssetPath: 'assets/images/onboarding/educational.svg',
    color: AppColors.purple50,
    title: Strings.onboarding2Title,
    subTitle:
        'Western Health Anaesthesia COVID-19 (WHAC19) is an educational tool and interactive cognitive aid for Western Health '
        'anaesthetists and ICU doctors who are managing patients with COVID-19.'
        '\n\nWe want to protect our staff from infection risk and ensure excellent patient '
        'care. WHAC19 aims to provide a really quick, usable means to '
        'access the core information.️',
  ),
  OnboardingSinglePage(
    graphicAssetPath: 'assets/images/onboarding/reference.svg',
    color: AppColors.backgroundGreen,
    title: Strings.onboarding3Title,
    subTitle:
        'The app uses guidelines, protocols and advice from the Western Health COVID-19 Guidelines Working Group.'
        'To ensure you have the latest up-to-date information on Western '
        'Health’s Coronavirus guidelines visit coronavirus.wh.org.au',
  ),
];

// Staff Welfare card list composition
const List<HomeCard> staffWelfare = [
  HomeCard(
    title: Strings.ppeTitle,
    description: 'WH Videos and Step by Step Guide',
    route: Routes.ppe,
  ),
];

// Airway car list composition
const List<HomeCard> airway = [
  HomeCard(
    title: Strings.intubationGuideTitle,
    description: 'WH Intubation Team Guidelines v9',
    route: Routes.intubationGuidance,
  ),
  HomeCard(
    title: Strings.intubationChecklistTitle,
    description: 'WH COVID-19 Intubation Checklist v9',
    route: Routes.intubationChecklist,
  ),
  HomeCard(
    title: Strings.extubationGuideTitle,
    description: 'WH Theatre Extubation Guideline v1.1',
    route: Routes.extubationGuidance,
  )
];

// ICU card list composition
const List<HomeCard> icu = [
  HomeCard(
    title: Strings.ventilationTitle,
    description: 'Basic ARDS Strategy',
    route: Routes.ventilation,
  ),
  HomeCard(
    title: Strings.dailyRoundTitle,
    description: 'Basic A-G Template',
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
  HomeCard(
    title: Strings.yourWelfareTitle,
    description: 'ASA advice on wellbeing throughout the pandemic',
    route: Routes.staffWelfare,
  )
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
          IntubationItem(
            'Prior to activating Intubation team',
            subtitle:
                '• Clearly documented goals of care \n• Acute Resuscitation Plan (ARP)\n• Appropriate for intubation?',
            icon: FontAwesomeIcons.userFriends,
          ),
          IntubationItem('Call EARLY for deteriorating patient review',
              icon: FontAwesomeIcons.phone,
              subtitle:
                  'Clinical concern:\n • SaO2 <92% on 6l/M\n • Resp. distress or RR >24'),
          IntubationItem('MET and code blue calls as per WH guidelines',
              icon: FontAwesomeIcons.hospitalUser,
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
              'Intubating team to decide if patient is stable enough for transfer',
              icon: FontAwesomeIcons.users),
          IntubationItem(
            'Preference of Intubation location',
            icon: FontAwesomeIcons.locationArrow,
            subtitle:
                '1. ICU NPR\n2. NPR in ED or other sites\n3. Designated COVID19 theatre\n4. ED rooms, ward rooms',
          ),
        ],
      ),
      IntubationSection(
        name: 'PPE',
        items: [
          IntubationItem('Don AGE PPE prior to entering Intubation room',
              icon: FontAwesomeIcons.handsWash,
              subtitle: 'Follow step-by-step guide'),
          // ignore: prefer_single_quotes
          IntubationItem("“Buddy system” - use a Spotter",
              icon: FontAwesomeIcons.peopleArrows),
        ],
      ),
      IntubationSection(
        name: 'Staff Positioning',
        items: [
          IntubationItem('Refer to SAS Infographic',
              icon: FontAwesomeIcons.solidFilePdf,
              subtitle: ' available through PDF icon ↗️'),
        ],
      ),
      IntubationSection(
        name: 'Communication',
        items: [
          IntubationItem(
            'Support team will stand outside the anteroom',
            icon: FontAwesomeIcons.signOutAlt,
          ),
          IntubationItem(
            'Place any clean equipment required on "exchange trolley" inside the anteroom',
            icon: FontAwesomeIcons.dollyFlatbed,
          ),
          IntubationItem(
            'Use Walkie talkie or other means for communication',
            icon: FontAwesomeIcons.phoneVolume,
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
          IntubationItem('Circuit order of Placement:',
              icon: FontAwesomeIcons.listOl,
              subtitle:
                  ' • Mask\n • Filter\n • ETCO2\n • PEEP\n • Laerdal bag'),
          IntubationItem(
            'Tight fitting mask, with two-hand grip',
            icon: FontAwesomeIcons.hands,
          ),
          IntubationItem(
            '45° head up',
            icon: FontAwesomeIcons.bed,
          ),
        ],
      ),
      IntubationSection(
        name: 'Rapid sequence induction',
        items: [
          IntubationItem('Modified RSI technique',
              icon: FontAwesomeIcons.syringe,
              subtitle:
                  '• Rocuronium >1.5mg/kg IBW or\n• Suxamethonium 1.5mg/kg IBW\n• Wait 60s for paralysis'),
          IntubationItem('Avoid routine cricoid pressure',
              icon: FontAwesomeIcons.ban),
          IntubationItem(
            'Avoid BMV during apnoea unless life threatening hypoxia',
            icon: FontAwesomeIcons.balanceScale,
          ),
        ],
      ),
      IntubationSection(
        name: 'Intubation',
        items: [
          IntubationItem('Use Videolaryngoscopy for 1st attempt',
              icon: FontAwesomeIcons.video, subtitle: '• Indirect view'),
          IntubationItem(' Size 8.0 ETT if available',
              icon: FontAwesomeIcons.ruler),
          IntubationItem('Cuff up with 10ml air prior to ventilating',
              icon: FontAwesomeIcons.pumpMedical),
          IntubationItem(
            'Confirm ventilation',
            icon: FontAwesomeIcons.stethoscope,
            subtitle:
                '• Capnography waveform\n• Chest movement\n• Auscultation',
          ),
          IntubationItem(
            'If Plan A - Intubation fails',
            icon: FontAwesomeIcons.listUl,
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
          IntubationItem('Ventilator preferences',
              icon: FontAwesomeIcons.listOl,
              subtitle:
                  ' 1. ICU Maquet\n 2. ED Hamilton\n 3. ICU/Other Oxylog/Hamilton'),
          IntubationItem(
            'Circuit of Maquet to be prepared by ICU nurse',
            icon: FontAwesomeIcons.userNurse,
            subtitle:
                '• SIMV + PS, volume control\n• Vt 6-8ml/kg IBW (often 400-500ml)\n• RR 12',
          ),
          IntubationItem('Airway doctor',
              icon: FontAwesomeIcons.userMd,
              subtitle:
                  ' • Turn off O2 flow to self-inflating bag\n • Clamp the ETT with a chest drain clamp\n • Disconnect ETT from HME\n • Connect prepared circuit to ETT\n • Unclamp ETT\n •Turn ventilator on\n • Commence ventilation\n • Sleek ETT connections '),
          IntubationItem('ETCO2',
              icon: FontAwesomeIcons.waveSquare,
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
              'Insert NG tube immediately post-intubation in the NPR',
              icon: FontAwesomeIcons.clock),
          IntubationItem(
            'PPE removed as per WH guidelines',
            icon: FontAwesomeIcons.headSideMask,
          ),
          IntubationItem(
            'Before moving patient to a COVID cubicle, wait at least 30min (but ideally 60 min) post-procedure',
            icon: FontAwesomeIcons.userClock,
          ),
          IntubationItem('Lines and CXR outside NPR',
              icon: FontAwesomeIcons.xRay),
          IntubationItem('Debrief and share lessons',
              icon: FontAwesomeIcons.comment),
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
          IntubationItem(
            'Extubation is an AGP',
            icon: FontAwesomeIcons.headSideCough,
          ),
          IntubationItem('Is patient clinically stable to extubate now?',
              icon: FontAwesomeIcons.questionCircle),
          IntubationItem('Assemble team',
              icon: FontAwesomeIcons.peopleArrows,
              subtitle: 'Anaesthetists and anaesthetic nurse ONLY'),
          IntubationItem('Discuss extubation plan',
              icon: FontAwesomeIcons.comment),
          IntubationItem(
              'Consider strategies to reduce coughing if you are familiar with them',
              subtitle: '• TIVA\n'
                  '• Remifentanil\n'
                  '• Topical/IV Lignocaine\n'
                  '• Dexmedetomidine\n'
                  '• Spont breathing deep extubation\n'
                  '• LMA exchange',
              icon: FontAwesomeIcons.headSideCoughSlash),
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
              icon: FontAwesomeIcons.briefcaseMedical),
          IntubationItem('Have a runner in the anaesthetic bay',
              icon: FontAwesomeIcons.running),
          IntubationItem(
              'Ensure viral filter and etCO2 ready to be connected to disposable mask following extubation',
              icon: FontAwesomeIcons.viruses),
          IntubationItem('Extubation should occur on the patient\'s bed',
              icon: FontAwesomeIcons.bed),
          IntubationItem(
              'Optimise airway and oxygenation through positioning and recruitment manoevre',
              icon: FontAwesomeIcons.chartLine),
          IntubationItem('Consider extubating under plastic drape',
              icon: FontAwesomeIcons.questionCircle),
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
              icon: FontAwesomeIcons.headSideMask,
              subtitle: 'Non-essential staff out of room'),
          IntubationItem(
              'Buddy check each other PPE prior to performing extubation',
              icon: FontAwesomeIcons.peopleArrows),
        ],
      )
    ],
  ),
  IntubationContent(
    'Perform',
    [
      IntubationSection(
        items: [
          IntubationItem(
              'Patient should ideally be ready for extubation onto facemask',
              icon: FontAwesomeIcons.procedures),
          IntubationItem(
              'Have patient sitting up with no theatre staff in front of them',
              icon: FontAwesomeIcons.ruler),
          IntubationItem('Extubate patient with cuff down and APL fully open',
              icon: FontAwesomeIcons.cog, subtitle: 'NO positive pressure'),
          IntubationItem('Carefully discard ETT into clinical waste bin',
              icon: FontAwesomeIcons.biohazard),
          IntubationItem(
            'Immediately apply face mask to patient with 2 hand grip',
            icon: FontAwesomeIcons.hands,
          ),
          IntubationItem(
              'Continue to apply face mask until able to protect their own airway',
              icon: FontAwesomeIcons.userClock),
          IntubationItem(
              'Switch to Hudson or nasal prongs O2 with a surgical mask over the top',
              icon: FontAwesomeIcons.headSideMask),
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
              icon: FontAwesomeIcons.biohazard),
          IntubationItem('Patient should be encouraged not to cough',
              icon: FontAwesomeIcons.headSideCoughSlash),
          IntubationItem('Oral suctioning may be performed',
              subtitle:
                  '• Care to avoid coughing\n• Ensure no contamination of self\n   or others',
              icon: FontAwesomeIcons.teethOpen),
          IntubationItem(
              'Patient must wear surgical mask on transfer back to ward',
              icon: FontAwesomeIcons.headSideMask),
          IntubationItem('Doff PPE with buddy check',
              icon: FontAwesomeIcons.peopleArrows),
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
          IntubationItem('Do the simple things well!',
              icon: FontAwesomeIcons.clipboardCheck),
          IntubationItem('Follow a stepwise approach!',
              icon: FontAwesomeIcons.stepForward),
          IntubationItem('Balance the risks of organ support',
              icon: FontAwesomeIcons.balanceScale),
          IntubationItem('Minimise the risks of cross-infection (see PPE)',
              icon: FontAwesomeIcons.handsWash),
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
            ICUDailyRoundItem(
                title: 'Ventilator setting: SIMV/VC',
                icon: FontAwesomeIcons.slidersH),
            ICUDailyRoundItem(
                title: 'Low tidal volume commence with 6ml/kg body weight',
                icon: null),
            ICUDailyRoundItem(title: 'RR 20'),
            ICUDailyRoundItem(
                title: 'PEEP: aim high, start 10cmH20, see table!'),
          ],
        )
      ],
    ),
    ICUDailyRoundStepSection(heading: 'Aims', subsections: [
      ICUDailyRoundStepSubsection(
        list: [
          ICUDailyRoundItem(
              title: 'SaO₂ 88-92%', icon: FontAwesomeIcons.crosshairs),
          ICUDailyRoundItem(
              title: 'PaO₂ 55-70mmHg', icon: FontAwesomeIcons.crosshairs),
          ICUDailyRoundItem(
              title: 'Pplat < 30', icon: FontAwesomeIcons.crosshairs),
          ICUDailyRoundItem(
            title: 'pH > 7.20',
            icon: FontAwesomeIcons.crosshairs,
            subtitle: '(Permissive hypercapnia is ok)',
          ),
        ],
      )
    ]),
    ICUDailyRoundStepSection(
      heading: 'If Deteriorating',
      subsections: [
        ICUDailyRoundStepSubsection(
          list: [
            ICUDailyRoundItem(
                title: 'ICU consultant review!',
                icon: FontAwesomeIcons.procedures),
            ICUDailyRoundItem(
                title: 'Proceed to Adjuncts page',
                icon: FontAwesomeIcons.arrowRight),
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
            ICUDailyRoundItem(
                title: 'Deep sedation', icon: FontAwesomeIcons.bed),
            ICUDailyRoundItem(
                title: 'Restrictive fluid regime',
                icon: FontAwesomeIcons.tintSlash,
                subtitle: 'Aim for Negative fluid balance'),
            ICUDailyRoundItem(
                title: 'Ensure senior ICU review',
                icon: FontAwesomeIcons.userMd),
            ICUDailyRoundItem(
              title: 'Neuromuscular blockade',
              icon: FontAwesomeIcons.comment,
              subtitle:
                  'NOT first-line management - discuss with ICU consultant',
            ),
            ICUDailyRoundItem(
                title: 'Try prone position',
                icon: FontAwesomeIcons.solidArrowAltCircleDown),
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
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.rulerVertical, title: 'Size?'),
            ICUDailyRoundItem(icon: FontAwesomeIcons.lungs, title: 'Position?'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.xRay, title: 'Confirmed with CXR?'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.lock,
                title: 'Are all connections secured with sleek?'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If planned for extubation:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: FontAwesomeIcons.userClock, title: 'When?'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.searchLocation, title: 'Where?'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.procedures,
                title: 'How? (see airway resources)'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'B - Breathing', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: FontAwesomeIcons.waveSquare, title: 'SpO₂?'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.vial, title: 'PaO₂?'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.xRay, title: 'CXR reviewed?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.fileSignature, title: 'ABG reviewed?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.slidersH,
            title: 'Current ventilator settings reviewed?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Standard Targets',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.crosshairs,
                title: 'PaO₂ > 55-60mmHg\nSaO₂ > 88-92%'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.crosshairs,
                title: 'pH > 7.20\nif pH normal, CO₂ 35-45'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.crosshairs,
                title: 'VTe 4-8 ml/kg\nwith Pplat < 30'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.crosshairs,
                title:
                    'PEEP: According to PEEP Table\nAlso check ETT lines NG ICC'),
          ]),
      ICUDailyRoundStepSubsection(
          heading: 'If FiO₂ > 0.6 and PEEP > 15',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.userMd,
                title: 'Specialist review and see resources'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'C - Circulation', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.heartbeat, title: 'HR / rhythm / MAP?'),
        ICUDailyRoundItem(title: 'ECG / Echocardigram?'),
        ICUDailyRoundItem(
            title:
                'Lactate? (Signs of end organ perfusion: mottled / cool peripheries / cap refill time?)'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: 'Aims', footer: '', list: [
        ICUDailyRoundItem(icon: FontAwesomeIcons.crosshairs, title: 'MAP > 65'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.crosshairs, title: '[Hb] > 70'),
      ]),
      ICUDailyRoundStepSubsection(
          heading: 'If haemodyamically unstable / MAP < 65',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.prescription,
                title:
                    'Commence noradrenaline, see resources / echocardiogram'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'D - Neurological', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.brain,
            title: 'Riker score & pain assessment?'),
        ICUDailyRoundItem(title: 'Current sedation / analgesic infusions?'),
        ICUDailyRoundItem(title: 'Neuromuscular blockers?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'Analgesia / sedation plan and target (see resources)'),
        ICUDailyRoundItem(
            title:
                'Consider sedation break (see resources) / cessation of neuromuscular blocker'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'E - Infection/Exposure', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.thermometerThreeQuarters,
            title: 'Temperature?'),
        ICUDailyRoundItem(title: 'Culture results?'),
        ICUDailyRoundItem(title: 'Current antibiotics?'),
        ICUDailyRoundItem(title: 'Invasive lines?'),
        ICUDailyRoundItem(title: 'Pressure areas / wounds / cellulitis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.viruses,
            title: 'Antimicrobials (see resources)'),
        ICUDailyRoundItem(
            title: 'If patient deteriorating / septic workup (see resources)'),
        ICUDailyRoundItem(title: 'Can lines be removed?'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'F - Renal', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.tint, title: 'Current urine output?'),
        ICUDailyRoundItem(title: 'Fluid balance last 24 hours?'),
        ICUDailyRoundItem(title: 'Electrolytes?'),
        ICUDailyRoundItem(title: 'Acid-Base status?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Fluid Balance',
          footer: 'Target for next 24 hours + diuretics',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.crosshairs,
                title: 'Aim for negative fluid balance around 1L/d stable'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.prescription,
                title: 'Electrolyte supplementation / goals'),
          ]),
    ])
  ]),
  ICUDailyRoundSteps(heading: 'G - GIT', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.xRay,
            title: 'NGT confirmed correctly positioned?'),
        ICUDailyRoundItem(title: 'Abdominal examination?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.diagnoses, title: 'LFTs checked?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.fillDrip, title: 'Absorbing feeds?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.crosshairs, title: 'Nutrition (resources)'),
        ICUDailyRoundItem(title: 'Any surgical issues?'),
        ICUDailyRoundItem(title: 'Any liver issues?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'Change meds\n(NG → IV or vice versa)'),
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
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.stopCircle,
                  title: 'STOP, BREATHE then think'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.newspaper, title: 'Limit news intake'),
            ])
          ],
        ),
        ICUDailyRoundStepSection(
            heading: 'Take care of basic needs ',
            subsections: [
              ICUDailyRoundStepSubsection(list: [
                ICUDailyRoundItem(icon: FontAwesomeIcons.couch, title: 'Rest'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.carrot, title: 'Eat well'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.running,
                    title: 'Engage in physical activity'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.users,
                    title: 'Stay in contact with loved ones'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.wineGlassAlt,
                    title:
                        'Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.batteryThreeQuarters,
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
              icon: FontAwesomeIcons.meh,
              title: 'Anticipatory anxiety about what’s on its way.'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.cloud,
              title:
                  'Inability to think clearly, feeling overwhelmed, planning.'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.comments, title: 'Communication errors.'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.userMd,
              title: 'Tension in working relationships.'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.tired, title: '“Readiness” burnout.'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userPlus, title: 'Reassure colleagues'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.users,
            title: 'Family and personal planning'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.commentMedical,
            title: 'Communication updates'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.smile, title: 'Employee wellbeing officer'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Initial phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'Initial phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: 1', list: [
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.running,
              title:
                  'Starting to get going, lots of trying out, lost time, repetition and frustration.'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.meh,
              title: 'Further anticipatory anxiety'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.hospital, title: 'Battlefield central plan'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.commentMedical,
            title: 'Centralised communication'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.thumbsUp,
            title: 'It’s OK to say you’re not OK!'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.comment,
            title: 'Pre-brief and debrief each day'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.bed, title: 'Sleep hygiene!'),
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
                  icon: FontAwesomeIcons.exclamation,
                  title: 'Greatest risk period psychologically'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.sadTear,
                  title: 'Fear infection and implications for families'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.plus, title: 'Overwhelming workload'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.heartbeat,
                  title: 'Adrenaline and auto-pilot'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.frown, title: 'Exhaustion'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.tired, title: 'Distress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleArrows, title: 'Promote peer support'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.hospitalUser,
            title: 'Management are visible and available'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.newspaper,
            title: 'Regular communication bulletins'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.comments,
            title: 'Small pre-brief and debrief'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.firstAid, title: 'Psychological first-aid'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.tasks,
            title: 'Ensure the basics (as per previous page)'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'End phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'End phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: Few', list: [
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.glasses, title: 'Lookout for each other!'),
          ICUDailyRoundItem(icon: FontAwesomeIcons.frown, title: 'Exhaustion'),
          ICUDailyRoundItem(icon: FontAwesomeIcons.tired, title: 'Stress'),
          ICUDailyRoundItem(
              icon: FontAwesomeIcons.sadTear, title: 'Post-traumatic stress'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleArrows,
            title: 'Staff and 1:1 group sessions'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.thumbsUp,
            title: 'Gratitude and thanks to all our colleagues'),
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
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.users,
                  title: 'Lookout for each other!'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.chalkboardTeacher,
                  title: 'Reflection and learning'),
              ICUDailyRoundItem(
                  icon: FontAwesomeIcons.sadTear,
                  title: 'Post-traumatic stress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleArrows,
            title: 'Debriefing (Staff and 1:1 group sessions)'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.users,
            title: 'Look out for signs of PTSD:',
            subtitle: '• Edgy\n• Poor sleep\n• Avoid reminders'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.chalkboardTeacher,
            title: 'Learning and preparing for future'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.thumbsUp,
            title: 'Gratitude and thanks to all our colleagues',
            subtitle:
                '\n\n\nReference: Australian Society of Anaesthetists "Staff wellbeing preparation during COVID-19 pandemic phases" guidance'),
      ])
    ])
  ])
];

const proningGuide = [
  ICUDailyRoundSteps(heading: 'Indication', sections: [
    ICUDailyRoundStepSection(heading: 'Indications', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.lungsVirus,
            title: 'Severe ARDS with hypoxia'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userInjured,
            title: 'Posterior wounds / skin flaps'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Contraindications', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userNurse, title: 'Lack of staff'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.user, title: 'Untrained staff'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.clock, title: 'Out of hours'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.procedures, title: 'Open abdomen'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.exclamation, title: 'C spine precautions'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.chartLine,
            title: 'Haemodynamic instability'),
      ])
    ]),
  ]),
  ICUDailyRoundSteps(heading: 'Staff Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Team', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userMd, title: 'ICU consultant aware'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.users,
            title: 'Specialised proning team on site?',
            subtitle: '(Contact ICU physio)'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userPlus,
            title: 'Adequate staffing on unit?'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.chalkboardTeacher,
            title: 'Staff trained in proning procedure'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.diceSix,
            title: '6 x staff available for proning'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.usersCog,
            title: 'Allocate roles',
            subtitle:
                '• Airway x 1\n• Trunk and limbs x 4\n• Lines and equipment x1'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.teethOpen, title: 'Able to reintubate?'),
      ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Equipment and Preparation',
        subsections: [
          ICUDailyRoundStepSubsection(list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.dollyFlatbed, title: 'Crash trolley'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.heartbeat, title: 'ECG dots'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.bed, title: 'Fresh sheet x 2'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.plus, title: 'Slide sheet x 2'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.plus, title: 'Foldable Pillows x 3'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.plus, title: 'Clear bed area'),
          ])
        ])
  ]),
  ICUDailyRoundSteps(heading: 'Patient Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'General Considerations', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userCheck,
            title: 'Review indications and contraindications'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.rulerCombined,
            title: 'Check ROM of neck - 90°'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.commentMedical,
            title: 'Explain procedure to patient/family'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Airway', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.xRay,
            title: 'Check ETT position on CXR',
            subtitle: '(Document lip level)'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bookReader,
            title: 'Check patient airway grade'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.userLock, title: 'Secure ETT'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.tape, title: 'Sleek connections'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.tachometerAlt, title: 'Check for cuff leak'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.teethOpen,
            title: 'Suction mouth and nasal passages'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Breathing', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: FontAwesomeIcons.lungs, title: 'Pre-oxygenate'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.slidersH,
            title: 'Confirm ventilator settings'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.waveSquare, title: 'Check capnography'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Circulation', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.syringe,
            title: 'Check adequate vascular access + secure'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.chartLine,
            title: 'Confirm haemodynamically stable'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.commentMedical,
            title: 'Confirm plan if patient becomes unstable'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'Identify drug access point and metaraminol accessible'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Disability', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription, title: 'Sedated'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.commentMedical,
            title: 'Plan for further sedation discussed'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Equipment & Lines', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userLock,
            title: 'Secure all tubes and lines'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.lockOpen,
            title: 'Consider disconnecting unnecessary infusions'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.minus,
            title: 'Remove unnecessary indwelling devices'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.minus, title: 'Consider disconnecting RRT'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.minus, title: 'NGT - aspirate and spigot'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Other', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.userInjured,
            title: 'Assess for potential for pressure injury'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bone,
            title: 'Apply padding to bony prominences'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.teethOpen, title: 'Mouth care'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bandAid, title: 'Dress anterior wounds'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Prepare', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.users,
            title: 'Position team',
            subtitle: 'Team leader at head of bed'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.comments,
            title: 'Brief team on steps',
            subtitle: 'Turning direction'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.searchLocation,
            title: 'Position ETT on opposite side'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bed,
            title: 'Remove patient pillow and set air mattress to firm'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Horizontal Move', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleCarry,
            title: 'Move patient to edge of bed'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.handHolding,
            title: 'Tuck original sheet + new slide sheet under patient'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.handHolding,
            title:
                'Tuck new sheet and slide sheet on side patient turning towards'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Side Lying Position', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.handPaper,
            title: 'Tuck lower arm under buttock with palm up'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.directions,
            title: 'Turn patient into lateral position'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.heartbeat,
            title: 'Untangle lines and remove ECG leads to anterior thorax'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.levelUpAlt,
            title: 'Place ECG leads on posterior thorax'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bed, title: 'Remove old sheet'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleCarry,
            title: 'Pull new sheet + slide sheet through'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.arrowLeft,
            title: 'Slide patient to end of bed - away from ventilator'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.bed,
            title: 'Fold pillows by 1/3 and place under chest and pelvis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Complete Prone', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.levelDownAlt,
            title: 'Turn patient onto stomach'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.peopleArrows,
            title: 'Pull pillows through position in swimmer position'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.arrowDown,
            title: 'Place pillow under lower legs'),
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
          IntubationItem(
              'Staff safety needs to be prioritised over resuscitation',
              icon: FontAwesomeIcons.userShield),
          IntubationItem(
              'Do NOT enter the bed space until appropriate PPE applied',
              subtitle: 'Please review the WH PPE guidelines if needed',
              icon: FontAwesomeIcons.headSideMask),
          IntubationItem('Minimise responders in room to essential staff only',
              subtitle:
                  '• Team leader to allocate roles\n• "Door monitor" for crowd\n   control\n• Additional team members in\n   corridor',
              icon: FontAwesomeIcons.peopleArrows),
          IntubationItem('Communication in PPE is more difficult',
              icon: FontAwesomeIcons.comments),
          IntubationItem(
              'Resuscitation trolley should remain outside of room, when possible.',
              icon: FontAwesomeIcons.dollyFlatbed),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'PPE', sections: [
    ICUDailyRoundStepSection(
      subsections: [
        ICUDailyRoundStepSubsection(
          heading: 'During BLS',
          list: [
            ICUDailyRoundItem(
                title:
                    'First responders are SAFE to commence chest compressions wearing\n        • P2/N95 mask\n        • Face shield\n        • Apron\n        • Gloves\n        • Hand hygiene to above elbow afterwards',
                icon: FontAwesomeIcons.headSideMask),
          ],
        )
      ],
    ),
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'During ALS',
          list: [
            ICUDailyRoundItem(
                title:
                    'If any of the risk factors below are present\n        • COVID suspected or confirmed\n        • Droplet or airborne precautions\n        • Airway management required\n        • CPR lasting longer than 6 mins\n        • Code Blue in public areas',
                subtitle: '',
                icon: FontAwesomeIcons.biohazard),
            ICUDailyRoundItem(
                title:
                    'Then ALL RESPONDERS should wear\n        •  P2/N95 mask\n        •  face shield\n        •  long sleeved gown\n        •  gloves',
                subtitle: '',
                icon: FontAwesomeIcons.exclamationTriangle),
          ],
          footer: '\n\n\nALS/BLS PPE guidance v6 10/5/2020')
    ]),
  ]),
  IntubationContent(
    'BLS',
    [
      IntubationSection(
        items: [
          IntubationItem('COMPRESSION ONLY CPR',
              subtitle: '• Until code response team arrives',
              icon: FontAwesomeIcons.handPaper),
          IntubationItem('No airway adjuncts and AVOID bag mask ventilation',
              icon: FontAwesomeIcons.exclamationTriangle),
          IntubationItem('Apply Hudson mask at 10l O₂.',
              icon: FontAwesomeIcons.procedures),
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
                title: 'The most experienced operator should intubate',
                icon: FontAwesomeIcons.userMd),
            ICUDailyRoundItem(
                title: 'Use video laryngoscope',
                icon: FontAwesomeIcons.video,
                subtitle:
                    '• McGrath on Code Blue response trolley\n• Intubating anaesthetist will attend where possible'),
            ICUDailyRoundItem(
                title:
                    'The viral filter MUST be placed on circuit closest to the airway device',
                icon: FontAwesomeIcons.viruses),
            ICUDailyRoundItem(
                title: 'Follow airway strategy as per WH guidelines',
                icon: FontAwesomeIcons.hospital),
            ICUDailyRoundItem(
                title: 'If BMV required: 2 handed vice-like grip',
                icon: FontAwesomeIcons.hands),
          ],
        ),
        ICUDailyRoundStepSubsection(
          heading: 'Additional points',
          list: [
            ICUDailyRoundItem(
                title: 'Use COACHED for ALS rhythm checks',
                icon: FontAwesomeIcons.stopwatch),
            ICUDailyRoundItem(
              title: 'Intubated = Closed Circuit',
              subtitle: '• Do not disconnect for defibrillation',
              icon: FontAwesomeIcons.lungsVirus,
            ),
            ICUDailyRoundItem(
                title:
                    'During a cardiac arrest, CPR and intubation can take place outside of a negative pressure room',
                icon: FontAwesomeIcons.heartbeat),
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
          IntubationItem('Difficult airway more likely in ICU',
              subtitle: '• up to 10x Increase',
              icon: FontAwesomeIcons.exclamationTriangle),
          IntubationItem('Assess patient before they deteriorate',
              icon: FontAwesomeIcons.procedures),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Assessment', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'History', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.fileMedical,
            title: 'Important aspects:',
            subtitle:
                '\nPrevious difficult BMV/Intubation\n\nPMH - RA/Reflux/OSA\n\nHPC - burns/Airway swelling/trauma'),
      ]),
      ICUDailyRoundStepSubsection(heading: 'Examination', footer: '', list: [
        ICUDailyRoundItem(
          icon: FontAwesomeIcons.teethOpen,
          title: 'Airway assessment:',
          subtitle:
              '\nMouth opening\n\nMallampati score\n\nTeeth/Dentition\n\nThyromental distance\n\nNeck extension\n\nReceding chin',
        ),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Predictors of Difficulty', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'Difficult BMV?', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.exclamationTriangle,
            title: 'Previous difficult BMV'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.search,
            title: 'Other prognostic factors:',
            subtitle:
                '\nNeck Irradiation\n\nObese\n\nAge > 55\n\nSnorer/OSA\n\nEdentulous\n\nMP 3/4\n\nMale'),
      ]),
      ICUDailyRoundStepSubsection(
          heading: 'Difficult Intubation?',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.exclamationTriangle,
                title: 'Previous difficult intubation'),
            ICUDailyRoundItem(
              icon: FontAwesomeIcons.search,
              title: 'Other prognostic factors:',
              subtitle:
                  '\nMouth Opening < 3cm\n\nObese/Large breasts\n\nReduced neck extension\n\nRetrognathia\n\nProminent incisors\n\nLarge tongue',
            ),
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
          IntubationItem('SpO2 88-92% for COVID19 patients',
              icon: FontAwesomeIcons.crosshairs,
              subtitle: 'SpO2 92-96% in otherwise healthy patients'),
          IntubationItem('PaO2> 55-60mmHg', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('PaCO2 35-45mmHg', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('pH > 7.2', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Stable work of breathing / RR',
              icon: FontAwesomeIcons.crosshairs),
          IntubationItem('I:E ratio 1:2', icon: FontAwesomeIcons.crosshairs),
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
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.slidersH, title: 'SIMV VC'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.slidersH,
                    title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.xRay, title: 'Confirmed with CXR?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.userMd, title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.search,
                title: 'Consider:',
                subtitle:
                    '• Secondary pathology\n• NM blockade\n• Diuresis\n• Recruitment manoeuvre\n• Prone positiiong'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'CXR', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Frequency in COVID patients',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.calendar,
                title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.xRay, title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.chartLine,
                title: 'If significant clinical change'),
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
          IntubationItem('MAP > 65mmHg', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('HR < 130', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Cap refill < 2s', icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Cardiac index > 2.2',
              icon: FontAwesomeIcons.heartbeat),
          IntubationItem('Common cardiac medications and doses:',
              subtitle:
                  '• Noradrenaline\n     • 0.5-100mcg/min\n • Amiodarone\n     • 15mg/kg/d',
              icon: FontAwesomeIcons.prescription),
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
                icon: FontAwesomeIcons.procedures,
                title: 'If MAP < 65 & adequately fluid resuscitated:'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.prescription,
                title: 'Start noradrenaline at 5mcg/min'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.chartLine, title: 'Titrate to MAP'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Basic Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If Haemodynamically unstable or Noradrenaline > 20mcg/min',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.diagnoses, title: 'Re-examine patient'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.search,
                title: 'Consider:',
                subtitle:
                    '• ECG\n• Echocardiography\n• Troponin\n• Invasive cardiac monitoring'),
          ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Additional Considerations',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'If Haemodynamically unstable/ Norad > 30mcg/min',
              footer: '',
              list: [
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.userMd,
                    title: 'Discuss with Intensivist'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.prescription,
                    title: 'Consider Hydrocortisone 50mg IV QID'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.prescription,
                    title: 'Consider Argipressin 1-2 units/hr'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.fillDrip,
                    title: 'Consider giving fluid bolus'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.fileMedicalAlt,
                    title: 'Re-visit diagnosis - does patient need inotropes?'),
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
          IntubationItem('Consider sedation targets in clinical context',
              icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Aim for RIKER score 1 if patient is:',
              subtitle:
                  ' • Haemodynamically unstable\n • Hypoxic\n • Requires proning',
              icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Aim for RIKER score 3-4 if patient is:',
              subtitle: ' • Weaning from ventilator\n • FiO2 < 0.4',
              icon: FontAwesomeIcons.crosshairs),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Riker Score', sections: [
    ICUDailyRoundStepSection(
        heading: 'Condition and Example Behaviours',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: '',
              footer:
                  '\n\nThe Riker score is a Sedation-Agitation Scale commonly used in ICUs',
              list: [
                ICUDailyRoundItem(
                    title: '7 - Dangerous agitation',
                    subtitle: ' • Pulling at ETT\n • Climbing out of bed'),
                ICUDailyRoundItem(
                    title: '6 - Very agitated',
                    subtitle:
                        ' • Does not calm down\n • May require restraint at times'),
                ICUDailyRoundItem(
                    title: '5 - Agitated',
                    subtitle:
                        ' • Anxious or mildly agitated\n • Attempts to sit up\n • Calms with verbal instructions'),
                ICUDailyRoundItem(
                    title: '4 - Calm and co-operative',
                    subtitle: ' • Calm\n • Wakens easily\n • Follows commands'),
                ICUDailyRoundItem(
                    title: '3 - Sedated',
                    subtitle:
                        ' • Difficult to rouse\n • Awakens to verbal stimuli\n • Does not follow commands'),
                ICUDailyRoundItem(
                    title: '2 - Very Sedated',
                    subtitle:
                        ' • Arouses to physical stimuli\n • Does not communicate or follow\n    commands\n • May move spontaneously'),
                ICUDailyRoundItem(
                    title: '1 - Unrousable',
                    subtitle:
                        ' • No response to noxious stiumuli\n • Does not follow commands'),
              ])
        ]),
  ]),
  ICUDailyRoundSteps(heading: 'Sedation', sections: [
    ICUDailyRoundStepSection(heading: 'Choice of Sedative:', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'If post-intubation:',
            subtitle: '• Propofol 50-100mg/hr\n• +/- Fentanyl 10-20mcg/hr'),
      ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Consider Daily Sedation Break If:',
        subsections: [
          ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.slidersH, title: 'FiO2 < 0.4'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.heartbeat,
                title: 'Noradrenaline < 20mcg/min'),
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.notEqual,
                title: 'No muscle relaxant in use'),
          ])
        ]),
    ICUDailyRoundStepSection(heading: 'Commonly Used Drugs:', subsections: [
      ICUDailyRoundStepSubsection(
          heading: '',
          footer:
              '\n\nDiscuss with intensivist or senior colleague if unsure of most appropriate option.',
          list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.prescription,
                title: 'Propofol',
                subtitle: '• 5-200mg/hr'),
            ICUDailyRoundItem(title: 'Midazolam', subtitle: '• 0.5-10mg/hr'),
            ICUDailyRoundItem(title: 'Fentanyl', subtitle: '• 10-30mcg/hr'),
            ICUDailyRoundItem(title: 'Morphine', subtitle: '• 0.5-10mg/hr'),
            ICUDailyRoundItem(
                title: 'Cisatracurium',
                subtitle:
                    '• 15mg blous then 10mg/hr\n• A paralysis agent rather than sedative'),
          ])
    ])
  ]),
];

const idBasicsGuide = [
  IntubationContent(
    'Antimicrobials',
    [
      IntubationSection(
        items: [
          IntubationItem(
              'Empiric antimicrobials to consider for COVID-19 patients:',
              subtitle: '• Ceftriaxone 2g IV daily\n• Azithromycin 500mg IV OD',
              icon: FontAwesomeIcons.prescription),
          IntubationItem('Add Vancomycin if profound shock:',
              subtitle:
                  '• 2g load\n• 1g BD\n• Doses based on levels\n• Levels pre 3rd dose',
              icon: FontAwesomeIcons.prescription),
          IntubationItem('Steroids currently not recommended for COVID 19',
              icon: FontAwesomeIcons.prescription),
          IntubationItem(
              'Antiviral therapies to be commenced ONLY IN  CONTEXT OF CLINICAL TRIAL',
              icon: FontAwesomeIcons.prescription),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Infection control', sections: [
    ICUDailyRoundStepSection(heading: 'Line changes', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.notEqual,
            title: 'Empiric line changes of CVC not recommended'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Septic screen', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.vials,
            title: 'Blood cultures',
            subtitle: '• peripheral and central samples'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.vial, title: 'Urine MCS'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.headSideCough, title: 'Sputum MCS'),
        ICUDailyRoundItem(icon: FontAwesomeIcons.xRay, title: 'CXR'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.vials, title: 'FBE, UEC, CRP, Lactate'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.viruses,
            title: 'COVID swab',
            subtitle: '• NPA + Sputum'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.teethOpen, title: 'Viral PCR throat swab'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.disease,
            title: 'Legionella and pneumococcal antigen'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.vial, title: 'Faecal MCS if diarrhoea'),
      ])
    ]),
  ])
];
const renalBasicsGuide = [
  IntubationContent(
    'Aims',
    [
      IntubationSection(
        items: [
          IntubationItem(
            'Negative fluid balance - 1l/day',
            icon: FontAwesomeIcons.crosshairs,
          ),
          IntubationItem('K+ target:',
              subtitle: '• 3.5-5.5mmol/l\n• >4mmol/l if cardiac arrhthmias',
              icon: FontAwesomeIcons.crosshairs),
          IntubationItem('Na 135-145mmol/l', icon: FontAwesomeIcons.crosshairs),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Principles', sections: [
    ICUDailyRoundStepSection(
        heading: 'If Fluid Balance +ve >1litre in 24h',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Consider frusemide',
              footer: '',
              list: [
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.prescription,
                    title: 'Start at 40mg IV QID'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.chartLine,
                    title:
                        'Increase in 20mg QID increments if not meeting targets at 24 hours'),
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.exchangeAlt,
                    title:
                        'If > 80mg QID of frusemide, then switch to infusion starting at 10mg/hr'),
              ])
        ]),
    ICUDailyRoundStepSection(
        heading: 'Renal Replacement Therapy (RRT)',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Discuss with Intensivist\n       • Indications: AEIOU',
              footer: '',
              list: [
                ICUDailyRoundItem(
                    icon: FontAwesomeIcons.procedures,
                    title: 'Acidosis',
                    subtitle: ' • pH <7.1 or Bicarb < 15mmol/l'),
                ICUDailyRoundItem(
                    title: 'Electrolytes',
                    subtitle: ' • Refractory K+ > 6.5mmol/l'),
                ICUDailyRoundItem(
                    title: 'Overload',
                    subtitle: ' • Refractory fluid overload'),
                ICUDailyRoundItem(
                    title: 'Intoxication',
                    subtitle: ' • Drug overdose/ intoxication'),
                ICUDailyRoundItem(
                    title: 'Uraemia', subtitle: ' • > 40mmol/l or symptomatic'),
              ])
        ]),
  ]),
];

const gitBasicsGuide = [
  IntubationContent(
    'Nasogastric tube',
    [
      IntubationSection(
        items: [
          IntubationItem('Confirm placement on CXR:',
              subtitle: '• Bisects carina\n• Tip below diaphragm',
              icon: FontAwesomeIcons.xRay),
          IntubationItem('Do not commence feeding until placement confirmed',
              icon: FontAwesomeIcons.exclamationTriangle),
          IntubationItem('Check position daily on CXR',
              icon: FontAwesomeIcons.calendar),
          IntubationItem(
              'Clinical methods to confirm placement are not reliable',
              icon: FontAwesomeIcons.diagnoses),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Feeding', sections: [
    ICUDailyRoundStepSection(heading: 'Principles', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: FontAwesomeIcons.clock, title: 'Start early'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.comments,
            title: 'Consult dietician if available'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.projectDiagram,
            title: '1kCal/ml feed as per protocol is reasonable out of hours'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.arrowDown,
            title: 'If high aspirates - slow the rate'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'Consider prokinetics if not absorbing'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Laxatives', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescription,
            title: 'Early laxative use suggested'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.calendar,
            title: 'Faecal containmenet device - day 3 or earlier'),
        ICUDailyRoundItem(
            icon: FontAwesomeIcons.prescriptionBottleAlt,
            title: 'Laxatives:',
            subtitle: '• Lactulose 20ml bd\n• Movicol 1 bd'),
      ])
    ]),
  ]),
];
