import 'package:flutter/material.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/home_page.dart';
import 'package:wh_covid19/view/icu_non_intensivist/ventilation/adjuncts_view.dart';
import 'package:wh_covid19/view/icu_non_intensivist/ventilation/initial_actions_view.dart';
import 'package:wh_covid19/view/icu_non_intensivist/ventilation/ventilation_view.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/view/ppe/ppe_view.dart';
import 'package:wh_covid19/view/sbs_guide_view.dart';
import 'package:wh_covid19/view/staff_welfare/staff_welfare_view.dart';

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
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.ppe: (context) => PPEView(),
        Routes.staffWelfare: (context) => StaffWelfareView(),
        Routes.sbsGuidance: (context) => SBSGuideView(),
        Routes.ventilation: (context) => VentilationView(),
        Routes.ventilationInitialActions: (context) => InitialActionsView(),
        Routes.ventilationAdjuncts: (context) => AdjunctsView(),
      },
      onGenerateRoute: (settings) {
        // Use onGenerateRoute to set fullscreenDialog=true
        switch (settings.name) {
          case Routes.info:
            return MaterialPageRoute<InfoView>(
              builder: (context) => InfoView(),
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
