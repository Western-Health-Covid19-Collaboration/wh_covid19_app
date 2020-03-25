class Routes {
  static const home = '/';
  static const ppe = '/ppe';
  static const staffWelfare = '/staff_welfare';
  static const sbsGuidance = '/sbs_guidance';
  static const info = '/info';
  static const disclaimer = '/disclaimer';
  static const introRouter = '/intro_router';

  static const _icuNonIntensivist = '/icu_non_intensivist';
  static const ventilation = '$_icuNonIntensivist/ventilation';
  static const ventilationInitialActions = '$ventilation/initial_actions';
  static const ventilationAdjuncts = '$ventilation/adjuncts';
  static const generalCare = '$_icuNonIntensivist/general_care';
  static const tipsJuniorStaff = '$_icuNonIntensivist/tips_junior_staff';

  static const intubationGuidance = '/intubation/guidance';
  static const intubationChecklist = '/intubation/checklist';
  static const intubationAlgorithm = '/intubation/algorithm';

}
