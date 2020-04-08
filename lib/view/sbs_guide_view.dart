import 'package:flutter/material.dart';

import '../strings.dart';
import '../style.dart';
import '../widget/reusable_stepper.dart';

class SBSGuideView extends StatelessWidget {
  final color = const Color.fromRGBO(146, 211, 183, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: Styles.appBarIconTheme,
        title: const Text(
          Strings.ppeStepByStepTitle,
          style: Styles.appBarTextStyle,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ReusableStepper(),
      ),
    );
  }
}
