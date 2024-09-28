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

  double get textScaleFactor => mediaQuery.textScaler.scale(1);

  double get shortestScreenSide => screenSize.shortestSide;

  double get longestScreenSide => screenSize.longestSide;

  @Deprecated('Use isPhoneScreen instead.')
  bool get isSmallPhoneScreen => shortestScreenSide < 360;

  @Deprecated('Use isPhoneScreen instead.')
  bool get isMediumPhoneScreen =>
      shortestScreenSide >= 360 && shortestScreenSide < 400;

  @Deprecated('Use isPhoneScreen instead.')
  bool get isLargePhoneScreen =>
      shortestScreenSide >= 400 && shortestScreenSide < 600;

  @Deprecated('Use isTabletScreen instead.')
  bool get isSmallTabletScreen =>
      shortestScreenSide >= 600 && shortestScreenSide < 720;

  @Deprecated('Use isTabletScreen instead.')
  bool get isLargeTabletScreen =>
      shortestScreenSide >= 720 && shortestScreenSide < 960;

  bool get isPhoneScreen => screenWidth < 600;

  bool get isTabletScreen => screenWidth >= 600 && screenWidth < 1240;

  bool get isLaptopScreen => screenWidth >= 1240 && screenWidth < 1440;

  bool get isDesktopScreen => screenWidth >= 1440;

  bool get isXSmallScreen => isPhoneScreen;

  bool get isXXSmallScreen => screenWidth >= 600 && screenWidth < 905;

  bool get isSmallScreen => screenWidth >= 905 && screenWidth < 1240;

  bool get isMediumScreen => isLaptopScreen;

  bool get isLargeScreen => isDesktopScreen;

  @Deprecated('There is only the isLargeScreen.')
  bool get isXLargeScreen => screenWidth >= 1920;

  /// Material 2
  double get margin {
    if (isXSmallScreen) {
      return 16;
    } else if (isXXSmallScreen) {
      return 32;
    } else if (isSmallScreen) {
      return (screenWidth - 840) / 2;
    } else if (isMediumScreen) {
      return 200;
    }
    return (screenWidth - 1040) / 2;
  }

  /// Material 2
  int get columns {
    if (isXSmallScreen) {
      return 4;
    } else if (isXXSmallScreen) {
      return 8;
    }
    return 12;
  }

  /// Material 2
  double get widthBody {
    if (isXSmallScreen) {
      return screenWidth - (16 * 2);
    } else if (isXXSmallScreen) {
      return screenWidth - (32 * 2);
    } else if (isSmallScreen) {
      return 840;
    } else if (isMediumScreen) {
      return screenWidth - (200 * 2);
    }
    return 1040;
  }

  /// Material Design 3 - Phone in portrait
  bool get isCompactLayout => screenWidth < 600;

  /// Material Design 3 - Phone in portrait and Tablet in
  /// portrait Foldable in portrait (unfolded)
  bool get isMediumLayout => screenWidth >= 600 && screenWidth < 840;

  /// Material 3 - Phone in landscape
  /// Tablet in landscape
  /// Foldable in landscape (unfolded)
  /// Desktop
  bool get isExtendedLayout => screenWidth >= 840;

  /// Material 3
  double get space {
    if (isCompactLayout) {
      return 16;
    }
    return 24;
  }

  /// Material 3
  double get pane {
    if (isExtendedLayout) {
      return 2;
    }
    return 1;
  }
}
