import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/style.dart';

class GeneralCareView extends StatelessWidget {
  final title = 'General Care';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: AppStyles.appBarIconTheme,
          title: Text(title, style: AppStyles.appBarTextStyle)),
      body: Center(child: Text('TODO')),
    );
  }
}
