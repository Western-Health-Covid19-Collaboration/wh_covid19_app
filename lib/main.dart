import 'package:flutter/material.dart';
import 'package:wh_covid19/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color.fromRGBO(236, 243, 240, 1),
      ),
      home: HomePage(),
    );
  }
}

