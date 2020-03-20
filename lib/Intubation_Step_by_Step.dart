//import 'package:flutter/material.dart';
//import 'package:visco_elastic_feb_app/constants.dart';
//import 'question_bank.dart';
//import 'main.dart';
//import 'package:auto_size_text/auto_size_text.dart';
//
//QuestionBank quizBrain = QuestionBank();
//
//class ROTEMalgorithmPage extends StatefulWidget {
//  _ROTEMalgorithmPageState createState() => _ROTEMalgorithmPageState();
//}
//
//class _ROTEMalgorithmPageState extends State<ROTEMalgorithmPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Step-by-Step guide',
//          style: TextStyle(fontSize: 22),
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
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Expanded(
//                flex: 2,
//                child: Card(
//                  elevation: 0,
//                  color: Colors.transparent,
//                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//                  child: Text(
//                    quizBrain.getstep(),
//                    textAlign: TextAlign.center,
//                    style: kHomePageTextStyle,
//                  ),
//                ),
//              ),
//              Divider(),
//              Expanded(
//                flex: 8,
//                child: Card(
//                  elevation: 0,
//                  color: Colors.transparent,
//                  margin:
//                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                  child: AutoSizeText(
//                    quizBrain.getbloodProduct(),
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                      fontSize: 40.0,
//                    ),
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 6,
//                child: Center(
//                  child: AutoSizeText(
//                    quizBrain.getQuestion(),
//                    style: TextStyle(
//                        fontSize: 26.0,
//                        color: Colors.redAccent,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 6,
//                child: Card(
//                  child: Image.asset(
//                    quizBrain.getROTEMimage(),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 2,
//                child: FlatButton(
//                  onPressed: () {
//                    //Choice 1 made by user.
//                    setState(() {
//                      quizBrain.nextQuestionNumber(1);
//                    });
//                  },
//                  color: Colors.blueGrey,
//                  child: Text(
//                    quizBrain.getChoice1(),
//                    style: TextStyle(
//                      fontSize: 20.0,
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 15.0,
//              ),
//              Expanded(
//                flex: 2,
//                child: Visibility(
//                  visible: quizBrain.buttonShouldBeVisible(),
//                  child: FlatButton(
//                    onPressed: () {
//                      setState(() {
//                        quizBrain.nextQuestionNumber(2);
//                      }); //Choice 2 made by user.
//                    },
//                    color: Colors.blueGrey,
//                    child: Text(
//                      quizBrain.getChoice2(),
//                      style: TextStyle(
//                        fontSize: 20.0,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 15.0,
//              ),
//              Container(
//                child: Align(
//                  alignment: Alignment.bottomRight,
//                  child: Visibility(
//                    visible: quizBrain.floatbuttonShouldBeVisible(),
//                    child: FloatingActionButton.extended(
//                      onPressed: () {
//                        setState(() {
//                          quizBrain.previousQuestionNumber();
//                        });
//                      },
//                      label: Text('Restart guide'),
//                      icon: Icon(Icons.navigate_before),
//                      backgroundColor: Colors.blueGrey,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
