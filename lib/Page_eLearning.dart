import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class eLearning extends StatefulWidget {
  @override
  _eLearning createState() => _eLearning();
}

class _eLearning extends State<eLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'e-Learning',
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
                flex: 1,
                child: Text(
                  'Currently under construction',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
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
                            return ROTEMHomePage();
                          },
                        ),
                      );
                    });
                  },
                  child: Text(
                    'Press for home page',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40.0),
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
