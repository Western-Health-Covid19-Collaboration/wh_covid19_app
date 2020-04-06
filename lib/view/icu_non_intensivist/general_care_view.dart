import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../style.dart';

class GeneralCareView extends StatelessWidget {
  final title = 'Daily Round';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: AppColors.appBarBackground,
        iconTheme: Styles.appBarIconTheme,
        title: Text(title, style: Styles.appBarTextStyle),
      ),
      body: const Center(child: Text('TODO')),
    );
  }
}
