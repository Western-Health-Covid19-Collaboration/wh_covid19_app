import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style.dart';
import '../widget/reusable_zoomable_widget.dart';

class InfographicPage extends StatelessWidget {

  // Navigation bar title
  final String title;
  final String imageUrl;
  final Color backgroundColor;
  final bool _isAndroid = Platform.isAndroid;
  
  InfographicPage({this.title, this.imageUrl, this.backgroundColor});

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
            icon: _isAndroid ? SvgPicture.asset(
              'assets/images/icon/SVG/icon_share_android.svg',
            ) : SvgPicture.asset(
              'assets/images/icon/SVG/icon_share_ios.svg',
            ),
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