import 'package:flutter/material.dart';

import '../style.dart';
import '../widget/reusable_zoomable_widget.dart';

class InfographicPage extends StatelessWidget {
  // Navigation bar title
  final String title;
  final String imageUrl;
  final Color backgroundColor;
  final Color toolBarColor;

  const InfographicPage({
    this.title,
    this.imageUrl,
    this.backgroundColor,
    this.toolBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        // Warning brightness interacts with SystemUiOverlayStyle
        // See system_bars.dart comments
        brightness: Brightness.light,
        backgroundColor: toolBarColor,
        iconTheme: Styles.appBarIconTheme,
        title: Text(
          title,
          style: Styles.textH5,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: ZoomablePhoto(
        imageUrl: imageUrl,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
