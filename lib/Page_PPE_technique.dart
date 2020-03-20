import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:photo_view/photo_view.dart';
import 'constants.dart';
import 'Page_Welfare_PPE.dart';
import 'Page_Welfare_Advice.dart';
import 'Page_Putting_ON_PPE.dart';
import 'Page_Taking_OFF_PPE_1.dart';
import 'Page_Taking_OFF_PPE_2.dart';

class PPE_technique_options extends StatefulWidget {
  @override
  _PPE_technique_options createState() => _PPE_technique_options();
}

class _PPE_technique_options extends State<PPE_technique_options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Personal Protective Equipment',
        ),
        backgroundColor: Color(0xFF7BC6DD),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/WHBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PuttingONPPE();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'Putting ON PPE',
                        textAlign: TextAlign.center,
                        style: kHomePageTextStyle,
                      ),
                    ),
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TakingOFFPPE1();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'Taking OFF PPE - Method 1',
                        textAlign: TextAlign.center,
                        style: kHomePageTextStyle,
                      ),
                    ),
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TakingOFFPPE2();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'Taking OFF PPE - Method 2',
                        textAlign: TextAlign.center,
                        style: kHomePageTextStyle,
                      ),
                    ),
                    color: Colors.blueGrey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
