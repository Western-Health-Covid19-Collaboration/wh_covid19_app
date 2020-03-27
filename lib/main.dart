import 'package:flutter/material.dart';
import 'package:wh_covid19/view/ppe/ppe_off_guidance_1.dart';
import 'package:wh_covid19/view/ppe/ppe_off_guidance_2.dart';
import 'hard_data.dart';
import 'intro_router.dart';
import 'routes.dart';
import 'style.dart';
import 'view/disclaimer_view.dart';
import 'view/home_page.dart';
import 'view/icu_non_intensivist/general_care_view.dart';
import 'view/icu_non_intensivist/tips_junior_staff_view.dart';
import 'view/icu_non_intensivist/ventilation/ventilation_view.dart';
import 'view/info_view.dart';
import 'view/intubation/algorithm/intubation_algorithm_page.dart';
import 'view/intubation/checklist/intubation_checklist_page.dart';
import 'view/intubation/guidance/intubation_guidance_page.dart';
import 'view/ppe/ppe_on_guidance.dart';
import 'view/ppe/ppe_view.dart';
import 'view/sbs_guide_view.dart';
import 'view/staff_welfare/your_welfare_view.dart';
import 'view/view_templates/html_text_card_view_template.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EGBA',
      theme: ThemeData(
        primaryColor: Colors.green,
        backgroundColor: AppColors.appBackground,
        fontFamily: 'Inter',
      ),
      initialRoute: Routes.introRouter,
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.ppe: (context) => PPEView(),
        Routes.ppeOnGuidance: (context) => PPEOnGuidance(),
        Routes.ppeOffGuidance1: (context) => PPEOffGuidance1(),
        Routes.ppeOffGuidance2: (context) => PPEOffGuidance2(),
        Routes.staffWelfare: (context) => YourWelfareView(),
        Routes.sbsGuidance: (context) => SBSGuideView(),
        Routes.ventilation: (context) => VentilationView(),
        Routes.ventilationInitialActions: (context) => _navigateScreenData(
            context, routeToScreenData[Routes.ventilationInitialActions]),
        Routes.ventilationAdjuncts: (context) => _navigateScreenData(
            context, routeToScreenData[Routes.ventilationAdjuncts]),
        Routes.generalCare: (context) => GeneralCareView(),
        Routes.tipsJuniorStaff: (context) => TipsJuniorStaffView(),
        Routes.introRouter: (context) => IntroRouter(),
      },
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
          case Routes.intubationAlgorithm:
            return MaterialPageRoute<IntubationAlgorithmPage>(
              builder: (context) => IntubationAlgorithmPage(),
              fullscreenDialog: false,
            );
          case Routes.intubationChecklist:
            return MaterialPageRoute<IntubationChecklistPage>(
              builder: (context) => IntubationChecklistPage(),
              fullscreenDialog: false,
            );
          case Routes.disclaimer:
            return MaterialPageRoute<DisclaimerView>(
                builder: (context) => DisclaimerView(),
                fullscreenDialog: false);
        }
        // Fallback, won't be called unless an unknown route is called
        return MaterialPageRoute<HomePage>(
          builder: (context) => HomePage(),
          fullscreenDialog: true,
        );
      },
    );
  }

  Widget _navigateScreenData(BuildContext context, HtmlTextScreenData data) {
    return FutureBuilder<String>(
      future: data.readFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HtmlTextCardViewTemplate(
              title: data.title, bgColor: data.bgColor, html: '');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return HtmlTextCardViewTemplate(
              title: data.title, bgColor: data.bgColor, html: snapshot.data);
        }
      },
    );
  }
}
