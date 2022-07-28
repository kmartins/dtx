import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Theme] using [BuildContext]
///
extension ThemeDtx on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  @Deprecated(
    'Use context.colorSchemeOnSecondary instead. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextTheme get accentTextTheme => theme.accentTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Color get colorSchemePrimary => colorScheme.primary;

  @Deprecated(
    'Use context.colorSchemePrimaryContainer instead. '
    'This feature was deprecated after v2.6.0-0.0.pre.',
  )
  Color get colorSchemePrimaryVariant => colorScheme.primaryVariant;

  Color get colorSchemeSecondary => colorScheme.secondary;

  Color get colorSchemeTertiary => colorScheme.tertiary;

  @Deprecated(
    'Use context.colorSchemeSecondaryContainer instead. '
    'This feature was deprecated after v2.6.0-0.0.pre.',
  )
  Color get colorSchemeSecondaryVariant => colorScheme.secondaryVariant;

  Color get colorSchemePrimaryContainer => colorScheme.primaryContainer;

  Color get colorSchemeSecondaryContainer => colorScheme.secondaryContainer;

  Color get colorSchemeTertiaryContainer => colorScheme.tertiaryContainer;

  Color get colorSchemeErrorContainer => colorScheme.errorContainer;

  Color get colorSchemeInversePrimary => colorScheme.inversePrimary;

  Color get colorSchemeInverseSurface => colorScheme.inverseSurface;

  Color get colorSchemeSurface => colorScheme.surface;

  Color get colorSchemeSurfaceVariant => colorScheme.surfaceVariant;

  Color get colorSchemeSurfaceTint => colorScheme.surfaceTint;

  Color get colorSchemeShadow => colorScheme.shadow;

  Color get colorSchemeOutline => colorScheme.outline;

  Color get colorSchemeBackground => colorScheme.background;

  Color get colorSchemeError => colorScheme.error;

  Color get colorSchemeOnPrimary => colorScheme.onPrimary;

  Color get colorSchemeOnSecondary => colorScheme.onSecondary;

  Color get colorSchemeOnBackground => colorScheme.onBackground;

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

  Color get backgroundColor => theme.backgroundColor;

  Color get primaryColor => theme.primaryColor;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.2.pre.',
  )
  Color get buttonColor => theme.buttonColor;

  Color get canvasColor => theme.canvasColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  Color get dividerColor => theme.dividerColor;

  Color get disabledColor => theme.disabledColor;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TextStyle? get headline1TextStyle => textTheme.headline1;

  TextStyle? get headline2TextStyle => textTheme.headline2;

  TextStyle? get headline3TextStyle => textTheme.headline3;

  TextStyle? get headline4TextStyle => textTheme.headline4;

  TextStyle? get headline5TextStyle => textTheme.headline5;

  TextStyle? get headline6TextStyle => textTheme.headline6;

  TextStyle? get subtitle1TextStyle => textTheme.subtitle1;

  TextStyle? get bodyText1TextStyle => textTheme.bodyText1;

  TextStyle? get bodyText2TextStyle => textTheme.bodyText2;

  TextStyle? get captionTextStyle => textTheme.caption;

  TextStyle? get buttonTextStyle => textTheme.button;

  TextStyle? get subtitle2TextStyle => textTheme.subtitle2;

  TextStyle? get overlineTextStyle => textTheme.overline;

  TextStyle? get headline1PrimaryTextStyle => primaryTextTheme.headline1;

  TextStyle? get headline2PrimaryTextStyle => primaryTextTheme.headline2;

  TextStyle? get headline3PrimaryTextStyle => primaryTextTheme.headline3;

  TextStyle? get headline4PrimaryTextStyle => primaryTextTheme.headline4;

  TextStyle? get headline5PrimaryTextStyle => primaryTextTheme.headline5;

  TextStyle? get headline6PrimaryTextStyle => primaryTextTheme.headline6;

  TextStyle? get subtitle1PrimaryTextStyle => primaryTextTheme.subtitle1;

  TextStyle? get bodyText1PrimaryTextStyle => primaryTextTheme.bodyText1;

  TextStyle? get bodyText2PrimaryTextStyle => primaryTextTheme.bodyText2;

  TextStyle? get captionPrimaryTextStyle => primaryTextTheme.caption;

  TextStyle? get buttonPrimaryTextStyle => primaryTextTheme.button;

  TextStyle? get subtitle2PrimaryTextStyle => primaryTextTheme.subtitle2;

  TextStyle? get overlinePrimaryTextStyle => primaryTextTheme.overline;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline1AccentTextStyle => accentTextTheme.headline1;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline2AccentTextStyle => accentTextTheme.headline2;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline3AccentTextStyle => accentTextTheme.headline3;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline4AccentTextStyle => accentTextTheme.headline4;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline5AccentTextStyle => accentTextTheme.headline5;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get headline6AccentTextStyle => accentTextTheme.headline6;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get subtitle1AccentTextStyle => accentTextTheme.subtitle1;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get bodyText1AccentTextStyle => accentTextTheme.bodyText1;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get bodyText2AccentTextStyle => accentTextTheme.bodyText2;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get captionAccentTextStyle => accentTextTheme.caption;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get buttonAccentTextStyle => accentTextTheme.button;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get subtitle2AccentTextStyle => accentTextTheme.subtitle2;

  @Deprecated(
    'No longer used by the package, please remove any reference to it. '
    'This feature was deprecated after Flutter v2.3.0-0.1.pre',
  )
  TextStyle? get overlineAccentTextStyle => accentTextTheme.overline;

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
