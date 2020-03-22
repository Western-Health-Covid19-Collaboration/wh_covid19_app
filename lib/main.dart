import 'package:flutter/material.dart';
import 'package:wh_covid19/view/home_page.dart';
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
        backgroundColor: Color.fromRGBO(236, 243, 240, 1),
        fontFamily: 'Inter'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/ppe': (context) => PPEView(),
        '/staff_welfare': (context) => StaffWelfareView(),
        '/sbs_guidance': (context) => SBSGuideView(),
      },
    );
  }
}
