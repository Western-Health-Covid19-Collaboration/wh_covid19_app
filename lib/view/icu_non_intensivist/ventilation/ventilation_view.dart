import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/widget/reusable_card.dart';

import '../../../routes.dart';

class VentilationView extends StatelessWidget {
  final title = 'Ventilation';
  final cards = <ReusableCard>[
    ReusableCard(
      title: 'Suggested initial actions',
      color: Colors.white,
      routeTo: Routes.ventilationInitialActions,
    ),
    ReusableCard(
      title: 'Adjuncts',
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: AppColors.backgroundBlue,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards,
        ),
      ),
    );
  }
}
