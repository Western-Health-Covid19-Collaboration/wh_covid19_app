/// Strings used throughout the app and are not likely to change often
class Strings {
  /// General strings
  static const String appName = 'WHAC19';
  static const String toDo = 'TO DO';

  /// Disclaimer strings
  static const String disclaimerTitle = 'Disclaimer & Conditions of Use';
  // *** WARNING ***
  // When disclaimerBody changes in any way, increment disclaimerVersion by one
  static const String disclaimerBody = '''
This app is designed to be used by the anaesthetist and critical care doctors at Western Health who are caring for patients during the COVID-19 pandemic. The guidelines, protocols and advice within this app are designed to educate staff and suggest recommended management of patients with COVID-19. The recommendations within this application do not indicate an exclusive course of action as the results must be contextualised to the patient at hand and variations may be appropriate.
\nThe authors of this app have made efforts to ensure the information is up to date, but encourage users to confirm the indicated therapy with existing guidelines. The responsibility is on you, the treating physician, to ensure the correct therapy is being used.
\nThe authors accept no responsibility for any information perceived as misleading or the success of any treatment regimen detailed in the guidelines.
\nThe app is made available on the understanding that Western Health, Western Health employees, the designers, developers, testers, reviewers, organisers and all other contributors to the project have no liability (including liability by reason of negligence) to the users for any loss, damage, cost or expense incurred or arising by reason of any person using or relying on the information and whether caused by reason of any error, negligent act, omission or misinterpretation in the app or otherwise.
\nThe Western Health trademark and app cannot be copied, modified, reproduced, published, uploaded, distributed or posted without the prior written consent of Western Health.
\nYou must agree to accept these terms and conditions before proceeding to use the app.\n\n\n\n\n\n''';
  // *** WARNING ***
  // Increment by one when the disclaimerBody changes. This will force users to accept/re-accept the disclaimer again
  // if they have previously accepted it. If the disclaimer has changed then users need to re-accept it.
  static const String disclaimerCurrentVersion = '4';
  static const String disclaimerButtonAgreeText = 'I Agree';
  static const String disclaimerHaveAgreedText =
      'You have agreed to the disclaimer';

  /// Home screen strings
  static const String homeHeading1 = 'Staff Welfare';
  static const String homeHeading2 = 'Airway';
  static const String homeHeading3 = 'ICU';
  static const String homeHeading4 = 'Resources';

  /// PPE
  static const String ppeTitle = 'PPE Technique';
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

  /// Your Welfare
  static const String yourWelfareTitle = 'Your Welfare';
  static const String yourWelfarePhasesTitle = 'Phases of Pandemic and '
      'suggestions ';

  /// Information
  static const String settingsTitle = 'Privacy';
  static const String informationTitle = 'Information';
  static const String settingsPrivacyTitle = 'Privacy';
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
