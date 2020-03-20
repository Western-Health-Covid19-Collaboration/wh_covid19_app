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
import 'Page_Ventilation_strategy.dart';
import 'Page_Ventilation_troubleshoot.dart';
import 'Page_ICU_Tips.dart';

class Ventilation extends StatefulWidget {
  @override
  _Ventilation createState() => _Ventilation();
}

class _Ventilation extends State<Ventilation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Ventilation Strategies and ICU tips',
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
                            return Ventilation_strategy();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'Ventilation Strategy',
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
                            return Ventilation_troubleshooting();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'Ventilation troubleshoot',
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
                            return ICU_tips();
                          },
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        'ICU tips',
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
