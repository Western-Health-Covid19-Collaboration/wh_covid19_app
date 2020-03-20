import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsCard extends StatelessWidget {
  ResultsCard({
    @required this.colour,
    this.iconNormal,
    this.action,
    this.factor,
  });

  final Color colour;
  final Icon iconNormal;
  final String action;
  final String factor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          border: Border.all(color: Colors.black54),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Card(
                child: Text(
                  factor,
                  style: kFastInterpretationResultStyle,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: iconNormal,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                action,
                style: kFastInterpretationResultStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//cardChild,
//margin: EdgeInsets.all(5.0),
//decoration: BoxDecoration(
//color: colour,
//borderRadius: BorderRadius.circular(10.0),
//)
