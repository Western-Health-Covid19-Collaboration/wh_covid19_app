/// Route names are used as Analytics screen names. Avoid changing these to
/// keep analytics data constant in the console. Even if the UI screen name
/// changes try to keep these route names unchanged.
class Routes {
  // App main routes
  static const introRouter = '/';
  static const home = '/home';
  static const info = '/info';
  static const disclaimer = '/disclaimer';

  // PPE routes
  static const ppe = '/ppe';
  static const ppeOnGuidance = '/ppe/on';
  static const ppeOffGuidanceMethod1 = '/ppe/off/method_1';
  static const ppeOffGuidanceMethod2 = '/ppe/off/method_2';
  static const ppeOnInfographic = '/ppe/on/infographic';
  static const ppeOffGuidanceMethod1Infographic =
      '/ppe/off/method_1/infographic';
  static const ppeOffGuidanceMethod2Infographic =
      '/ppe/off/method_2/infographic';
  static const staffWelfare = '/staff_welfare';
  static const sbsGuidance = '/sbs_guidance';

  // Info routes
  static const acknowledgements = '/acknowledgements';
  static const additionalResources = '/additional_resources';
  static const licenses = '/licenses';

  // ICU routes
  static const _icuNonIntensivist = '/icu_non_intensivist';
  static const ventilation = '$_icuNonIntensivist/ventilation';
  static const ventilationAdjuncts = '$ventilation/adjuncts';
  static const ventilationInfographic = '$ventilation/infographic';
  static const generalCare = '$_icuNonIntensivist/general_care';
  static const tipsJuniorStaff = '$_icuNonIntensivist/tips_junior_staff';
  static const proningGuide = '$_icuNonIntensivist/proning';
  static const alsBlsGuide = '$_icuNonIntensivist/als_bls';
  static const alsBlsGuideInfographic =
      '$_icuNonIntensivist/als_bls/infographic';

  // Airway routes
  static const intubationGuidance = '/airway/guidance';
  static const intubationGuidanceInfographic = '/airway/guidance/infographic';
  static const intubationChecklist = '/airway/checklist';
  static const intubationChecklistInfographic = '/airway/checklist/infographic';
  static const extubationGuidance = '/extubation/guidance';
  static const extubationGuidanceInfographic =
      '/extubation/guidance/infographic';
}
