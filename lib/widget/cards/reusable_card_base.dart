import 'package:flutter/material.dart';

class ReusableCardBase extends StatelessWidget {
  /// Description of the card
  final String description;

  /// Color of the card
  final Color color;

  /// Route to view
  final String routeTo;

  /// Constrain size of card
  final BoxConstraints boxConstraints;

  final List<Widget> child;

  /// Elevation of card
  final double elevation;

  /// Fallback instead of route
  final Function fallback;

  /// Vertical Alignment
  final MainAxisAlignment verticalAlignment;

  /// Padding
  final EdgeInsets padding;

  /// Margin
  final EdgeInsets margin;

  /// Border Radius
  final double borderRadius;

  ReusableCardBase({
    this.description,
    this.color = Colors.white,
    this.routeTo,
    this.boxConstraints,
    this.elevation = 4,
    this.borderRadius = 8.00,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(4.0),
    this.fallback,
    @required this.child,
    this.verticalAlignment = MainAxisAlignment.start,
  }) : assert(child.isNotEmpty, 'Child component must be declared');

  @override
  Widget build(BuildContext context) {
    var col = Column(
      mainAxisAlignment: verticalAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: child,
    );
    return Card(
        margin: margin,
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: InkWell(
          child: Ink(
            padding: padding,
            child: boxConstraints == null
                ? col
                : ConstrainedBox(
                    constraints: boxConstraints,
                    child: col,
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
        ));
  }

  @override
  Widget build3(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: margin,
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Padding(
          padding: padding,
          child: Container(
            height: null,
            child: Column(
              mainAxisAlignment: verticalAlignment,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: child,
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
