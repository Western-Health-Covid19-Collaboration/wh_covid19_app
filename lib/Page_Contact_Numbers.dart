import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:visco_elastic_feb_app/Contact_Numbers.dart';

class ContactNumbers extends StatefulWidget {
  @override
  _ContactNumbers createState() => _ContactNumbers();
}

class _ContactNumbers extends State<ContactNumbers> {
  @override

//  //TODO: check whether this works
//  _launchTel() async {
//    const tel = '+61383451488';
//    if (await canLaunch(tel)) {
//      await launch(tel);
//    } else {
//      throw 'Could not launch $tel';
//    }
//  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Important Contact Numbers',
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
            child: ListView(
          children: <ContactsList>[
            ContactsList(
              contact: 'Blood Bank',
              phoneNumber: '51488',
            ),
            ContactsList(
              contact: 'JK Anaesthetist I/C',
              phoneNumber: '53128',
            ),
            ContactsList(
              contact: 'JK Theatre Nurse I/C',
              phoneNumber: '53023',
            ),
            ContactsList(
              contact: 'Sunshine Anaesthetist I/C',
              phoneNumber: '53021',
            ),
          ],
        )),
      ),
    );
  }
}

//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Container(
//                child: Expanded(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Card(
//                        margin: EdgeInsets.symmetric(
//                            vertical: 10.0, horizontal: 20.0),
//                        child: Text(
//                          'Blood Bank',
//                          style: kContactNumberTextStyle,
//                        ),
//                      ),
//                      Divider(),
//                      GestureDetector(
//                        onTap: () {},
//                        child: Card(
//                            margin: EdgeInsets.symmetric(
//                                vertical: 10.0, horizontal: 20.0),
//                            child: Text(
//                              '51488',
//                              style: kContactNumberTextStyle,
//                            )),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                child: Expanded(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(
//                        child: Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            'JK Anaesthetist I/C',
//                            style: kContactNumberTextStyle,
//                          ),
//                        ),
//                      ),
//                      Divider(),
//                      Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            '53128',
//                            style: kContactNumberTextStyle,
//                          )),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                child: Expanded(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(
//                        child: Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            'JK Theatre Nurse in charge',
//                            style: kContactNumberTextStyle,
//                          ),
//                        ),
//                      ),
//                      Divider(),
//                      Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            '53023',
//                            style: kContactNumberTextStyle,
//                          )),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                child: Expanded(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(
//                        child: Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            'Sunshine Anaesthetist I/C',
//                            style: kContactNumberTextStyle,
//                          ),
//                        ),
//                      ),
//                      Divider(),
//                      Card(
//                          margin: EdgeInsets.symmetric(
//                              vertical: 10.0, horizontal: 20.0),
//                          child: Text(
//                            '53021',
//                            style: kContactNumberTextStyle,
//                          )),
//                    ],
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 1,
//                child: Text(
//                  'Page Currently under construction',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                      fontSize: 30.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.redAccent),
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
//                  child: Card(
//                    child: Text(
//                      'Return to Home Page',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(fontSize: 40.0),
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
