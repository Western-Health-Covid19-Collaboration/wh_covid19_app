import 'package:flutter/material.dart';
import 'package:wh_covid19/view/home_page.dart';
import 'package:wh_covid19/view/ppe_technique_view.dart';
import 'package:wh_covid19/view/sbs_guide_view.dart';
import 'package:wh_covid19/view/your_welfare_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EGBA',
      theme: ThemeData(
        primaryColor: Colors.green,
        backgroundColor: Color.fromRGBO(236, 243, 240, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/ppe_technique': (context) => PPETechniqueView(),
        '/your_welfare': (context) => YourWelfareView(),
        '/sbs_guidance': (context) => SBSGuideView(),
      },
    );
  }
}
