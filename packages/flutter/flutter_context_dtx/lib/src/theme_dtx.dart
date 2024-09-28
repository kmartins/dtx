import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Theme] using [BuildContext]
///
extension ThemeDtx on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get colorSchemePrimary => colorScheme.primary;

  Color get colorSchemeSecondary => colorScheme.secondary;

  Color get colorSchemeTertiary => colorScheme.tertiary;

  Color get colorSchemePrimaryContainer => colorScheme.primaryContainer;

  Color get colorSchemeSecondaryContainer => colorScheme.secondaryContainer;

  Color get colorSchemeTertiaryContainer => colorScheme.tertiaryContainer;

  Color get colorSchemeErrorContainer => colorScheme.errorContainer;

  Color get colorSchemeInversePrimary => colorScheme.inversePrimary;

  Color get colorSchemeInverseSurface => colorScheme.inverseSurface;

  Color get colorSchemeSurface => colorScheme.surface;

  Color get colorSchemeSurfaceVariant => colorScheme.surfaceContainerHighest;

  Color get colorSchemeSurfaceTint => colorScheme.surfaceTint;

  Color get colorSchemeShadow => colorScheme.shadow;

  Color get colorSchemeOutline => colorScheme.outline;

  Color get colorSchemeBackground => colorScheme.surface;

  Color get colorSchemeError => colorScheme.error;

  Color get colorSchemeOnPrimary => colorScheme.onPrimary;

  Color get colorSchemeOnSecondary => colorScheme.onSecondary;

  Color get colorSchemeOnBackground => colorScheme.onSurface;

  Color get colorSchemeOnSurface => colorScheme.onSurface;

  Color get colorSchemeOnError => colorScheme.onError;

  Color get colorSchemeOnPrimaryContainer => colorScheme.onPrimaryContainer;

  Color get colorSchemeOnSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get colorSchemeOnTertiaryContainer => colorScheme.onTertiaryContainer;

  Color get colorSchemeOnErrorContainer => colorScheme.onErrorContainer;

  Color get colorSchemeOnInverseSurface => colorScheme.onInverseSurface;

  Color get colorSchemeOnSurfaceVariant => colorScheme.onSurfaceVariant;

  Brightness get colorSchemeBrightness => colorScheme.brightness;

  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  PopupMenuThemeData get popupMenuTheme => theme.popupMenuTheme;

  @Deprecated(
    'Use OverflowBar instead. '
    'This feature was deprecated after v3.21.0-10.0.pre.',
  )
  ButtonBarThemeData get buttonBarTheme => theme.buttonBarTheme;

  DividerThemeData get dividerTheme => theme.dividerTheme;

  ChipThemeData get chipTheme => theme.chipTheme;

  SliderThemeData get sliderTheme => theme.sliderTheme;

  TooltipThemeData get tooltipTheme => theme.tooltipTheme;

  ToggleButtonsThemeData get toggleButtonsTheme => theme.toggleButtonsTheme;

  NavigationRailThemeData get navigationRailTheme => theme.navigationRailTheme;

  ButtonThemeData get buttonTheme => theme.buttonTheme;

  IconThemeData get iconTheme => theme.iconTheme;

  ListTileThemeData get listTileTheme => ListTileTheme.of(this);

  CardTheme get cardTheme => theme.cardTheme;

  TabBarTheme get tabBarTheme => theme.tabBarTheme;

  DialogTheme get dialogTheme => theme.dialogTheme;

  Brightness get themeBrightness => theme.brightness;

  bool get isDarkBrightness => theme.brightness == Brightness.dark;

  bool get isLightBrightness => theme.brightness == Brightness.light;

  Color get backgroundColor => theme.colorScheme.surface;

  Color get primaryColor => theme.primaryColor;

  Color get canvasColor => theme.canvasColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  Color get dividerColor => theme.dividerColor;

  Color get disabledColor => theme.disabledColor;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TextStyle? get headline1TextStyle => textTheme.displayLarge;

  TextStyle? get headline2TextStyle => textTheme.displayMedium;

  TextStyle? get headline3TextStyle => textTheme.displaySmall;

  TextStyle? get headline4TextStyle => textTheme.headlineMedium;

  TextStyle? get headline5TextStyle => textTheme.headlineSmall;

  TextStyle? get headline6TextStyle => textTheme.titleLarge;

  TextStyle? get subtitle1TextStyle => textTheme.titleMedium;

  TextStyle? get bodyText1TextStyle => textTheme.bodyLarge;

  TextStyle? get bodyText2TextStyle => textTheme.bodyMedium;

  TextStyle? get captionTextStyle => textTheme.bodySmall;

  TextStyle? get buttonTextStyle => textTheme.labelLarge;

  TextStyle? get subtitle2TextStyle => textTheme.titleSmall;

  TextStyle? get overlineTextStyle => textTheme.labelSmall;

  TextStyle? get headline1PrimaryTextStyle => primaryTextTheme.displayLarge;

  TextStyle? get headline2PrimaryTextStyle => primaryTextTheme.displayMedium;

  TextStyle? get headline3PrimaryTextStyle => primaryTextTheme.displaySmall;

  TextStyle? get headline4PrimaryTextStyle => primaryTextTheme.headlineMedium;

  TextStyle? get headline5PrimaryTextStyle => primaryTextTheme.headlineSmall;

  TextStyle? get headline6PrimaryTextStyle => primaryTextTheme.titleLarge;

  TextStyle? get subtitle1PrimaryTextStyle => primaryTextTheme.titleMedium;

  TextStyle? get bodyText1PrimaryTextStyle => primaryTextTheme.bodyLarge;

  TextStyle? get bodyText2PrimaryTextStyle => primaryTextTheme.bodyMedium;

  TextStyle? get captionPrimaryTextStyle => primaryTextTheme.bodySmall;

  TextStyle? get buttonPrimaryTextStyle => primaryTextTheme.labelLarge;

  TextStyle? get subtitle2PrimaryTextStyle => primaryTextTheme.titleSmall;

  @Deprecated(
    'Use labelSmall instead. '
    'This feature was deprecated after Flutter v3.1.0-0.0.pre.',
  )
  TextStyle? get overlinePrimaryTextStyle => primaryTextTheme.labelSmall;

  TextStyle? get displayLargeTextStyle => textTheme.displayLarge;

  TextStyle? get displayMediumTextStyle => textTheme.displayMedium;

  TextStyle? get displaySmallTextStyle => textTheme.displaySmall;

  TextStyle? get headlineLargeTextStyle => textTheme.headlineLarge;

  TextStyle? get headlineMediumTextStyle => textTheme.headlineMedium;

  TextStyle? get headlineSmallTextStyle => textTheme.headlineSmall;

  TextStyle? get titleLargeTextStyle => textTheme.titleLarge;

  TextStyle? get titleMediumTextStyle => textTheme.titleMedium;

  TextStyle? get titleSmallTextStyle => textTheme.titleSmall;

  TextStyle? get labelLargeTextStyle => textTheme.labelLarge;

  TextStyle? get labelMediumTextStyle => textTheme.labelMedium;

  TextStyle? get labelSmallTextStyle => textTheme.labelSmall;

  TextStyle? get bodyLargeTextStyle => textTheme.bodyLarge;

  TextStyle? get bodyMediumTextStyle => textTheme.bodyMedium;

  TextStyle? get bodySmallTextStyle => textTheme.bodySmall;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  TextDirection get textDirection => Directionality.of(this);

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
