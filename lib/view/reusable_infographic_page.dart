import 'package:flutter/material.dart';
import '../style.dart';
import '../widget/platform_icon.dart';
import '../widget/reusable_zoomable_widget.dart';

class InfographicPage extends StatelessWidget {

  // Navigation bar title
  final String title;
  final String imageUrl;
  final Color backgroundColor;
  
  const InfographicPage({this.title, this.imageUrl, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: AppStyles.appBarIconTheme,
        title: Text(
          title,
          style: AppStyles.appBarTextStyle,
          ),
        actions: <Widget>[
          IconButton(
            icon: const PlatformIcon(iconPath: PlatformIcon.shareIconPath)
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: 
        ZoomablePhoto(imageUrl: imageUrl, backgroundColor: backgroundColor)
    );
  }
}