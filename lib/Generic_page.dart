//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'main.dart';
//
//class ROTEMGenericPage extends StatefulWidget {
//  @override
//  _ROTEMGenericPage createState() => _ROTEMGenericPage();
//}
//
//class _ROTEMGenericPage extends State<ROTEMGenericPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text(
//          'Generic Page',
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
//                flex: 1,
//                child: Text(
//                  'Currently under construction',
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              Expanded(
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) {
//                            return ROTEMHomePage();
//                          },
//                        ),
//                      );
//                    });
//                  },
//                  child: Text(
//                    'Press me for home page',
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontSize: 40.0),
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
