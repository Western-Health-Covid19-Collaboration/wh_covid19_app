import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomablePhoto extends StatelessWidget {
  // Image url for the graph
  final String imageUrl;
  final Color backgroundColor;
  final double padding;

  const ZoomablePhoto({this.imageUrl, this.backgroundColor, this.padding = 20});

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
                  customSize: _getInitialZoomableImageSize(context, padding),
                  basePosition: Alignment.topCenter,
                ),
              ),
            )
          ]
        ),
    );
  }

  ////Get the context size minus padding
  static Size _getInitialZoomableImageSize(BuildContext context, double padding) {
    return Size(MediaQuery.of(context).size.width - padding * 2, MediaQuery.of(context).size.height - padding * 2);
  }
}