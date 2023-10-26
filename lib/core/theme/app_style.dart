import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void statusBarDarkStyle() {
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayDarkStyle);
}

void statusBarLightStyle() {
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayLightStyle);
}

SystemUiOverlayStyle get systemUiOverlayDarkStyle {
  return const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}

SystemUiOverlayStyle get systemUiOverlayLightStyle {
  return const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}

void deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
