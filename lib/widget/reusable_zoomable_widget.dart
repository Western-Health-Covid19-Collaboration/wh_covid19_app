import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomablePhoto extends StatelessWidget {
  // Image url for the graph
  final String imageUrl;
  final Color backgroundColor;
  final double margin;

  const ZoomablePhoto({this.imageUrl, this.backgroundColor, this.margin = 40});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ClipRect(
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(
                        color: backgroundColor
                      ),
                      imageProvider: AssetImage(imageUrl),
                    ),
                  ),
                  imageProvider: AssetImage(imageUrl),                  
                  customSize: Size(MediaQuery.of(context).size.width - margin, MediaQuery.of(context).size.height - margin),
                  ),
                ),
              )
            ]
          );
    }
}