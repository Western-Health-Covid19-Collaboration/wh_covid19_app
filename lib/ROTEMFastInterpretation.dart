//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'main.dart';
//import 'constants.dart';
//import 'resusable_card.dart';
//import 'Fast_Results_Page.dart';
//import 'Fast_Answer_Button.dart';
//import 'icon_content.dart';
//import 'package:grouped_buttons/grouped_buttons.dart';
//import 'ROTEM_calculator.dart';
//
//enum PatientType {
//  Obstetrics,
//  General,
//  noEntry,
//}
//
//class ROTEMFastInterpretation extends StatefulWidget {
//  @override
//  _ROTEMFastInterpretation createState() => _ROTEMFastInterpretation();
//}
//
//class _ROTEMFastInterpretation extends State<ROTEMFastInterpretation> {
//  PatientType selectedPatientType = PatientType.noEntry;
//  int FIBTEMA5 = 14;
//  String EXTEMA5 = 'null';
//  String EXTEMCT = 'null';
//  String TXA = 'null';
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text(
//          'Complete Steps 1-5 at 5 Minutes',
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
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
//        constraints: BoxConstraints.expand(),
//        child: SafeArea(
//          child: Container(
//            constraints: BoxConstraints.expand(),
//            child: SingleChildScrollView(
//              child: IntrinsicHeight(
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
////1.  Patient Type
//                    Flexible(
//                        child: Container(
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            flex: 1,
//                            child: ReusableCard(
//                              colour: Colors.blueGrey,
//                              cardChild: Text(
//                                '1',
//                                style: kFastInterpretationStepStyle,
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 3,
//                            child: ReusableCard(
//                              onPress: () {
//                                setState(() {
//                                  selectedPatientType = PatientType.Obstetrics;
////                            print('Obstetrics selected');
//                                });
//                              },
//                              colour:
//                                  selectedPatientType == PatientType.Obstetrics
//                                      ? kActiveCardColour
//                                      : kInactiveCardColour,
//                              cardChild: IconContent(
//                                icon: Icons.pregnant_woman,
//                                label: 'OBSTETRICS Patient',
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 3,
//                            child: ReusableCard(
//                              onPress: () {
//                                setState(() {
//                                  selectedPatientType = PatientType.General;
////                            print('General selected');
//                                });
//                              },
//                              colour: selectedPatientType == PatientType.General
//                                  ? kActiveCardColour
//                                  : kInactiveCardColour,
//                              cardChild: IconContent(
//                                icon: Icons.local_hospital,
//                                label: 'GENERAL/TRAUMA Pt',
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    )),
//// 2. FIBTEM A5
//                    Flexible(
//                      child: Container(
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Text(
//                                  '2',
//                                  style: kFastInterpretationStepStyle,
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 6,
//                              // Fibtem A5 card
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Text(
//                                      'FIBTEM A5',
//                                      style: kFastInterpretationTextStyle,
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.baseline,
//                                      textBaseline: TextBaseline.alphabetic,
//                                      children: <Widget>[
//                                        Text(
//                                          FIBTEMA5 == 15
//                                              ? '> 15'
//                                              : FIBTEMA5.toString(),
//                                          style: kFastInterpretationTextStyle,
//                                        ),
//                                        Text(
//                                          'mm',
//                                          style: kFastInterpretationTextStyle,
//                                        )
//                                      ],
//                                    ),
//                                    SliderTheme(
//                                      data: SliderTheme.of(context).copyWith(
//                                        inactiveTrackColor: Color(0xFF8D8E98),
//                                        activeTrackColor: Colors.white,
//                                        thumbColor: Color(0xFFEB1555),
//                                        overlayColor: Color(0x29EB155),
//                                        thumbShape: RoundSliderThumbShape(
//                                            enabledThumbRadius: 15.0),
//                                        overlayShape: RoundSliderOverlayShape(
//                                            overlayRadius: 30.0),
//                                      ),
//                                      child: Slider(
//                                        // The method to double removed
//                                        value: FIBTEMA5.toDouble(),
//                                        min: 0.0,
//                                        max: 15.0,
//                                        onChanged: (double newValue) {
//                                          setState(() {
//                                            FIBTEMA5 = newValue.round();
//                                          });
//                                        },
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
////EXTEM A5
//                    Flexible(
//                      child: Container(
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Text(
//                                  '3',
//                                  style: kFastInterpretationStepStyle,
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 6,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Text(
//                                      'EXTEM A5',
//                                      style: kFastInterpretationTextStyle,
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.baseline,
//                                      textBaseline: TextBaseline.alphabetic,
//                                      children: <Widget>[
//                                        RadioButtonGroup(
//                                          padding: EdgeInsets.all(0.0),
//                                          orientation: GroupedButtonsOrientation
//                                              .HORIZONTAL,
//                                          margin: EdgeInsets.symmetric(
//                                              horizontal: 0.0),
//                                          activeColor: Color(0xFFEB1555),
//                                          labels: <String>[
//                                            '<25mm  ',
//                                            '25-35mm',
//                                            '  >35mm',
//                                          ],
//                                          labelStyle: TextStyle(fontSize: 18.0),
//                                          onSelected: (String selected) {
//                                            setState(() {
//                                              EXTEMA5 = selected;
//                                            });
//                                            print(selected);
//                                          },
//                                        )
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//// EXTEM CT card
//                    Flexible(
//                      child: Container(
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Text(
//                                  '4',
//                                  style: kFastInterpretationStepStyle,
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 6,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Text(
//                                      'EXTEM CT',
//                                      style: kFastInterpretationTextStyle,
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.baseline,
//                                      textBaseline: TextBaseline.alphabetic,
//                                      children: <Widget>[
//                                        RadioButtonGroup(
//                                          orientation: GroupedButtonsOrientation
//                                              .HORIZONTAL,
//                                          margin: EdgeInsets.symmetric(
//                                              horizontal: 0.0),
//                                          activeColor: Color(0xFFEB1555),
//                                          labels: <String>[
//                                            "<80s  ",
//                                            "80-140s",
//                                            "  >140s"
//                                          ],
//                                          labelStyle: TextStyle(fontSize: 18.0),
//                                          onSelected: (String selected) {
//                                            setState(() {
//                                              EXTEMCT = selected;
//                                            });
//                                            print(selected);
//                                          },
//                                        )
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
////Fibrinolysis
//                    Flexible(
//                      child: Container(
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Text(
//                                  '5',
//                                  style: kFastInterpretationStepStyle,
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 6,
//                              child: ReusableCard(
//                                colour: Colors.blueGrey,
//                                cardChild: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Text(
//                                      'Is there a risk of fibrinolysis?',
//                                      style: kFastInterpretationTextStyle,
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      crossAxisAlignment:
//                                          CrossAxisAlignment.baseline,
//                                      textBaseline: TextBaseline.alphabetic,
//                                      children: <Widget>[
//                                        RadioButtonGroup(
//                                            orientation:
//                                                GroupedButtonsOrientation
//                                                    .HORIZONTAL,
//                                            margin: EdgeInsets.symmetric(
//                                                horizontal: 0.0),
//                                            activeColor: Color(0xFFEB1555),
//                                            labels: <String>[
//                                              "Yes",
//                                              "No",
////                                      "Unsure",
//                                              "  TXA given",
//                                            ],
//                                            labelStyle:
//                                                TextStyle(fontSize: 18.0),
//                                            onSelected: (String selected) {
//                                              setState(() {
//                                                TXA = selected;
//                                              });
//                                              print(selected);
//                                            })
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Flexible(
//                      child: FastAnswerButton(
//                        buttonTitle: 'CALCULATE',
//                        onTap: () {
//                          ROTEMCalc calc = ROTEMCalc(
//                            FIBTEMA5: FIBTEMA5,
//                            EXTEMA5: EXTEMA5,
//                            EXTEMCT: EXTEMCT,
//                            TXA: TXA,
//                            selectedPatientType: selectedPatientType,
//                          );
//
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => FastResultsPage(
//                                fibResult: calc.actionFIBTEMA5(),
//                                iconFIBTEMA5: calc.defineIconFibTemA5(),
//                                extemA5Result: calc.actionEXTEMA5(),
//                                iconEXTEMA5: calc.defineIconEXTEMA5(),
//                                extemCTResult: calc.actionEXTEMCT(),
//                                iconEXTEMCT: calc.defineIconEXTEMCT(),
//                                txaResult: calc.actionTXA(),
//                                iconTXA: calc.defineIconTXA(),
//                              ),
//                            ),
//                          );
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
