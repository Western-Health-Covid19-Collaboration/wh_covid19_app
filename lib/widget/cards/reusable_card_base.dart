import 'package:flutter/material.dart';
import 'package:wh_covid19/style.dart';

class ReusableCardBase extends StatelessWidget {
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

  final List<Widget> child;

  /// Elevation of card
  final double elevation;

  /// Fallback instead of route
  final Function fallback;

  ReusableCardBase(
      {@required this.title,
      this.description,
      this.color = Colors.white,
      this.routeTo,
      this.height = 84,
      this.elevation = 4,
      this.fallback,
      this.child})
      : assert(title != null, child.isNotEmpty);

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
                ...child
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (routeTo != null) {
          Navigator.pushNamed(context, routeTo);
        } else {
          if (fallback != null) {
            fallback();
          }
        }
      },
    );
  }
}
