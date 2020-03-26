import 'package:flutter/material.dart';
import 'package:wh_covid19/intro_router.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/hard_data.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/disclaimer_view.dart';
import 'package:wh_covid19/view/home_page.dart';
import 'package:wh_covid19/view/icu_non_intensivist/general_care_view.dart';
import 'package:wh_covid19/view/icu_non_intensivist/tips_junior_staff_view.dart';
import 'package:wh_covid19/view/icu_non_intensivist/ventilation/ventilation_view.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/view/intubation/algorithm/intubation_algorithm_page.dart';
import 'package:wh_covid19/view/intubation/checklist/intubation_checklist_page.dart';
import 'package:wh_covid19/view/intubation/guidance/intubation_guidance_page.dart';
import 'package:wh_covid19/view/ppe/ppe_view.dart';
import 'package:wh_covid19/view/sbs_guide_view.dart';
import 'package:wh_covid19/view/view_templates/html_text_card_view_template.dart';
import 'package:wh_covid19/view/staff_welfare/your_welfare_view.dart';

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
