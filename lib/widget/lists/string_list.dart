import 'package:flutter/material.dart';
import '../../styles.dart';

class StringList extends StatelessWidget {
  final List<String> items;
  final EdgeInsets padding;

  const StringList(
      {@required this.items,
      this.padding = const EdgeInsets.fromLTRB(20, 0, 20, 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: Padding(
            padding: padding,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items
                    .map((item) => Text(
                          '\u2022 $item',
                          softWrap: true,
                          style: Styles.textP,
                        ))
                    .toList())));
  }
}
