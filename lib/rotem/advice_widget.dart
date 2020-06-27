import 'package:flutter/material.dart';
import '../style.dart';

class AdviceWidget extends StatelessWidget {
  const AdviceWidget({this.title, this.subtitle, this.list});

  final String title;
  final String subtitle;
  final List list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return const SizedBox(height: 0);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: Color(0x339E9E9E), //Colors.grey.withAlpha(30)
                border: Border(
                  top: BorderSide(width: 2, color: AppColors.grey50),
                  bottom: BorderSide(width: 0.5, color: AppColors.grey50),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title', style: Styles.textH3),
                Text('$subtitle', style: Styles.textH5),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Text(list[index].toString(), style: Styles.textSemiBold);
              }),
        ],
      );
    }
  }
}
