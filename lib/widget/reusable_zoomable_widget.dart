import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomablePhoto extends StatelessWidget {
  // Image url for the graph
  final String imageUrl;
  final Color backgroundColor;

  const ZoomablePhoto({this.imageUrl, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PhotoView(
              backgroundDecoration: BoxDecoration(color: backgroundColor),
              imageProvider: AssetImage(imageUrl),
              initialScale: PhotoViewComputedScale.contained * 0.9,
              basePosition: Alignment.topCenter * 0.9,
            ),
          )
        ]);
  }
}
