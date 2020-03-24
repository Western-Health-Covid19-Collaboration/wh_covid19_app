import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/style.dart';

class TipsJuniorStaffView extends StatelessWidget {
  final title = 'Tips for junior staffers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: appBarIconTheme,
          title: Text(title, style: appBarTextStyle)),
      body: Center(child: Text('TODO')),
    );
  }
}
