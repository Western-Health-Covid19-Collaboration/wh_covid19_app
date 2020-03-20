import 'package:flutter/material.dart';
import 'ROTEMFastInterpretation.dart';
import 'constants.dart';
import 'resusable_card.dart';
import 'Fast_Answer_Button.dart';
import 'Results_Card.dart';
import 'ROTEM_calculator.dart';
import 'package:auto_size_text/auto_size_text.dart';

//TODO: create Fast results answers list as per WHROTEMv2 style

//TODO: create new reusable card with 2 rows for treatment.

class FastResultsPage extends StatelessWidget {
  FastResultsPage(
      {@required this.fibResult,
      @required this.iconFIBTEMA5,
      @required this.iconEXTEMA5,
      @required this.extemA5Result,
      @required this.iconEXTEMCT,
      @required this.extemCTResult,
      @required this.txaResult,
      @required this.iconTXA});

  final String fibResult;
  final Icon iconFIBTEMA5;
  final String extemA5Result;
  final Icon iconEXTEMA5;
  final String extemCTResult;
  final Icon iconEXTEMCT;
  final String txaResult;
  final Icon iconTXA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Western Health ROTEM Interpretation',
          style: TextStyle(fontSize: 16),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Card(
                          color: Colors.blueGrey[400],
                          child: Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              'TREATMENT',
                              style: kFastInterpretationTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Card(
                            child: Container(
                              constraints: BoxConstraints.expand(),
                              color: Colors.blueGrey[400],
                              child: Icon(
                                Icons.traffic,
                                size: 60.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Card(
                          color: Colors.blueGrey[400],
                          child: Align(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              'SUGGESTED INTERVENTIONS',
                              style: kFastInterpretationTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResultsCard(
                colour: Colors.blueGrey,
                iconNormal: iconFIBTEMA5,
                factor: 'Fibrinogen',
                action: fibResult,
              ),
              ResultsCard(
                colour: Colors.blueGrey,
                iconNormal: iconEXTEMA5,
                factor: 'Platelets',
                action: extemA5Result,
              ),
              ResultsCard(
                colour: Colors.blueGrey,
                iconNormal: iconEXTEMCT,
                factor: 'Clotting factors',
                action: extemCTResult,
              ),
              ResultsCard(
                colour: Colors.blueGrey,
                iconNormal: iconTXA,
                factor: 'Tranexamic Acid',
                action: txaResult,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                      'Exclude Obstetric/Surgical cause. Avoid hypothermia, hypocalcaemia, acidosis, severe anaemia.',
                      style: kFastInterpretationTextStyle),
                  color: Colors.yellow,
                ),
              ),
              FastAnswerButton(
                buttonTitle: 'RE-INTERPRET ROTEM',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
