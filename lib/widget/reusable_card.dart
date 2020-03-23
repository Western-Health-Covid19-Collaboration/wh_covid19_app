import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';

class ReusableCard extends StatelessWidget {
  /// Title of the card
  final String title;

  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  /// Route to view
  final String routeTo;

  /// Height of card
  final double height;

  /// Elevation of card
  final double elevation;

  ReusableCard({@required this.title, this.description, this.color = Colors
      .white, this.routeTo, this.height = 84, this.elevation = 4})
      : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        //margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: height,
            child: Column(
              mainAxisAlignment: description == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: AppStyles.cardTitleTextStyle,
                ),
                description != null ? Text(
                  description,
                  style: AppStyles.cardDescriptionTextStyle,
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if(routeTo != null) {
          Navigator.pushNamed(context, routeTo);
        }
      },
    );
  }
}
