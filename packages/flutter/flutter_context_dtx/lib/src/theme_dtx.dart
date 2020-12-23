import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Theme] using [BuildContext]
///
extension ThemeDtx on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  TextTheme get accentTextTheme => theme.accentTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get colorSchemePrimary => colorScheme.primary;

  Color get colorSchemePrimaryVariant => colorScheme.primaryVariant;

  Color get colorSchemeSecondary => colorScheme.secondary;

  Color get colorSchemeSecondaryVariant => colorScheme.secondaryVariant;

  Color get colorSchemeSurface => colorScheme.surface;

  Color get colorSchemeBackground => colorScheme.background;

  Color get colorSchemeError => colorScheme.error;

  Color get colorSchemeOnPrimary => colorScheme.onPrimary;

  Color get colorSchemeOnSecondary => colorScheme.onSecondary;

  Color get colorSchemeOnBackground => colorScheme.onBackground;

  Color get colorSchemeOnSurface => colorScheme.onSurface;

  Color get colorSchemeOnError => colorScheme.onError;

  Brightness get colorSchemeBrightness => colorScheme.brightness;

  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  PopupMenuThemeData get popupMenuTheme => theme.popupMenuTheme;

  ButtonBarThemeData get buttonBarTheme => theme.buttonBarTheme;

  DividerThemeData get dividerTheme => theme.dividerTheme;

  ChipThemeData get chipTheme => theme.chipTheme;

  SliderThemeData get sliderTheme => theme.sliderTheme;

  CardTheme get cardTheme => theme.cardTheme;

  TabBarTheme get tabBarTheme => theme.tabBarTheme;

  DialogTheme get dialogTheme => theme.dialogTheme;

  ThemeData get shadowTheme => Theme.of(this, shadowThemeOnly: true);

  Brightness get themeBrightness => theme.brightness;

  bool get isDarkBrightness => theme.brightness == Brightness.dark;

  bool get isLightBrightness => theme.brightness == Brightness.light;

  Color get backgroundColor => theme.backgroundColor;

  Color get primaryColor => theme.primaryColor;

  Color get buttonColor => theme.buttonColor;

  Color get canvasColor => theme.canvasColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TextStyle get headline1TextStyle => textTheme.headline1;

  TextStyle get headline2TextStyle => textTheme.headline2;

  TextStyle get headline3TextStyle => textTheme.headline3;

  TextStyle get headline4TextStyle => textTheme.headline4;

  TextStyle get headline5TextStyle => textTheme.headline5;

  TextStyle get headline6TextStyle => textTheme.headline6;

  TextStyle get subtitle1TextStyle => textTheme.subtitle1;

  TextStyle get bodyText1TextStyle => textTheme.bodyText1;

  TextStyle get bodyText2TextStyle => textTheme.bodyText2;

  TextStyle get captionTextStyle => textTheme.caption;

  TextStyle get buttonTextStyle => textTheme.button;

  TextStyle get subtitle2TextStyle => textTheme.subtitle2;

  TextStyle get overlineTextStyle => textTheme.overline;

  TextStyle get headline1PrimaryTextStyle => primaryTextTheme.headline1;

  TextStyle get headline2PrimaryTextStyle => primaryTextTheme.headline2;

  TextStyle get headline3PrimaryTextStyle => primaryTextTheme.headline3;

  TextStyle get headline4PrimaryTextStyle => primaryTextTheme.headline4;

  TextStyle get headline5PrimaryTextStyle => primaryTextTheme.headline5;

  TextStyle get headline6PrimaryTextStyle => primaryTextTheme.headline6;

  TextStyle get subtitle1PrimaryTextStyle => primaryTextTheme.subtitle1;

  TextStyle get bodyText1PrimaryTextStyle => primaryTextTheme.bodyText1;

  TextStyle get bodyText2PrimaryTextStyle => primaryTextTheme.bodyText2;

  TextStyle get captionPrimaryTextStyle => primaryTextTheme.caption;

  TextStyle get buttonPrimaryTextStyle => primaryTextTheme.button;

  TextStyle get subtitle2PrimaryTextStyle => primaryTextTheme.subtitle2;

  TextStyle get overlinePrimaryTextStyle => primaryTextTheme.overline;

  TextStyle get headline1AccentTextStyle => accentTextTheme.headline1;

  TextStyle get headline2AccentTextStyle => accentTextTheme.headline2;

  TextStyle get headline3AccentTextStyle => accentTextTheme.headline3;

  TextStyle get headline4AccentTextStyle => accentTextTheme.headline4;

  TextStyle get headline5AccentTextStyle => accentTextTheme.headline5;

  TextStyle get headline6AccentTextStyle => accentTextTheme.headline6;

  TextStyle get subtitle1AccentTextStyle => accentTextTheme.subtitle1;

  TextStyle get bodyText1AccentTextStyle => accentTextTheme.bodyText1;

  TextStyle get bodyText2AccentTextStyle => accentTextTheme.bodyText2;

  TextStyle get captionAccentTextStyle => accentTextTheme.caption;

  TextStyle get buttonAccentTextStyle => accentTextTheme.button;

  TextStyle get subtitle2AccentTextStyle => accentTextTheme.subtitle2;

  TextStyle get overlineAccentTextStyle => accentTextTheme.overline;

  TargetPlatform get platform => theme.platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  bool get isMacOS => platform == TargetPlatform.macOS;

  bool get isWindows => platform == TargetPlatform.windows;

  bool get isFuchsia => platform == TargetPlatform.fuchsia;

  bool get isLinux => platform == TargetPlatform.linux;

  bool get isWeb => kIsWeb;

  bool get isDesktop => !isWeb && (isLinux || isMacOS || isWindows);

  bool get isMobile => !isWeb && (isAndroid || isIOS);

  bool get isGoogle => !isWeb && (isAndroid || isFuchsia);

  bool get isApple => !isWeb && (isIOS || isMacOS);
}
