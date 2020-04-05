/// Strings used throughout the app and are not likely to change often
class Strings {
  /// General strings
  static const String appName = 'WHAC19';

  /// Persistent storage strings used to persist data between app sessions
  static const String settingDisclaimerAgreed = 'disclaimer_agreed';
  static const String settingDisclaimerVersion = 'disclaimer_version';
  static const String settingDisclaimerAgreedDateTime = 'disclaimer_agreed_date_time';

  /// Disclaimer strings
  static const String disclaimerTitle = 'Disclaimer and conditions of use';
  // *** WARNING ***
  // When disclaimerBody changes in any way, increment disclaimerVersion by one
  static const String disclaimerBody = '''
This app is designed to be used by Anaesthetic and Critical Care doctors at Western Health who are caring for patients during the COVID-19 Pandemic. The guidelines, protocols and advice within this app are designed to educate staff and suggest recommended management of patients with COVID-19. The recommendations within this application do not indicate an exclusive course of action as the results must be contextualised to the patient at hand and variations may be appropriate.
\nThe authors of this app have made efforts to ensure the information is up to date, but encourage users to confirm the indicated therapy with existing guidelines. The responsibility is on you, the treating physician, to ensure the correct therapy is being used.
\nThe authors accept no responsibility for any information perceived as misleading or the success of any treatment regimen detailed in the guidelines.
\nThe app is made available on the understanding that Western Health, Western Health employees, the designers, developers, testers, reviewers, organisers and all other contributors to the project have have no liability (including liability by reason of negligence) to the users for any loss, damage, cost or expense incurred or arising by reason of any person using or relying on the information and whether caused by reason of any error, negligent act, omission or misinterpretation in the app or otherwise.
\nThe Western Health trademark and app cannot be copied, modified, reproduced, published, uploaded, distributed or posted without the prior written consent of Western Health.
\nYou must agree to accept these terms and conditions before proceeding to use the app.\n\n\n\n\n\n''';
  // *** WARNING ***
  // Increment by one when the disclaimerBody changes. This will force users to accept/re-accept the disclaimer again
  // if they have previously accepted it. If the disclaimer has changed then users need to re-accept it.
  static const String disclaimerCurrentVersion = '1';
  static const String disclaimerButtonAgreeText = 'I Agree';
  static const String disclaimerHaveAgreedText = 'You have agreed to the disclaimer';

  /// Home strings
  static const String homeHeading1 = 'Look After Yourself';
  static const String homeHeading2 = 'Airway';
  static const String homeHeading3 = 'ICU';

  /// PPE
  static const String ppeTitle = 'PPE Technique';
}
