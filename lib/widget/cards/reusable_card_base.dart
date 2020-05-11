import 'package:flutter/material.dart';

import '../../utils/url_utils.dart';

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
    final col = Column(
      mainAxisAlignment: verticalAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: child,
    );
    void Function() onTap;
    if (routeTo != null) {
      onTap = () {
        if (routeTo.startsWith('http')) {
          UrlUtils.launchWithBrowser(routeTo);
        } else {
          Navigator.pushNamed(context, routeTo);
        }
      };
    } else if (fallback != null) {
      onTap = () => fallback();
    }
    return Card(
      margin: margin,
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: padding,
          child: boxConstraints == null
              ? col
              : ConstrainedBox(
                  constraints: boxConstraints,
                  child: col,
                ),
        ),
      ),
    );
  }
}
