import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../models/intubation_guide.dart';
import '../../style.dart';

///
/// Renders a IntubationContent item, which is a data structure
/// consisting of a section title,
/// then list of sections containing icon, title and subtitle.
class IntubationContentViewTemplate extends StatelessWidget {
  final List<Object> flatItems;
  final Color color;

  IntubationContentViewTemplate(
      {Key key,
      IntubationContent content,
      this.color = AppColors.backgroundGreen})
      : flatItems = content.sections
            .expand((e) => [if (e.name != null) e, ...e.items])
            .toList(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListView.builder(
        itemCount: flatItems.length,
        itemBuilder: (context, index) {
          final item = flatItems[index];
          if (item is IntubationItem) {
            return Card(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      children: <Widget>[
                        Text(
                          item.icon,
                          style: Styles.textH4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: Styles.textH4),
                              if (item.subtitle != null) ...[
                                const SizedBox(height: 4),
                                Text(item.subtitle)
                              ],
                            ],
                          ),
                        )
                      ],
                    )));
          } else if (item is IntubationSection) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Text(item.name, style: Styles.textH4));
          } else {
            throw Exception('Invalid IntubationContent item type $item');
          }
        },
      ),
    );
  }
}
