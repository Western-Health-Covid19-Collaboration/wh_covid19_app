import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ConditionsOfUse extends StatefulWidget {
  @override
  _ConditionsOfUse createState() => _ConditionsOfUse();
}

class _ConditionsOfUse extends State<ConditionsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Conditions of Use & Disclaimer',
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
                flex: 5,
                child: Text(
                  'Disclaimer: The guidelines, protocols and advice within this app are designed to guide Anaesthetists at Western Health in Melbourne, Australia. The recommendations within this do not indicate an exclusive course of action as the results must be contextualised to the patient at hand and variations may be appropriate. The authors of this app have made efforts to ensure the information is up to date, but encourage users to confirm the indicated therapy with existing guidelines. The responsibility is on you, the treating physician, to ensrue the correct therapy is being used.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
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
                    'Click here to Agree and return to home page',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.redAccent),
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
