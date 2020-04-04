import 'package:flutter/material.dart';

import '../../models/ventilation_guide.dart';
import '../../style.dart';
import '../../widget/lists/ventilation_guide_card.dart';

class VentilationGuideContainer extends StatelessWidget {
  final List<VentiliationGuideSection> guide;

  const VentilationGuideContainer({this.guide});

  List<Widget> renderList() {
    return guide
        .map((e) => VentilationGuideCard(
              sectionItem: e,
              backgroundColor: AppColors.appBackground,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blue500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView(
            children: [
              Container(padding: const EdgeInsetsDirectional.only(top: 10)),
              ...renderList(),
              Container(padding: const EdgeInsetsDirectional.only(bottom: 10)),
            ],
          ),
        ));
  }
}
