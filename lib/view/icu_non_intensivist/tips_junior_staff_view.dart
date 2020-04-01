import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../style.dart';

class TipsJuniorStaffView extends StatelessWidget {
  final title = 'Tips for cross-skilling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: AppStyles.appBarIconTheme,
          title: Text(title, style: AppStyles.appBarTextStyle)),
      body: const Center(child: Text('TODO')),
    );
  }
}
