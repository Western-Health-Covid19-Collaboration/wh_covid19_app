/// Key constants used throughout the app that should never change
class Constants {
  /// Persistent storage strings used to persist data between app sessions
  static const String settingDisclaimerAgreed = 'disclaimer_agreed';
  static const String settingDisclaimerVersion = 'disclaimer_version';
  static const String settingDisclaimerAgreedDateTime =
      'disclaimer_agreed_date_time';

  /// Analytics screen names avoid changing to keep analytics data constant
  /// Even if the UI screen name changes try to keep this as analytics name
  static const String analyticsHomeScreen = 'home';
  static const String analyticsDisclaimerScreen = 'disclaimer';
  static const String analyticsPPEScreen = 'ppe';
  static const String analyticsPPEOnScreen = 'ppeOn';
  static const String analyticsPPEOffMethod1Screen = 'ppeOffMethod1';
  static const String analyticsPPEOffMethod2Screen = 'ppeOffMethod2';
  static const String analyticsPPEOnInfographic = 'ppeOnInfographic';
  static const String analyticsPPEOffMethod1Infographic = 'ppeOffInfographicM'
      'ethod1';
  static const String analyticsPPEOffMethod2Infographic = 'ppeOffInfographicM'
      'ethod2';
  static const String analyticsInformationScreen = 'information';
  static const String analyticsAcknowledgementsScreen = 'acknowledgements';
  static const String analyticsWelfareScreen = 'welfare';
  static const String analyticsIntubationGuideScreen = 'intubationGuide';
  static const String analyticsIntubationGuideInfographic = 'intubationGuideInf'
      'ographic';
  static const String analyticsIntubationChecklistScreen = 'intubationCheckli'
      'st';
  static const String analyticsIntubationChecklistInfographic = 'intubationCh'
      'ecklistInfographic';
  static const String analyticsExtubationGuideScreen = 'extubationGuide';
  static const String analyticsExtubationGuideInfographic = 'extubationGuideIn'
      'fographic';
  static const String analyticsVentilationScreen = 'ventilation';
  static const String analyticsVentilationInfographic = 'ventilationInfograph'
      'ic';
  static const String analyticsDailyRoundScreen = 'dailyRound';
  static const String analyticsCrossSkillingScreen = 'crossSkilling';
  static const String analyticsLicensesScreen = 'licenses';

  static const String analyticsProningGuideScreen = 'proning';
  static const String analyticsAlsBlsGuideScreen = 'alsBls';
}
