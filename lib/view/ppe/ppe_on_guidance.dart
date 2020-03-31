import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../hard_data.dart';
import '../../style.dart';
import '../../widget/ppe_card_container.dart';

class PPEOnGuidance extends StatelessWidget {
  final title = 'Step By Step Guide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.green500,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: AppStyles.appBarIconTheme,
          title: Text(
            title,
            style: AppStyles.textH5,
          ),
        ),
        body: ListView(
          children: const <Widget>[
            PPECardContainer(
                steps: ppeOnSteps, backgroundColor: AppColors.green50)
          ],
        ));
  }
}
