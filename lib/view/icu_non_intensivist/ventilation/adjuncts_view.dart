import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wh_covid19/view/view_templates/html_text_card_view_template.dart';

import '../../../static_data_repo.dart';
import '../../../style.dart';

class AdjunctsView extends StatelessWidget {
  final title = 'Adjuncts';
  final kHtml = StaticDataRepo.icu_ventilation_adjuncts_content;
  @override
  Widget build(BuildContext context) => HtmlTextCardViewTemplate(
      title: title, bgColor: AppColors.backgroundBlue, html: kHtml);
}
