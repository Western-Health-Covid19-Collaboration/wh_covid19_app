//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:visco_elastic_feb_app/constants.dart';
//import 'main.dart';
//import 'Page_Welfare_Advice.dart';
//import 'Page_Gen_Algorithm.dart';
//import 'resusable_card.dart';
//import 'Page_FCpng.dart';
//import 'Page_FCreconpng.dart';
//
//class FCdosing extends StatefulWidget {
//  @override
//  _FCdosing createState() => _FCdosing();
//}
//
//class _FCdosing extends State<FCdosing> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text(
//          'Fibrinogen Concentrate',
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
//                            return FCpng();
//                          },
//                        ),
//                      );
//                    });
//                  },
//                  child: Card(
//                    child: Center(
//                      child: Text(
//                        'Fibrinogen concentrate dosing',
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
//                            return FCreconpng();
//                          },
//                        ),
//                      );
//                    });
//                  },
//                  child: Card(
//                    child: Center(
//                      child: Text(
//                        'Fibrinogen concentrate reconstitution',
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
