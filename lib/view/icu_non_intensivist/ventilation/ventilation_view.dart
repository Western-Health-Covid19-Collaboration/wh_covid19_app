import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../routes.dart';
import '../../../styles.dart';
import '../../../widget/reusable_card.dart';

class VentilationView extends StatelessWidget {
  final title = 'Ventilation';
  static const cards = <ReusableCard>[
    ReusableCard(
      title: 'Suggested initial actions',
      color: Colors.white,
      routeTo: Routes.ventilationInitialActions,
    ),
    ReusableCard(
      title: 'Adjuncts',
      color: Colors.white,
      routeTo: Routes.ventilationAdjuncts,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          iconTheme: Styles.appBarIconTheme,
          title: Text(title, style: Styles.appBarTextStyle)),
      body: Container(
        color: AppColors.backgroundBlue,
        padding: const EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: cards),
      ),
    );
  }
}
