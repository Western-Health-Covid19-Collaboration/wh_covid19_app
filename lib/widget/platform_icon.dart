import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconPaths {
  static const _baseIconPath = 'assets/images/icon/SVG/';
  static String get sharePath => _shareIconPath[defaultTargetPlatform];

  static const Map<TargetPlatform, String> _shareIconPath = { 
    TargetPlatform.iOS: '${_baseIconPath}icon_share_ios.svg', 
    TargetPlatform.android: '${_baseIconPath}icon_share_android.svg'
  };
}

class PlatformIcon extends StatelessWidget {
  final String iconPath;

  const PlatformIcon({this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath);
  }
}