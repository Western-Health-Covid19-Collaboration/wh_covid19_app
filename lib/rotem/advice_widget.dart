import 'package:flutter/material.dart';
import '../widget/all.dart';
import 'constants.dart';
import 'rotem_input.dart';
import 'rotem_results.dart';
import 'data_classes_rotem.dart';

class AdviceWidget extends StatelessWidget {
  AdviceWidget({this.title, this.subtitle, this.list});

  final String title;
  final String subtitle;
  final List list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return SizedBox(height: 0);
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: headerDecoration,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$title', style: kMediumBold),
                  Text('$subtitle', style: kSmaller),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(15, 5, 5, 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text(list[index].toString(), style: kSmaller);
                }),
          ]);
    }
  }
}
