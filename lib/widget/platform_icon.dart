import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlatformIcon extends StatelessWidget {
  static const _baseIconPath = 'assets/images/icon/SVG/';

  static const Map<TargetPlatform, String> shareIconPath = { 
    TargetPlatform.iOS: '${_baseIconPath}icon_share_ios.svg', 
    TargetPlatform.android: '${_baseIconPath}icon_share_android.svg'
  };

  final Map<TargetPlatform, String> iconPath;

  const PlatformIcon({this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconPath[defaultTargetPlatform]);
  }
}