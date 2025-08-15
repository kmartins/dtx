import 'package:flutter/material.dart';
import 'package:flutter_context_dtx/src/window_size_class.dart';

///
/// Contains extensions for easier access to [MediaQuery] and [MediaQueryData] using [BuildContext].
///
/// The screen size is based on the material design.
/// https://material.io/design/layout/responsive-layout-grid.html
///
extension MediaQueryDtx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double get statusBarHeight => screenPadding.top;

  double get bottomBarHeight => screenPadding.bottom;

  Orientation get orientation => MediaQuery.orientationOf(this);

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get alwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  double get screenDensity => MediaQuery.devicePixelRatioOf(this);

  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  double get textScaleFactor => textScaler.scale(1);

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
  @Deprecated('Use isWindowCompactWidth instead. '
      'This method is deprecated in favor of a new, more '
      'precise naming convention.')
  bool get isCompactLayout => screenWidth < 600;

  /// Material Design 3 - Phone in portrait and Tablet in
  /// portrait Foldable in portrait (unfolded)
  @Deprecated('Use isWindowMediumWidth instead. '
      'This method is deprecated in favor of a new, '
      'more precise naming convention.')
  bool get isMediumLayout => screenWidth >= 600 && screenWidth < 840;

  /// Material 3 - Phone in landscape
  /// Tablet in landscape
  /// Foldable in landscape (unfolded)
  /// Desktop
  @Deprecated('Use isWindowExpandedWidth instead. '
      'This method is deprecated in favor of a new, '
      'more precise naming convention '
      'that aligns with Material 3 window size classes.')
  bool get isExtendedLayout => screenWidth >= 840;

  WindowSizeClass get windowSizeClass =>
      WindowSizeClass.calculateFromSize(screenSize);

  WindowWidthSizeClass get windowWidthSizeClass =>
      windowSizeClass.widthSizeClass;

  WindowHeightSizeClass get windowHeightSizeClass =>
      windowSizeClass.heightSizeClass;

  /// Checks if the screen width falls into the "Compact" size class.
  /// Corresponds to a width < 600dp.
  /// (Represents 99.96% of phones in portrait mode).
  bool get isWindowCompactWidth =>
      windowWidthSizeClass == WindowWidthSizeClass.compact;

  /// Checks if the screen width falls into the "Medium" size class.
  /// Corresponds to a width >= 600dp and < 840dp.
  /// (Represents 93.73% of tablets in portrait mode).
  bool get isWindowMediumWidth =>
      windowWidthSizeClass == WindowWidthSizeClass.medium;

  /// Checks if the screen width falls into the "Expanded" size class.
  /// Corresponds to a width >= 840dp and < 1200dp.
  /// (Represents 97.22% of tablets in landscape mode).
  bool get isWindowExpandedWidth =>
      windowWidthSizeClass == WindowWidthSizeClass.expanded;

  /// Checks if the screen width falls into the "Large" size class.
  /// Corresponds to a width >= 1200dp and < 1600dp.
  /// (Typically used for large tablet displays).
  bool get isWindowLargeWidth =>
      windowWidthSizeClass == WindowWidthSizeClass.large;

  /// Checks if the screen width falls into the "Extra-large" size class.
  /// Corresponds to a width >= 1600dp.
  /// (Typically used for desktop displays).
  bool get isWindowExtraLargeWidth =>
      windowWidthSizeClass == WindowWidthSizeClass.extraLarge;

  /// Checks if the screen height falls into the "Compact" size class.
  /// Corresponds to a height < 480dp.
  /// (Represents 99.78% of phones in landscape mode).
  bool get isWindowCompactHeight =>
      windowHeightSizeClass == WindowHeightSizeClass.compact;

  /// Checks if the screen height falls into the "Medium" size class.
  /// Corresponds to a height >= 480dp and < 900dp.
  /// (Represents 96.56% of tablets in landscape and 97.59% of phones in portrait).
  bool get isWindowMediumHeight =>
      windowHeightSizeClass == WindowHeightSizeClass.medium;

  /// Checks if the screen height falls into the "Expanded" size class.
  /// Corresponds to a height >= 900dp.
  /// (Represents 94.25% of tablets in portrait mode).
  bool get isWindowExpandedHeight =>
      windowHeightSizeClass == WindowHeightSizeClass.expanded;

  /// Material 3
  double get space {
    if (isWindowCompactWidth) {
      return 16;
    }
    return 24;
  }

  /// Material 3
  double get pane {
    if (windowWidthSizeClass >= WindowWidthSizeClass.expanded) {
      return 2;
    }
    return 1;
  }
}
