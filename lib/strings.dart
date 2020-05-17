/// Strings used throughout the app and are not likely to change often
class Strings {
  /// General strings
  static const String appName = 'WHAC19';
  static const String toDo = 'TO DO';

  /// Disclaimer strings
  static const String disclaimerTitle = 'Disclaimer & Conditions of Use';
  static const String disclaimerHeading = 'Disclaimer';
  // *** WARNING ***
  // When disclaimerBody changes in any way, increment disclaimerVersion by one
  static const String disclaimerBody = '''
The Western Health Critical Care COVID-19 Application ('the app') has been 
developed to support the implementation of selected Western Health guidelines, protocols and advice by anaesthesia and critical care doctors at Western Health. The app reproduces content developed by contributing members of the COVID-19 Guidelines Working Group, the most current versions of which can be found at the Western Health Novel Coronavirus Information microsite https://coronavirus.wh.org.au/clinical-guidelines. 
\nWe provide no warranty that the information contained within the app is accurate, up to date or complete and in no circumstance does the information constitute professional advice. You are responsible for independently verifying the information and acknowledge that the guidance provided may not be applicable in all circumstances or for all patients..
\nTo the extent permitted by law, Western Health, Western Health employees, the designers, developers, testers, reviewers, organisers and all other contributors to the project (‘app developers’) have no liability (including liability arising as a result of the negligence of any of the app developers or the app developers jointly) to the users for any loss, damage, cost or expense incurred or arising by reason of any person using or relying on the information and whether caused by reason of any error, negligent act, omission or misinterpretation in the app or otherwise.
\nThe Western Health trademark and app cannot be copied, modified, reproduced, published, uploaded, distributed or posted without the prior written consent of Western Health. 
\nUse of this app constitutes acknowledgement of these conditions.\n\n\n\n''';
  // *** WARNING ***
  // Increment by one when the disclaimerBody changes. This will force users to accept/re-accept the disclaimer again
  // if they have previously accepted it. If the disclaimer has changed then users need to re-accept it.
  static const String disclaimerCurrentVersion = '7';
  static const String disclaimerButtonAgreeText = 'I Agree';
  static const String disclaimerHaveAgreedText =
      'You have agreed to the disclaimer';

  /// Onboarding screen titles
  static const String onboarding1Title = 'Hospital Staff Use Only';
  static const String onboarding2Title = 'Educational Use Only';
  static const String onboarding3Title = 'Content from Western Health';

  /// Home screen strings
  static const String homeHeading1 = 'PPE';
  static const String homeHeading2 = 'Airway';
  static const String homeHeading3 = 'ICU';
  static const String homeHeading4 = 'Resources';

  /// PPE
  static const String ppeTitle = 'Basic ICU technique';
  static const String ppeDonningTitle = 'Donning Personal Protective Equipment';
  static const String ppeDoffingTitle = 'Doffing Personal Protective Equipment';
  static const String ppeMethod1Title = 'Method 1';
  static const String ppeMethod2Title = 'Method 2';
  static const String ppeMethod1InfographicTitle = 'Method One Infographic';
  static const String ppeMethod2InfographicTitle = 'Method Two Infographic';
  static const String ppeStepByStepTitle = 'Step By Step Guide';
  static const String ppeDonningInfographicTitle = 'PPE ON Infographic';

  /// Licencing
  static const String licencesTitle = 'Third-Party Licenses';
  static const String licencesMsg =
      'WHAC19 is built using open source software';

  /// Intubation screens
  static const String intubationChecklistTitle = 'Intubation Checklist';
  static const String intubationInfographicTitle = 'Intubation Infographic';
  static const String intubationGuideTitle = 'Intubation Guide';

  /// Extubation
  static const String extubationGuideTitle = 'Extubation Guide';
  static const String extubationInfographicTitle = 'Extubation Infographic';

  /// Ventilation
  static const String ventilationTitle = 'Ventilation';
  static const String ventilationInfographicTitle = 'Ventilation Infographic';

  /// Daily Round
  static const String dailyRoundTitle = 'Daily Ward Round';

  /// Tips for Cross skilling
  static const String tipsForCrossSkillingTitle = 'Quick ICU Training';
  static const String proningGuideTitle = 'Proning';
  static const String alsBlsGuideTitle = 'ALS/BLS Modifications';
  static const String alsBlsGuideInfographicTitle =
      'ALS/BLS Modifications Infographic';
  static const String airwayAssessmentTitle = 'Airway Assessment';
  static const String ventBasicsTitle = 'Ventilator Basics';
  static const String cvsBasicsTitle = 'CVS Basics';
  static const String neuroBasicsTitle = 'Neuro Basics';
  static const String infectionBasicsTitle = 'ID Basics';
  static const String renalBasicsTitle = 'Renal Basics';
  static const String gastroBasicsTitle = 'GIT Basics';

  /// Your Welfare
  static const String yourWelfareTitle = 'Your Welfare';
  static const String yourWelfarePhasesTitle = 'Phases of Pandemic and '
      'suggestions ';

  /// Information
  static const String settingsTitle = 'Privacy';
  static const String settingsPrivacyTitle = 'Report usage & crash data';

  static const String informationTitle = 'Information';
  static const String acknowledgementsTitle = 'Acknowledgements';
  static const String referencesTitle = 'References';
  static const String informationWhCoronaTitle = 'WH Novel Coronavirus Website';
  static const String informationWhAnaestheticTitle =
      'WH Anaesthetic Microsite';
  static const String informationWhIcuTitle = 'WH ICU Microsite';
  static const String informationWhContactsTitle = 'Contact Numbers';
  static const String informationAppFeedbackTitle = 'App Feedback';
  static const String informationAppThirdPartyTitle = 'Third-Party Licenses';
  static const String informationFooter = 'Built with ❤️ by a band of '
      'volunteers';

  /// Resources
  static const String whResourcesTitle = 'WH Resources';
  static const String additionalResourcesTitle = 'Additional Resources';
}
