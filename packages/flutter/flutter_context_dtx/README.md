# Flutter Context DTX

<p align="center">
<a href="https://pub.dev/packages/flutter_context_dtx"><img src="https://img.shields.io/pub/v/flutter_context_dtx.svg" alt="Pub"></a>
<a href="https://github.com/passsy/dart-lint"><img src="https://img.shields.io/badge/style-lint-40c4ff.svg" alt="style: lint"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

This extension package provides easy access to the most commonly used properties, functions, and additional convenience methods that depend on the [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) instance.

Based on package [build_context](https://github.com/pedromassango/build_context).

# Install

Add it in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_dtx:
```

Import it where you want to use it e.g, in your widget's file.

```dart
import 'package:flutter_context_dtx/flutter_context_dtx.dart';
```

# Usage

```dart
import 'package:flutter/material.dart';
import "package:flutter_context_dtx/flutter_context_dtx.dart";

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor, // There is no Theme.of(context)
      body: Center(
        child: GestureDetector(
          onTap: () => context.pushNamed('/detailsPage'), // we use only context not Navigator.of(context)
          child: Text(
            'Press Me',
            style: context.subtitle1Style, // we use only context not Theme.of(context)
          ),
        ),
      ),
    );
  }
}
```

# Available Extensions

## MediaQuery:

- `context.mediaQuery`
- `context.screenSize`
- `context.screenPadding`
- `context.viewPadding`
- `context.viewInsets`
- `context.screenWidth`
- `context.screenHeight`
- `context.statusBarHeight`
- `context.orientation`
- `context.isLandscape`
- `context.isPortrait`
- `context.alwaysUse24HourFormat`
- `context.screenDensity`
- `context.platformBrightness`
- `context.textScaleFactor`
- `context.shortestScreenSide`
- `context.longestScreenSide`

- `context.isSmallPhoneScreen`
- `context.isMediumPhoneScreen`
- `context.isLargePhoneScreen`
- `context.isSmallTabletScreen`
- `context.isLargeTabletScreen`
- `context.isPhoneScreen`
- `context.isTabletScreen`
- `context.isDesktopScreen`
- `context.isXSmallScreen`
- `context.isSmallScreen`
- `context.isMediumScreen`
- `context.isLargeScreen`
- `context.isXLargeScreen`

## Navigator:

- `context.push()`
- `context.replacement()`
- `context.pushNamed()`
- `context.pushReplacementNamed()`
- `context.popAndPushNamed()`
- `context.pushNamedAndRemoveUntil()`
- `context.ushAndRemoveUntil()`
- `context.replace()`
- `context.replaceRouteBelow()`
- `context.canPop()`
- `context.maybePop()`
- `context.popUntil()`
- `context.pop()`
- `context.removeRoute()`
- `context.removeRouteBelow()`
- `context.finalizeRoute()`

## Theme:

- `context.theme`
- `context.textTheme`
- `context.primaryTextTheme`
- `context.bottomAppBarTheme`
- `context.bottomSheetTheme`
- `context.popupMenuTheme`
- `context.buttonBarTheme`
- `context.dividerTheme`
- `context.chipTheme`
- `context.sliderTheme`
- `context.cardTheme`
- `context.tabBarTheme`
- `context.dialogTheme`
- `context.themeBrightness`
- `context.isDarkBrightness`
- `context.isLightBrightness`
- `context.backgroundColor`
- `context.primaryColor`
- `context.canvasColor`
- `context.scaffoldBackgroundColor`
- `context.dividerColor`
- `context.disabledColor`
- `context.appBarTheme`
- `context.tooltipTheme`
- `context.toggleButtonsTheme`
- `context.navigationRailTheme`
- `context.buttonTheme`
- `context.iconTheme`
- `context.listTileTheme`

- `context.headline1TextStyle`
- `context.headline2TextStyle`
- `context.headline3TextStyle`
- `context.headline4TextStyle`
- `context.headline5TextStyle`
- `context.headline6TextStyle`
- `context.subtitle1TextStyle`
- `context.bodyText1TextStyle`
- `context.bodyText2TextStyle`
- `context.captionTextStyle`
- `context.buttonTextStyle`
- `context.subtitle2TextStyle`
- `context.overlineTextStyle`
- `context.headline1PrimaryTextStyle`
- `context.headline2PrimaryTextStyle`
- `context.headline3PrimaryTextStyle`
- `context.headline4PrimaryTextStyle`
- `context.headline5PrimaryTextStyle`
- `context.headline6PrimaryTextStyle`
- `context.subtitle1PrimaryTextStyle`
- `context.bodyText1PrimaryTextStyle`
- `context.bodyText2PrimaryTextStyle`
- `context.captionPrimaryTextStyle`
- `context.buttonPrimaryTextStyle`
- `context.subtitle2PrimaryTextStyle`
- `context.overlinePrimaryTextStyle`
- `context.defaultTextStyle`
- `context.textDirection`
  
- `context.colorScheme`
- `context.colorSchemePrimary`
- `context.colorSchemePrimaryVariant`
- `context.colorSchemeSecondary`
- `context.colorSchemeTertiary`
- `context.colorSchemeSecondaryVariant`
- `context.colorSchemePrimaryContainer`
- `context.colorSchemeSecondaryContainer `
- `context.colorSchemeTertiaryContainer`
- `context.colorSchemeErrorContainer`
- `context.colorSchemeInversePrimary`
- `context.colorSchemeInverseSurface`
- `context.colorSchemeSurface`
- `context.colorSchemeSurfaceVariant`
- `context.colorSchemeSurfaceTint`
- `context.colorSchemeShadow`
- `context.colorSchemeOutline`
- `context.colorSchemeBackground`
- `context.colorSchemeError`
- `context.colorSchemeOnPrimary`
- `context.colorSchemeOnSecondary`
- `context.colorSchemeOnBackground`
- `context.colorSchemeOnSurface`
- `context.colorSchemeOnError`
- `context.colorSchemeOnPrimaryContainer`
- `context.colorSchemeOnSecondaryContainer`
- `context.colorSchemeOnTertiaryContainer`
- `context.colorSchemeOnErrorContainer`
- `context.colorSchemeOnInverseSurface`
- `context.colorSchemeOnSurfaceVariant`
- `context.colorSchemeBrightness`

- `context.platform`
- `context.isAndroid`
- `context.isIOS`
- `context.isWindows`
- `context.isMacOS`
- `context.isFuchsia`
- `context.isLinux`
- `context.isMobile`
- `context.isWeb`
- `context.isDesktop`
- `context.isMobile`
- `context.isGoogle`
- `context.isApple`

## Scaffold:

```
⚠️ Note: those must be called in the context of a `Scaffold` widget otherwise you might have errors.
```

- `context.scaffoldState`
- `context.appBarMaxHeight`
- `context.hasAppBar`
- `context.hasDrawer`
- `context.hasEndDrawer`
- `context.hasFloatingActionButton`
- `context.isDrawerOpen`
- `context.isEndDrawerOpen`
- `context.showSnackBar()`
- `context.removeCurrentSnackBar()`
- `context.hideCurrentSnackBar()`
- `context.openDrawer()`
- `context.openEndDrawer()`
- `context.showBottomSheet()`

## Form:

```
⚠️ Note: those must be called in the context of a `Scaffold` widget otherwise you might have errors.
```

- `context.form.validate()`
- `context.form.reset()`
- `context.form.save()`

## FocusScope:

- `context.focusScope.hasFocus`
- `context.focusScope.isFirstFocus`
- `context.focusScope.canRequestFocus`
- `context.focusScope.hasPrimaryFocus`

- `context.focusScope.unfocus()`
- `context.focusScope.nextFocus()`
- `context.focusScope.requestFocus()`
- `context.focusScope.previousFocus()`
- `context.focusScope.setFirstFocus()`
- `context.focusScope.consumeKeyboardToken()`
- `context.closeKeyboard()`
- `context.focusTraversalOrder`
- `context.focusTraversalPolicy`

## Overlay:

- `context.overlay`
- `context.addOverlay()`

## Localizations:

- `context.locale`
- `context.countryCode`
- `context.languageCode`
- `context.materialLocalizations`
- `context.widgetsLocalizations`

## ModalRoute:

- `context.modalRoute`
- `context.routeSettings`
- `context.args<String>()`

## Controller:

- `context.tabController`
- `context.materialInkController`
- `context.primaryScrollController`

## Others:

- `context.pageStorage`
- `context.scrollBehavior`
- `context.scrollable`
- `context.actions`
- `context.animatedList`
- `context.defaultAssetBundle`
- `context.sliverAnimatedList`
- `context.tickingEnabled`

## 🤝 Support

You liked this package? Then give it a ⭐️. If you want to help then:

- Fork this repository
- Send a Pull Request with new features
- Share this package
- Create issues if you find a bug or want to suggest a new extension

## Credits

- [build_context](https://github.com/pedromassango/build_context) created by [
  Pedro Massango](https://github.com/pedromassango)

## 📝 License

Copyright © 2021 [Zambiee](https://github.com/Zambiee).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.
