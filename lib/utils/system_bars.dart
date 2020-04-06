import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// System bars styling is set
/// The AppBar & SliverAppBar widgets will automatically set the status bar
/// brightness when they are rendered. If there is no Nav/AppBar on the first
/// page, then you can get a similar effect using the AnnotatedRegion widget
///
/// If you have an AppBar or SliverAppBar then it will interfere with your
/// calls to SystemChrome.setSystemUIOverlayStyle and you can instead just
/// change the brightness property on your AppBar.
SystemUiOverlayStyle systemBarStyle(BuildContext context) {
  // Copy the default style and then modify key values
  final lightStyle1 = SystemUiOverlayStyle.dark.copyWith(
    // Status bar - iOS and Android
    // statusBarBrightness - Only honored in iOS
    statusBarBrightness: Brightness.light,
    // statusBarColor - Only honored in Android version M (API 23) and greater
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness - Only honored in Android version M (API 23)
    // and greater
    statusBarIconBrightness: Brightness.dark,

    // Navigation bar - All Android only
    // systemNavigationBarColor - Only honored in Android versions O (API 26)
    // and greater
    systemNavigationBarColor: Colors.transparent,
    // systemNavigationBarDividerColor - Only honored in Android versions P
    // (API 28) and greater.
    systemNavigationBarDividerColor: Colors.transparent,
    // systemNavigationBarIconBrightness - Only honored in Android versions O
    // (API 26) and greater
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  return lightStyle1;
}
