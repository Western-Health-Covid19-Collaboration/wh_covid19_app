//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:visco_elastic_feb_app/constants.dart';
//import 'main.dart';
//import 'Page_Welfare_Advice.dart';
//import 'Page_Gen_Algorithm.dart';
//import 'resusable_card.dart';
//
//class ROTEMalgorithms extends StatefulWidget {
//  @override
//  _ROTEMalgorithms createState() => _ROTEMalgorithms();
//}
//
//class _ROTEMalgorithms extends State<ROTEMalgorithms> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text(
//          'ROTEM Algorithms',
//        ),
//        backgroundColor: Color(0xFF7BC6DD),
//      ),
//      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('images/WHBackground.png'),
//            fit: BoxFit.cover,
//          ),
//        ),
//        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
//        constraints: BoxConstraints.expand(),
//        child: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Expanded(
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) {
//                            return StaffWelfare();
//                          },
//                        ),
//                      );
//                    });
//                  },
//                  child: Card(
//                    child: Center(
//                      child: Text(
//                        'Obstetrics Algorithm',
//                        textAlign: TextAlign.center,
//                        style: kHomePageTextStyle,
//                      ),
//                    ),
//                    color: Colors.blueGrey,
//                  ),
//                ),
//              ),
//              SizedBox(height: 70.0),
//              Expanded(
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) {
//                            return GeneralAlgorithm();
//                          },
//                        ),
//                      );
//                    });
//                  },
//                  child: Card(
//                    child: Center(
//                      child: Text(
//                        'General Algorithm',
//                        textAlign: TextAlign.center,
//                        style: kHomePageTextStyle,
//                      ),
//                    ),
//                    color: Colors.blueGrey,
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
