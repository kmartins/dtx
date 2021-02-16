# Flutter Context DTX

<p align="center">
<a href="https://github.com/passsy/dart-lint"><img src="https://img.shields.io/badge/style-lint-40c4ff.svg" alt="style: lint"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

⚠️ **Its package is not yet in the [pub](https://pub.dev/).**

This extension package provides easy access to the most commonly used properties, functions, and additional convenience methods that depend on the [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) instance.

Based on package [build_context](https://github.com/pedromassango/build_context).

# Install

Add it in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_dtx:
    git: 
      url: git://github.com/Zambiee/dtx.git    
      ref: flutter_context_dtx-v1.1.1
      path: ./packages/flutter/flutter_context_dtx
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
- `context.accentTextTheme`
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
- `context.buttonColor`
- `context.canvasColor`
- `context.scaffoldBackgroundColor`
- `context.appBarTheme`

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
- `context.headline1AccentTextStyle`
- `context.headline2AccentTextStyle`
- `context.headline3AccentTextStyle`
- `context.headline4AccentTextStyle`
- `context.headline5AccentTextStyle`
- `context.headline6AccentTextStyle`
- `context.subtitle1AccentTextStyle`
- `context.bodyText1AccentTextStyle`
- `context.bodyText2AccentTextStyle`
- `context.captionAccentTextStyle`
- `context.buttonAccentTextStyle`
- `context.subtitle2AccentTextStyle`
- `context.overlineAccentTextStyle`
  
- `context.colorScheme`
- `context.colorSchemePrimary`
- `context.colorSchemePrimaryVariant`
- `context.colorSchemeSecondary`
- `context.colorSchemeSecondaryVariant`
- `context.colorSchemeSurface`
- `context.colorSchemeBackground`
- `context.colorSchemeError`
- `context.colorSchemeOnPrimary`
- `context.colorSchemeOnSecondary`
- `context.colorSchemeOnBackground`
- `context.colorSchemeOnSurface`
- `context.colorSchemeOnError`
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

## Overlay:

- `context.overlay`
- `context.addOverlay()`

## Localizations:

- `context.locale`
- `context.countryCode`
- `context.languageCode`

## ModalRoute:

- `context.modalRoute`
- `context.routeSettings`

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

Copyright © 2020 [Zambiee](https://github.com/Zambiee).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.
