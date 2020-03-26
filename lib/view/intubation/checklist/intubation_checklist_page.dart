import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../style.dart';
import '../../../widget/zoomable_widget.dart';

class IntubationChecklistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intubation Checklist'),
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
