import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/widget/zoomable_widget.dart';

import '../../../style.dart';

class IntubationChecklistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intubation Checklist'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Container(
              color: AppColors.backgroundGreen,
              child: ZoomableWidget(
                child: Image.asset('assets/images/intubation_checklist.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
