import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [MediaQuery] and [MediaQueryData] using [BuildContext].
///
/// The screen size is based on the material design.
/// https://material.io/design/layout/responsive-layout-grid.html
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

  @Deprecated('Use isPhoneScreen instead.')
  bool get isSmallPhoneScreen => shortestScreenSide < 360;

  @Deprecated('Use isPhoneScreen instead.')
  bool get isMediumPhoneScreen =>
      shortestScreenSide < 400 && !isSmallPhoneScreen;

  @Deprecated('Use isPhoneScreen instead.')
  bool get isLargePhoneScreen =>
      shortestScreenSide < 600 && !isMediumPhoneScreen;

  @Deprecated('Use isTabletScreen instead.')
  bool get isSmallTabletScreen =>
      shortestScreenSide < 720 && !isLargePhoneScreen;

  @Deprecated('Use isTabletScreen instead.')
  bool get isLargeTabletScreen =>
      shortestScreenSide < 960 && !isSmallTabletScreen;

  /// True if the current device is Phone Screen
  bool get isPhoneScreen => shortestScreenSide < 600;

  /// True if the current device is Tablet Screen
  bool get isTabletScreen => shortestScreenSide < 1240 && !isPhoneScreen;

  /// True if the current device is Laptop Screen
  bool get isLaptopScreen => shortestScreenSide < 1440 && !isTabletScreen;

  /// True if the current device is Desktop Screen
  bool get isDesktopScreen => shortestScreenSide >= 1440;

  bool get isXSmallScreen => screenWidth < 600;

  bool get isSmallScreen => screenWidth < 1024 && !isXSmallScreen;

  bool get isMediumScreen => screenWidth < 1440 && !isSmallScreen;

  bool get isLargeScreen => screenWidth < 1920 && !isMediumScreen;

  bool get isXLargeScreen => screenWidth >= 1920;
}
