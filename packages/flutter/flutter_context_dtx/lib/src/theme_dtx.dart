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

  TextStyle get headline1Style => textTheme.headline1;

  TextStyle get headline2Style => textTheme.headline2;

  TextStyle get headline3Style => textTheme.headline3;

  TextStyle get headline4Style => textTheme.headline4;

  TextStyle get headline5Style => textTheme.headline5;

  TextStyle get headline6Style => textTheme.headline6;

  TextStyle get subtitle1Style => textTheme.subtitle1;

  TextStyle get bodyText1Style => textTheme.bodyText1;

  TextStyle get bodyText2Style => textTheme.bodyText2;

  TextStyle get captionStyle => textTheme.caption;

  TextStyle get buttonStyle => textTheme.button;

  TextStyle get subtitle2Style => textTheme.subtitle2;

  TextStyle get overlineStyle => textTheme.overline;

  TextStyle get headline1PrimaryStyle => primaryTextTheme.headline1;

  TextStyle get headline2PrimaryStyle => primaryTextTheme.headline2;

  TextStyle get headline3PrimaryStyle => primaryTextTheme.headline3;

  TextStyle get headline4PrimaryStyle => primaryTextTheme.headline4;

  TextStyle get headline5PrimaryStyle => primaryTextTheme.headline5;

  TextStyle get headline6PrimaryStyle => primaryTextTheme.headline6;

  TextStyle get subtitle1PrimaryStyle => primaryTextTheme.subtitle1;

  TextStyle get bodyText1PrimaryStyle => primaryTextTheme.bodyText1;

  TextStyle get bodyText2PrimaryStyle => primaryTextTheme.bodyText2;

  TextStyle get captionPrimaryStyle => primaryTextTheme.caption;

  TextStyle get buttonPrimaryStyle => primaryTextTheme.button;

  TextStyle get subtitle2PrimaryStyle => primaryTextTheme.subtitle2;

  TextStyle get overlinePrimaryStyle => primaryTextTheme.overline;

  TextStyle get headline1AccentStyle => accentTextTheme.headline1;

  TextStyle get headline2AccentStyle => accentTextTheme.headline2;

  TextStyle get headline3AccentStyle => accentTextTheme.headline3;

  TextStyle get headline4AccentStyle => accentTextTheme.headline4;

  TextStyle get headline5AccentStyle => accentTextTheme.headline5;

  TextStyle get headline6AccentStyle => accentTextTheme.headline6;

  TextStyle get subtitle1AccentStyle => accentTextTheme.subtitle1;

  TextStyle get bodyText1AccentStyle => accentTextTheme.bodyText1;

  TextStyle get bodyText2AccentStyle => accentTextTheme.bodyText2;

  TextStyle get captionAccentStyle => accentTextTheme.caption;

  TextStyle get buttonAccentStyle => accentTextTheme.button;

  TextStyle get subtitle2AccentStyle => accentTextTheme.subtitle2;

  TextStyle get overlineAccentStyle => accentTextTheme.overline;

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
