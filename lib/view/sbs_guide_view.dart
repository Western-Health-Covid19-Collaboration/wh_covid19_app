import 'package:flutter/material.dart';

import '../styles.dart';
import '../widget/reusable_stepper.dart';

class SBSGuideView extends StatelessWidget {
  final title = 'Step By Step Guidance';
  final color = const Color.fromRGBO(146, 211, 183, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          title,
          style: Styles.appBarTextStyle,
        ),
      ),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: ReusableStepper()),
    );
  }
}
