import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../style.dart';

class InfographicMultiPage extends StatefulWidget {
  // Navigation bar title
  final String title;
  final List<String> imageUrls;
  final Color backgroundColor;
  final Color toolBarColor;

  const InfographicMultiPage({
    this.title,
    this.imageUrls,
    this.backgroundColor,
    this.toolBarColor,
  });

  @override
  _InfographicMultiPageState createState() => _InfographicMultiPageState();
}

class _InfographicMultiPageState extends State<InfographicMultiPage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: widget.toolBarColor,
          iconTheme: Styles.appBarIconTheme,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.title,
              style: Styles.textH5,
            ),
            Text(
              'Page ${_pageIndex + 1} of ${widget.imageUrls.length}',
              style: Styles.textP,
            )
          ]),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        body: PhotoViewGallery(
          scrollPhysics: const BouncingScrollPhysics(),
          pageOptions: widget.imageUrls
              .map((url) => PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(url),
                  initialScale: PhotoViewComputedScale.contained * 0.9,
                  basePosition: Alignment.topCenter * 0.9,
                  minScale: PhotoViewComputedScale.contained * 0.9))
              .toList(),
          scrollDirection: Axis.vertical,
          backgroundDecoration: BoxDecoration(color: widget.backgroundColor),
          onPageChanged: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ));
  }
}
