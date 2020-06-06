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
    description: 'WH videos and step by step guide',
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
    description: 'WH Theatre Extubation guideline v1.1',
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
              icon: FontAwesomeIcons.lungs),
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
              title: 'SaO₂ 88-92%', icon: FontAwesomeIcons.tachometerAlt),
          ICUDailyRoundItem(
            title: 'PaO₂ 55-70mmHg',
          ),
          ICUDailyRoundItem(
            title: 'Pplat < 30',
          ),
          ICUDailyRoundItem(
            title: 'pH > 7.20',
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
                icon: FontAwesomeIcons.plus,
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
            ICUDailyRoundItem(icon: Icons.add, title: 'Size?'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Position?'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Confirmed with CXR?'),
            ICUDailyRoundItem(
                icon: Icons.add,
                title: 'Are all connections secured with sleek?'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If planned for extubation:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: Icons.add, title: 'When?'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Where?'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'How? (see airway resources)'),
            ICUDailyRoundItem(
                icon: Icons.add,
                title: 'Does ETT need advancing / withdrawing?'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'B - Breathing', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'SpO₂?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'PaO₂?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'CXR reviewed?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'ABG reviewed?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Current ventilator settings reviewed?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Standard Targets',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add, title: 'PaO₂ > 55-60mmHg\nSaO₂ > 88-92%'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'pH > 7.20\nif pH normal, CO₂ 35-45'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'VTe 4-8 ml/kg\nwith Pplat < 30'),
            ICUDailyRoundItem(
                icon: Icons.add,
                title:
                    'PEEP: According to PEEP Table\nAlso check ETT lines NG ICC'),
          ]),
      ICUDailyRoundStepSubsection(
          heading: 'If FiO₂ > 0.6 and PEEP > 15',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Specialist review and see resources'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'C - Circulation', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'HR / rhythm / MAP?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'ECG / Echocardigram?'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title:
                'Lactate? (Signs of end organ perfusion: mottled / cool peripheries / cap refill time?)'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: 'Aims', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'MAP > 65'),
        ICUDailyRoundItem(icon: Icons.add, title: '[Hb] > 70'),
      ]),
      ICUDailyRoundStepSubsection(
          heading: 'If haemodyamically unstable / MAP < 65',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add,
                title:
                    'Commence noradrenaline, see resources / echocardiogram'),
          ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'D - Neurological', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Riker score & pain assessment?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Current sedation / analgesic infusions?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Neuromuscular blockers?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Analgesia / sedation plan and target (see resources)'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title:
                'Consider sedation break (see resources) / cessation of neuromuscular blocker'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'E - Infection/Exposure', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Temperature?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Culture results?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Current antibiotics?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Invasive lines?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Pressure areas / wounds / cellulitis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Antimicrobials (see resources)'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'If patient deteriorating / septic workup (see resources)'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Can lines be removed?'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'F - Renal', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Current urine output?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Fluid balance last 24 hours?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Electrolytes?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Acid-Base status?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'Fluid Balance',
          footer: 'Target for next 24 hours + diuretics',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add,
                title: 'Aim for negative fluid balance around 1L/d stable'),
          ]),
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Electrolyte supplementation / goals'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'G - GIT', sections: [
    ICUDailyRoundStepSection(heading: 'Assessment', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'NGT confirmed correctly positioned?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Abdominal examination?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'LFTs checked?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Absorbing feeds?'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Plan', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Nutrition (resources)'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Any surgical issues?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Any liver issues?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Change meds\n(NG → IV or vice versa)'),
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
                  icon: Icons.add, title: 'STOP, BREATHE then think'),
              ICUDailyRoundItem(icon: Icons.add, title: 'Limit news intake'),
            ])
          ],
        ),
        ICUDailyRoundStepSection(
            heading: 'Take care of basic needs ',
            subsections: [
              ICUDailyRoundStepSubsection(list: [
                ICUDailyRoundItem(icon: Icons.add, title: 'Rest'),
                ICUDailyRoundItem(icon: Icons.add, title: 'Eat well'),
                ICUDailyRoundItem(
                    icon: Icons.add, title: 'Engage in physical activity'),
                ICUDailyRoundItem(
                    icon: Icons.add, title: 'Stay in contact with loved ones'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title:
                        'Avoid unhelpful coping strategies (Tobacco, alcohol or other drugs)'),
                ICUDailyRoundItem(
                    icon: Icons.add,
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
              icon: Icons.add,
              title: 'Anticipatory anxiety about what’s on its way.'),
          ICUDailyRoundItem(
              icon: Icons.add,
              title:
                  'Inability to think clearly, feeling overwhelmed, planning.'),
          ICUDailyRoundItem(icon: Icons.add, title: 'Communication errors.'),
          ICUDailyRoundItem(
              icon: Icons.add, title: 'Tension in working relationships.'),
          ICUDailyRoundItem(icon: Icons.add, title: '“Readiness” burnout.'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Reassure colleagues'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Family and personal planning'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Communication updates'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Employee wellbeing officer'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Initial phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'Initial phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: 1', list: [
          ICUDailyRoundItem(
              icon: Icons.add,
              title:
                  'Starting to get going, lots of trying out, lost time, repetition and frustration.'),
          ICUDailyRoundItem(
              icon: Icons.add, title: 'Further anticipatory anxiety'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Battlefield central plan'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Centralised communication'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'It’s OK to say you’re not OK!'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Pre-brief and debrief each day'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Sleep hygiene!'),
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
                  icon: Icons.add,
                  title: 'Greatest risk period psychologically'),
              ICUDailyRoundItem(
                  icon: Icons.add,
                  title: 'Fear infection and implications for families'),
              ICUDailyRoundItem(
                  icon: Icons.add, title: 'Overwhelming workload'),
              ICUDailyRoundItem(
                  icon: Icons.add, title: 'Adrenaline and auto-pilot'),
              ICUDailyRoundItem(icon: Icons.add, title: 'Exhaustion'),
              ICUDailyRoundItem(icon: Icons.add, title: 'Distress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Promote peer support'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Management are visible and available'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Regular communication bulletins'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Small pre-brief and debrief'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Psychological first-aid'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Ensure the basics (as per previous page)'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'End phase', sections: [
    ICUDailyRoundStepSection(
      heading: 'End phase',
      subsections: [
        ICUDailyRoundStepSubsection(heading: 'Number of cases: Few', list: [
          ICUDailyRoundItem(icon: Icons.add, title: 'Lookout for each other!'),
          ICUDailyRoundItem(icon: Icons.add, title: 'Exhaustion'),
          ICUDailyRoundItem(icon: Icons.add, title: 'Stress'),
          ICUDailyRoundItem(icon: Icons.add, title: 'Post-traumatic stress'),
        ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Staff and 1:1 group sessions'),
        ICUDailyRoundItem(
            icon: Icons.add,
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
                  icon: Icons.add, title: 'Lookout for each other!'),
              ICUDailyRoundItem(
                  icon: Icons.add, title: 'Reflection and learning'),
              ICUDailyRoundItem(
                  icon: Icons.add, title: 'Post-traumatic stress'),
            ])
      ],
    ),
    ICUDailyRoundStepSection(heading: 'How to self-care', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Debriefing (Staff and 1:1 group sessions)'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Look out for signs of PTSD:',
            subtitle: '• Edgy\n• Poor sleep\n• Avoid reminders'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Learning and preparing for future'),
        ICUDailyRoundItem(
            icon: Icons.add,
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
        ICUDailyRoundItem(icon: Icons.add, title: 'Severe ARDS with hypoxia'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Posterior wounds / skin flaps'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Contraindications', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Lack of staff'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Untrained staff'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Out of hours'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Open abdomen'),
        ICUDailyRoundItem(icon: Icons.add, title: 'C spine precautions'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Haemodynamic instability'),
      ])
    ]),
  ]),
  ICUDailyRoundSteps(heading: 'Staff Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Team', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'ICU consultant aware'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Specialised proning team on site?',
            subtitle: '(Contact ICU physio)'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Adequate staffing on unit?'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Staff trained in proning procedure'),
        ICUDailyRoundItem(
            icon: Icons.add, title: '6 x staff available for proning'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Allocate roles',
            subtitle:
                '• Airway x 1\n• Trunk and limbs x 4\n• Lines and equipment x1'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Able to reintubate?'),
      ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Equipment and Preparation',
        subsections: [
          ICUDailyRoundStepSubsection(list: [
            ICUDailyRoundItem(
                icon: FontAwesomeIcons.dollyFlatbed, title: 'Crash trolley'),
            ICUDailyRoundItem(icon: Icons.add, title: 'ECG dots'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Fresh sheet x 2'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Slide sheet x 2'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Foldable Pillows x 3'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Clear bed area'),
          ])
        ])
  ]),
  ICUDailyRoundSteps(heading: 'Patient Pre-Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'General Considerations', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Review indications and contraindications'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Check ROM of neck - 90°'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Explain procedure to patient/family'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Airway', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Check ETT position on CXR',
            subtitle: '(Document lip level)'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Check patient airway grade'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Secure ETT'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Sleek connections'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Check for cuff leak'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Suction mouth and nasal passages'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Breathing', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Pre-oxygenate'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Confirm ventilator settings'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Check capnography'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Circulation', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Check adequate vascular access + secure'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Confirm haemodynamically stable'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Confirm plan if patient becomes unstable'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Identify drug access point and metaraminol accessible'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Disability', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Sedated'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Plan for further sedation discussed'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Equipment & Lines', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Secure all tubes and lines'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Consider disconnecting unnecessary infusions'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Remove unnecessary indwelling devices'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Consider disconnecting RRT'),
        ICUDailyRoundItem(icon: Icons.add, title: 'NGT - aspirate and spigot'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Other', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Assess for device potential for pressure injury'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Apply padding to bony prominences'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Mouth care'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Dress anterior wounds'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Manoeuvre', sections: [
    ICUDailyRoundStepSection(heading: 'Prepare', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Position team',
            subtitle: 'Team leader at head of bed'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Brief team on steps',
            subtitle: 'Turning direction'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Position ETT on opposite side'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Remove patient pillow and set air mattress to firm'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Horizontal Move', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Move patient to edge of bed'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Tuck original sheet + new slide sheet under patient'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title:
                'Tuck new sheet and slide sheet on side patient turning towards'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Side Lying Position', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Tuck lower arm under buttock with palm up'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Turn patient into lateral position'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Untangle lines and remove ECG leads to anterior thorax'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Place ECG leads on posterior thorax'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Remove old sheet'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Pull new sheet + slide sheet through'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Slide patient to end of bed - away from ventilator'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Fold pillows by 1/3 and place under chest and pelvis'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Complete Prone', subsections: [
      ICUDailyRoundStepSubsection(list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Turn patient onto stomach'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Pull pillows through position in swimmer position'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Place pillow under lower legs'),
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
              icon: Icons.add),
          IntubationItem(
              'Do NOT enter the bed space until appropriate PPE applied',
              subtitle: 'Please review the WH PPE guidelines if needed',
              icon: Icons.add),
          IntubationItem('Minimise responders in room to essential staff only',
              subtitle:
                  '• Team leader to allocate roles\n• "Door monitor" for crowd\n   control\n• Additional team members in\n   corridor',
              icon: Icons.add),
          IntubationItem('Communication in PPE is more difficult',
              icon: Icons.add),
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
          heading:
              'First responders are SAFE to commence chest compressions in',
          list: [
            ICUDailyRoundItem(
                title:
                    '• P2/N95 mask\n• Face shield\n• Apron\n• Gloves\n• Hand hygiene to above elbow\n   after',
                icon: Icons.add),
          ],
        )
      ],
    ),
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(
          heading:
              'ALL RESPONDERS:\n    •  P2/N95 mask\n    •  face shield\n    •  long sleeved gown\n    •  gloves \n      when:',
          list: [
            ICUDailyRoundItem(
                title:
                    '• COVID suspected or confirmed\n\n• Droplet or airborne precautions\n\n• Airway management required\n\n• CPR lasting longer than 6 mins\n\n• Code Blue in public areas',
                subtitle: '',
                icon: Icons.add),
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
              subtitle: '• Until code response team arrives', icon: Icons.add),
          IntubationItem('No airway adjuncts and AVOID bag mask ventilation',
              icon: Icons.add),
          IntubationItem('Apply Hudson mask at 10L O₂.', icon: Icons.add),
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
                icon: FontAwesomeIcons.prayingHands),
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
                icon: FontAwesomeIcons.heart),
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
              subtitle: '• up to 10x Increase', icon: Icons.add),
          IntubationItem('Assess patient before they deteriorate',
              icon: Icons.add),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Assessment', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'History', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Hx of difficult BMV/Intubation?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'PMH - ?RA/Reflux/OSA'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'HPC - burns/Airway swelling/trauma?'),
      ]),
      ICUDailyRoundStepSubsection(heading: 'Examination', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Teeth/Dentition?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Mouth opening?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Mallampati score?'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Thyromental distance'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Neck extension'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Receding chin?'),
      ])
    ])
  ]),
  ICUDailyRoundSteps(heading: 'Predictors of Difficulty', sections: [
    ICUDailyRoundStepSection(subsections: [
      ICUDailyRoundStepSubsection(heading: 'Difficult BMV?', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Previous difficult BMV'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Neck Irradiation'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Obese'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Age > 55'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Snorer/OSA'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Edentulous'),
        ICUDailyRoundItem(icon: Icons.add, title: 'MP 3/4'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Male'),
      ]),
      ICUDailyRoundStepSubsection(
          heading: 'Difficult Intubation?',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Previous difficult intubation'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Mouth Opening < 3cm'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Obese/Large breasts'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Reduced neck extension'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Retrognathia'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Prominent incisors'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Large tongue'),
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
              icon: Icons.add,
              subtitle: 'SpO2 92-96% in otherwise healthy patients'),
          IntubationItem('PaO2> 55-60mmHg', icon: Icons.add),
          IntubationItem('PaCO2 35-45mmHg', icon: Icons.add),
          IntubationItem('pH > 7.2', icon: Icons.add),
          IntubationItem('Stable work of breathing / RR', icon: Icons.add),
          IntubationItem('I:E ratio 1:2', icon: Icons.add),
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
                ICUDailyRoundItem(icon: Icons.add, title: 'SIMV VC'),
                ICUDailyRoundItem(
                    icon: Icons.add, title: 'FiO2 dependent on PEEP'),
                ICUDailyRoundItem(
                    icon: Icons.add, title: 'Confirmed with CXR?'),
              ])
        ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If FiO2> 0.6 and PEEP 15 for 4-6 hours:',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: Icons.add, title: 'Senior Review'),
            ICUDailyRoundItem(
                icon: Icons.add,
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
                icon: Icons.add, title: 'Mon/Wed/Friday - routine'),
            ICUDailyRoundItem(icon: Icons.add, title: 'If new CVC/NGT'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'If significant clinical change'),
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
          IntubationItem('MAP > 65mmHg', icon: Icons.add),
          IntubationItem('HR < 130', icon: Icons.add),
          IntubationItem('Cap refill < 2s', icon: Icons.add),
          IntubationItem('Cardiac index > 2.2', icon: Icons.add),
          IntubationItem('Common cardiac medications and doses:',
              subtitle:
                  '• Noradrenaline\n     • 0.5-100mcg/min\n • Amiodarone\n     • 15mg/kg/d',
              icon: Icons.add),
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
                icon: Icons.add,
                title: 'If MAP < 65 & adequately fluid resuscitated:'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Start noradrenaline at 5mcg/min'),
            ICUDailyRoundItem(icon: Icons.add, title: 'Titrate to MAP'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: 'Troubleshooting', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If Haemodynamically unstable or Noradrenaline > 20mcg/min',
          footer: '',
          list: [
            ICUDailyRoundItem(icon: Icons.add, title: 'Re-examine patient'),
            ICUDailyRoundItem(
                icon: Icons.add,
                title: 'Consider:',
                subtitle:
                    '• ECG\n• Echocardiography\n• Troponin\n• Invasive cardiac monitoring'),
          ])
    ]),
    ICUDailyRoundStepSection(heading: '', subsections: [
      ICUDailyRoundStepSubsection(
          heading: 'If Haemodynamically unstable/ Norad > 30mcg/min',
          footer: '',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Discuss with Intensivist'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Consider Hydrocortisone 50mg IV QID'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Consider Argipressin 1-2 units/hr'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Consider giving fluid bolus'),
            ICUDailyRoundItem(
                icon: Icons.add,
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
              icon: Icons.add),
          IntubationItem('Aim for RIKER score 1 if patient is:',
              subtitle:
                  ' • Haemodynamically unstable\n • Hypoxic\n • Requires proning',
              icon: Icons.add),
          IntubationItem('Aim for RIKER score 3-4 if patient is:',
              subtitle: ' • Weaning from ventilator\n • FiO2 < 0.4',
              icon: Icons.add),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Riker Score', sections: [
    ICUDailyRoundStepSection(
        heading: 'Condition and example behaviours',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: '',
              footer:
                  '\n\nThe Riker score is a Sedation-Agitation Scale commonly used in ICUs',
              list: [
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Dangerous agitation',
                    subtitle: ' • Pulling at ETT\n • Climbing out of bed'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Very agitated',
                    subtitle:
                        ' • Does not calm down\n • May require restraint at times'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Agitated',
                    subtitle:
                        ' • Anxious or mildly agitated\n • Attempts to sit up\n • Calms with verbal instructions'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Calm and co-operative',
                    subtitle: ' • Calm\n • Wakens easily\n • Follows commands'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Sedated',
                    subtitle:
                        ' • Difficult to rouse\n • Awakens to verbal stimuli\n • Does not follow commands'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Very Sedated',
                    subtitle:
                        ' • Arouses to physical stimuli\n • Does not communicate or follow commands\n • May move spontaneously'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Unrousable',
                    subtitle:
                        ' • No response to noxious stiumuli\n • Does not follow commands'),
              ])
        ]),
  ]),
  ICUDailyRoundSteps(heading: 'Sedation', sections: [
    ICUDailyRoundStepSection(heading: 'Choice of sedative:', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'If post-intubation:',
            subtitle: '• Propofol 50-100mg/hr\n• +/- Fentanyl 10-20mcg/hr'),
      ])
    ]),
    ICUDailyRoundStepSection(
        heading: 'Consider daily sedation break if:',
        subsections: [
          ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
            ICUDailyRoundItem(icon: Icons.add, title: 'FiO2 < 0.4'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Noradrenaline < 20mcg/min'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'No muscle relaxant in use'),
          ])
        ]),
    ICUDailyRoundStepSection(heading: 'Commonly used Drugs:', subsections: [
      ICUDailyRoundStepSubsection(
          heading: '',
          footer: '\n\nDiscuss with intensivist or senior colleague if unsure',
          list: [
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Propofol', subtitle: '• 5-200mg/hr'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Midazolam', subtitle: '• 0.5-10mg/hr'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Fentanyl', subtitle: '• 10-30mcg/hr'),
            ICUDailyRoundItem(
                icon: Icons.add, title: 'Morphine', subtitle: '• 0.5-10mg/hr'),
            ICUDailyRoundItem(
                icon: Icons.add,
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
          IntubationItem('Empiric antimicrobials for COVID-19 patients:',
              subtitle: '• Ceftriaxone 2g IV daily\n• Azithromycin 500mg IV OD',
              icon: Icons.add),
          IntubationItem('Add Vancomycin if profound shock:',
              subtitle:
                  '• 2g load\n• 1g BD\n• Doses based on levels\n• Levels pre 3rd dose',
              icon: Icons.add),
          IntubationItem('Steroids currently not recommended for COVID 19',
              icon: Icons.add),
          IntubationItem(
              'Antiviral therapies to be commenced ONLY IN  CONTEXT OF CLINICAL TRIAL',
              icon: Icons.add),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Infection control', sections: [
    ICUDailyRoundStepSection(heading: 'Line changes', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Empiric line changes of CVC not recommended'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Septic screen', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Blood cultures',
            subtitle: '• peripheral and central samples'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Urine MCS'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Sputum MCS'),
        ICUDailyRoundItem(icon: Icons.add, title: 'CXR'),
        ICUDailyRoundItem(icon: Icons.add, title: 'FBE, UEC, CRP, Lactate'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'COVID swab', subtitle: '• NPA + Sputum'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Viral PCR throat swab'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Legionella and pneumococcal antigen'),
        ICUDailyRoundItem(icon: Icons.add, title: 'Faecal MCS if diarrhoea'),
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
          IntubationItem('Negative fluid balance - 1l/day', icon: Icons.add),
          IntubationItem('K+ target:',
              subtitle: '• 3.5-5.5mmol/l\n• >4mmol/l if cardiac arrhthmias',
              icon: Icons.add),
          IntubationItem('Na 135-145mmol/l', icon: Icons.add),
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
                    icon: Icons.add, title: 'Start at 40mg IV QID'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title:
                        'Increase in 20mg QID increments if not meeting targets at 24 hours'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title:
                        'If > 80mg QID of frusemide, then switch to infusion starting at 10mg/hr'),
              ])
        ]),
    ICUDailyRoundStepSection(
        heading: 'Renal Replacement Therapy (RRT)',
        subsections: [
          ICUDailyRoundStepSubsection(
              heading: 'Discuss with Intensivist\n • Indications: AEIOU',
              footer: '',
              list: [
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Acidosis',
                    subtitle: ' • pH <7.1 or Bicarb < 15mmol/l'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Electrolytes',
                    subtitle: ' • Refractory K+ > 6.5mmol/l'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Overload',
                    subtitle: ' • Refractory fluid overload'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Intoxication',
                    subtitle: ' • Drug overdose/ intoxication'),
                ICUDailyRoundItem(
                    icon: Icons.add,
                    title: 'Uraemia',
                    subtitle: ' • > 40mmol/l or symptomatic'),
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
              icon: Icons.add),
          IntubationItem('Do not commence feeding until placement confirmed',
              icon: Icons.add),
          IntubationItem('Check position daily on CXR', icon: Icons.add),
          IntubationItem(
              'Clinical methods to confirm placement are not reliable',
              icon: null),
        ],
      )
    ],
  ),
  ICUDailyRoundSteps(heading: 'Feeding', sections: [
    ICUDailyRoundStepSection(heading: 'Principles', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(icon: Icons.add, title: 'Start early'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Consult dietician if available'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: '1kCal/ml feed as per protocol is reasonable out of hours'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'If high aspirates - slow the rate'),
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Consider prokinetics if not absorbing'),
      ])
    ]),
    ICUDailyRoundStepSection(heading: 'Laxatives', subsections: [
      ICUDailyRoundStepSubsection(heading: '', footer: '', list: [
        ICUDailyRoundItem(
            icon: Icons.add, title: 'Early laxative use suggested'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Faecal containmenet device - day 3 or earlier'),
        ICUDailyRoundItem(
            icon: Icons.add,
            title: 'Laxatives:',
            subtitle: '• Lactulose 20ml bd\n• Movicol 1 bd'),
      ])
    ]),
  ]),
];
