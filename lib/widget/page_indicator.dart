import 'dart:math';

import 'package:flutter/material.dart';

class DotsPageIndicator extends AnimatedWidget {
  const DotsPageIndicator({
    this.controller,
    this.itemCount,
    this.color = Colors.grey, // changed from old syntax of : to =
  }) : super(listenable: controller);

  // the PageController that this DotsIndicator is representing.
  final PageController controller;

  // number of items managed by the PageController
  final int itemCount;

  // color of dots defaults above
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.4;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    final currentPage = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    final zoom = 1.0 + (_kMaxZoom - 1.0) * currentPage;

    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
