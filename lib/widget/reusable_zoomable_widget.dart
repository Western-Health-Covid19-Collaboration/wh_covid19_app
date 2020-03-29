import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomablePhoto extends StatelessWidget {
  // Image url for the graph
  final String imageUrl;
  final Color backgroundColor;
  final double margin;

  const ZoomablePhoto({this.imageUrl, this.backgroundColor, this.margin = 20});

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRect(
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: backgroundColor
                  ),
                  imageProvider: AssetImage(imageUrl),
                  customSize: Size(MediaQuery.of(context).size.width - margin * 2, MediaQuery.of(context).size.height - margin * 2),
                  basePosition: Alignment.topCenter,
                ),
              ),
            )
          ]
        ),
    );
  }
}