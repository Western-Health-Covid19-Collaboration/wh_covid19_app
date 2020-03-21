import 'package:flutter/material.dart';
import 'package:wh_covid19/view/view_templates/image_view_template.dart';
import 'package:wh_covid19/view/view_templates/list_view_template.dart';

class ReusableCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  ReusableCard({this.title, this.description, this.color = Colors.white})
      : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
        color: color,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ListViewTemplate(card: this, cards: <ReusableCard>[
                      ReusableCard(
                        title: "Test",
                        description: "Test",
                      ),
                      ReusableCard(
                        title: "Test1",
                        description: "Test1",
                      ),
                      ReusableCard(
                        title: "Test2",
                        description: "Test2",
                      )
                    ])));
      },
    );
  }
}
