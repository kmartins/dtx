import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [MediaQuery] and [MediaQueryData] using [BuildContext]
///
extension MediaQueryDtx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  EdgeInsets get screenPadding => mediaQuery.padding;

  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double get statusBarHeight => screenPadding.top;

  double get bottomBarHeight => screenPadding.bottom;

  Orientation get orientation => mediaQuery.orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get alwaysUse24HourFormat => mediaQuery.alwaysUse24HourFormat;

  double get screenDensity => mediaQuery.devicePixelRatio;

  Brightness get platformBrightness => mediaQuery.platformBrightness;

  double get textScaleFactor => mediaQuery.textScaleFactor;

  double get shortestScreenSide => screenSize.shortestSide;

  double get longestScreenSide => screenSize.longestSide;

  bool get isSmallPhoneScreen => shortestScreenSide < 360;

  bool get isMediumPhoneScreen =>
      shortestScreenSide < 400 && !isSmallPhoneScreen;

  bool get isLargePhoneScreen =>
      shortestScreenSide < 600 && !isMediumPhoneScreen;

  bool get isSmallTabletScreen =>
      shortestScreenSide < 720 && !isLargePhoneScreen;

  bool get isLargeTabletScreen =>
      shortestScreenSide < 960 && !isSmallTabletScreen;

  /// True if the current device is Phone
  bool get isPhoneScreen =>
      isSmallPhoneScreen || isMediumPhoneScreen || isLargePhoneScreen;

  /// True if the current device is Tablet
  bool get isTabletScreen => isSmallTabletScreen || isLargeTabletScreen;

  /// True if the current device is Desktop
  bool get isDesktopScreen => shortestScreenSide >= 960;

  bool get isXSmallScreen => screenWidth < 600;

  bool get isSmallScreen => screenWidth < 1024 && !isXSmallScreen;

  bool get isMediumScreen => screenWidth < 1440 && !isSmallScreen;

  bool get isLargeScreen => screenWidth < 1920 && !isMediumScreen;

  bool get isXLargeScreen => screenWidth >= 1920;
}
