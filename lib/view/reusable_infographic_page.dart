import 'package:flutter/material.dart';
import '../style.dart';
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
        title: Text(
          title,
          style: AppStyles.appBarTextStyle,
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adb),
          ),
        ],
      ),
      body: 
        ZoomablePhoto(imageUrl: imageUrl, backgroundColor: backgroundColor)
    );
  }
}