class Routes {
  static const home = '/home';

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
  static const info = '/info';
  static const disclaimer = '/disclaimer';
  static const licenses = '/licenses';
  static const introRouter = '/';

  static const _icuNonIntensivist = '/icu_non_intensivist';
  static const ventilation = '$_icuNonIntensivist/ventilation';
  static const ventilationAdjuncts = '$ventilation/adjuncts';
  static const ventilationInfographic = '$ventilation/infographic';
  static const generalCare = '$_icuNonIntensivist/general_care';
  static const tipsJuniorStaff = '$_icuNonIntensivist/tips_junior_staff';
  static const proningGuide = '$_icuNonIntensivist/proning';

  static const intubationGuidance = '/airway/guidance';
  static const intubationGuidanceInfographic = '/airway/guidance/infographic';
  static const intubationChecklist = '/airway/checklist';
  static const intubationChecklistInfographic = '/airway/checklist/infographic';
  static const extubationGuidance = '/extubation/guidance';
  static const extubationGuidanceInfographic =
      '/extubation/guidance/infographic';
}
