import 'package:flutter/material.dart';

import 'intro_router.dart';
import 'routes.dart';
import 'strings.dart';
import 'style.dart';
import 'utils/firebase.dart';
import 'view/acknowledgements_view.dart';
import 'view/airway/checklist/intubation_checklist_infographic_page.dart';
import 'view/airway/checklist/intubation_checklist_page.dart';
import 'view/airway/extubation/extubation_guidance_page.dart';
import 'view/airway/extubation/extubation_infographic_page.dart';
import 'view/airway/guidance/intubation_guidance_infographic_page.dart';
import 'view/airway/guidance/intubation_guidance_page.dart';
import 'view/disclaimer_view.dart';
import 'view/home_page.dart';
import 'view/icu_non_intensivist/als_bls_guide_infographic.dart';
import 'view/icu_non_intensivist/als_bls_guide_view.dart';
import 'view/icu_non_intensivist/daily_round/daily_round_view.dart';
import 'view/icu_non_intensivist/proning_guide_view.dart';
import 'view/icu_non_intensivist/tips_junior_staff_view.dart';
import 'view/icu_non_intensivist/ventilation/ventilation_infographic_page.dart';
import 'view/icu_non_intensivist/ventilation/ventilation_view.dart';
import 'view/icu_non_intensivist/airway_assessment_guide_view.dart';
import 'view/icu_non_intensivist/ventilator_basics_guide_view.dart';
import 'view/icu_non_intensivist/cvs_basics_guide_view.dart';
import 'view/icu_non_intensivist/neuro_basics_guide_view.dart';
import 'view/icu_non_intensivist/id_basics_guide_view.dart';
import 'view/icu_non_intensivist/renal_basics_guide_view.dart';
import 'view/icu_non_intensivist/git_basics_guide_view.dart';
import 'view/info_view.dart';
import 'view/license_view.dart';
import 'view/ppe/ppe_off_guidance_method_1.dart';
import 'view/ppe/ppe_off_guidance_method_1_infographic.dart';
import 'view/ppe/ppe_off_guidance_method_2.dart';
import 'view/ppe/ppe_off_guidance_method_2_infographic.dart';
import 'view/ppe/ppe_on_guidance.dart';
import 'view/ppe/ppe_on_infographic_page.dart';
import 'view/ppe/ppe_view.dart';
import 'view/reference_view.dart';
import 'view/resources/additional_resources_view.dart';
import 'view/resources/wh_resources_view.dart';
import 'view/sbs_guide_view.dart';
import 'view/staff_welfare/your_welfare_view.dart';

class WHApp extends StatelessWidget {
  const WHApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Styles.appThemeLight,
      initialRoute: Routes.introRouter,
      // Routes should be in routes or onGenerateRoute not both
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.ppe: (context) => PPEView(),
        Routes.ppeOnGuidance: (context) => PPEOnGuidance(),
        Routes.ppeOffGuidanceMethod1: (context) => PPEOffGuidanceMethod1(),
        Routes.ppeOffGuidanceMethod2: (context) => PPEOffGuidanceMethod2(),
        Routes.staffWelfare: (context) => YourWelfareView(),
        Routes.sbsGuidance: (context) => SBSGuideView(),
        Routes.ventilation: (context) => VentilationView(),
        Routes.generalCare: (context) => ICUDailyRoundView(),
        Routes.tipsJuniorStaff: (context) => TipsJuniorStaffView(),
        Routes.proningGuide: (context) => ProningGuideView(),
        Routes.alsBlsGuide: (context) => AlsBlsGuideView(),
        Routes.airwayAssessment: (context) => AirwayAssessmentView(),
        Routes.ventBasics: (context) => VentBasicsView(),
        Routes.cvsBasics: (context) => CVSBasicsView(),
        Routes.neuroBasics: (context) => NeuroBasicsView(),
        Routes.infectionBasics: (context) => InfectionBasicsView(),
        Routes.renalBasics: (context) => RenalBasicsView(),
        Routes.gastroBasics: (context) => GastroBasicsView(),
        Routes.introRouter: (context) => IntroRouter(),
        Routes.disclaimer: (context) => DisclaimerView(),
        Routes.licenses: (context) => LicenseView(),
        Routes.acknowledgements: (context) => AcknowledgementsView(),
        Routes.references: (context) => ReferenceView(),
        Routes.additionalResources: (context) => AdditionalResourcesView(),
        Routes.whResources: (context) => WHResourcesView()
      },
      // Analytics route observer to track PageRoute transitions
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
      // Use onGenerateRoute to set fullscreenDialog=true for routes
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.info:
            return MaterialPageRoute<InfoView>(
              builder: (context) => InfoView(),
              fullscreenDialog: true,
            );
          case Routes.intubationGuidance:
            return MaterialPageRoute<IntubationGuidancePage>(
              builder: (context) => IntubationGuidancePage(),
              fullscreenDialog: false,
            );
          case Routes.extubationGuidance:
            return MaterialPageRoute<void>(
              builder: (context) => ExtubationGuidancePage(),
              fullscreenDialog: false,
            );
          case Routes.extubationGuidanceInfographic:
            return MaterialPageRoute<void>(
              builder: (context) => ExtubationInfographicPage(),
              fullscreenDialog: false,
            );
          case Routes.intubationChecklist:
            return MaterialPageRoute<IntubationChecklistPage>(
              builder: (context) => IntubationChecklistPage(),
              fullscreenDialog: false,
            );
          case Routes.ppeOnInfographic:
            return MaterialPageRoute<InfoView>(
              builder: (context) => PPEOnInfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.ppeOffGuidanceMethod1Infographic:
            return MaterialPageRoute<InfoView>(
              builder: (context) => PPEOffMethod1InfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.ppeOffGuidanceMethod2Infographic:
            return MaterialPageRoute<InfoView>(
              builder: (context) => PPEOffMethod2InfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.intubationGuidanceInfographic:
            return MaterialPageRoute<InfoView>(
              builder: (context) => IntubationGuidanceInfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.intubationChecklistInfographic:
            return MaterialPageRoute<InfoView>(
              builder: (context) => IntubationChecklistInfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.ventilationInfographic:
            return MaterialPageRoute<void>(
              builder: (context) => VentilationInfographicPage(),
              fullscreenDialog: true,
            );
          case Routes.alsBlsGuideInfographic:
            return MaterialPageRoute<void>(
              builder: (context) => ALSGuideInfographicPage(),
              fullscreenDialog: true,
            );
          // Fallback, won't be called unless an unknown route is called
          default:
            return MaterialPageRoute<HomePage>(
              builder: (context) => HomePage(),
              fullscreenDialog: true,
            );
        }
      },
    );
  }
}
