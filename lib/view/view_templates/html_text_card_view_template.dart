import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../style.dart';

///Renders html text in a card
class HtmlTextCardViewTemplate extends StatelessWidget {
  final String title;
  final String html;
  final Color bgColor;
  const HtmlTextCardViewTemplate({this.title, this.bgColor, this.html});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor ?? AppColors.backgroundBlue,
        appBar: AppBar(
            backgroundColor: AppColors.appBarBackground,
            iconTheme: Styles.appBarIconTheme,
            title: Text(title, style: Styles.appBarTextStyle)),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                    child: HtmlWidget(html,
                        textStyle: Styles.cardDescriptionTextStyle,
                        bodyPadding: const EdgeInsets.all(6))))));
  }
}
