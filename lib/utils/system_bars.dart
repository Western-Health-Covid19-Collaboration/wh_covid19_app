import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// System bars styling is set
// The AppBar & SliverAppBar widgets will automatically set the status bar
// brightness when they are rendered. If there is no Nav/AppBar on the first
// page, then you can get a similar effect using the AnnotatedRegion widget
//
// If you have an AppBar or SliverAppBar then it will interfere with your
// calls to SystemChrome.setSystemUIOverlayStyle and you can instead just
// change the brightness property on your AppBar.
SystemUiOverlayStyle systemBarStyle(BuildContext context) {
  // Copy the default style and then modify key values
  final lightStyle1 = SystemUiOverlayStyle.dark.copyWith(
    // Status bar - iOS and Android
    statusBarBrightness: Brightness.light, // iOS only
    statusBarColor: Colors.transparent, // Android v6 and above
    statusBarIconBrightness: Brightness.dark, // Android v6 and above

    // Navigation bar - All Android only
    systemNavigationBarColor: Colors.transparent, // Android v8 and above
    systemNavigationBarDividerColor: Colors.transparent, // Android v9 and above
    systemNavigationBarIconBrightness: Brightness.dark, // Android v8 and above
  );

  return lightStyle1;
}
