import 'package:flutter/material.dart';

import 'intro_router.dart';
import 'routes.dart';
import 'strings.dart';
import 'style.dart';
import 'utils/firebase.dart';
import 'view/airway/checklist/intubation_checklist_infographic_page.dart';
import 'view/airway/checklist/intubation_checklist_page.dart';
import 'view/airway/extubation/extubation_guidance_page.dart';
import 'view/airway/extubation/extubation_infographic_page.dart';
import 'view/airway/guidance/intubation_guidance_infographic_page.dart';
import 'view/airway/guidance/intubation_guidance_page.dart';
import 'view/disclaimer_view.dart';
import 'view/home_page.dart';
import 'view/icu_non_intensivist/als_bls_guide_view.dart';
import 'view/icu_non_intensivist/daily_round/daily_round_view.dart';
import 'view/icu_non_intensivist/proning_guide_view.dart';
import 'view/icu_non_intensivist/tips_junior_staff_view.dart';
import 'view/icu_non_intensivist/ventilation/ventilation_infographic_page.dart';
import 'view/icu_non_intensivist/ventilation/ventilation_view.dart';
import 'view/info_view.dart';
import 'view/license_view.dart';
import 'view/ppe/ppe_off_guidance_method_1.dart';
import 'view/ppe/ppe_off_guidance_method_1_infographic.dart';
import 'view/ppe/ppe_off_guidance_method_2.dart';
import 'view/ppe/ppe_off_guidance_method_2_infographic.dart';
import 'view/ppe/ppe_on_guidance.dart';
import 'view/ppe/ppe_on_infographic_page.dart';
import 'view/ppe/ppe_view.dart';
import 'view/sbs_guide_view.dart';
import 'view/staff_welfare/your_welfare_view.dart';

void main() {
  // Add this, and it should be the first line in main method to ensure no crashes before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Styles.appThemeLight,
      initialRoute: Routes.introRouter,
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
        Routes.introRouter: (context) => IntroRouter(),
        Routes.disclaimer: (context) => DisclaimerView(),
        Routes.licenses: (context) => LicenseView(),
      },
      // Analytics route observer to track PageRoute transitions
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
      onGenerateRoute: (settings) {
        // Use onGenerateRoute to set fullscreenDialog=true
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
        }
        // Fallback, won't be called unless an unknown route is called
        return MaterialPageRoute<HomePage>(
          builder: (context) => HomePage(),
          fullscreenDialog: true,
        );
      },
    );
  }
}
