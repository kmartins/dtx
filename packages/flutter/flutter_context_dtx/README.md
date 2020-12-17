# Flutter Context DTX

<p align="center">
<a href="https://github.com/passsy/dart-lint"><img src="https://img.shields.io/badge/style-lint-40c4ff.svg" alt="style: lint"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

⚠️ **Its package is not yet in the [pub](https://pub.dev/).**

This extension package provides easy access to the most commonly used properties, functions, and additional convenience methods that depend on the [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) instance.

Based on package [build_context](https://github.com/pedromassango/build_context).

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
- `context.shadowTheme`
- `context.themeBrightness`
- `context.isDarkBrightness`
- `context.isLightBrightness`
- `context.backgroundColor`
- `context.primaryColor`
- `context.buttonColor`
- `context.canvasColor`
- `context.scaffoldBackgroundColor`
- `context.appBarTheme`

- `context.headline1Style`
- `context.headline2Style`
- `context.headline3Style`
- `context.headline4Style`
- `context.headline5Style`
- `context.headline6Style`
- `context.subtitle1Style`
- `context.bodyText1Style`
- `context.bodyText2Style`
- `context.captionStyle`
- `context.buttonStyle`
- `context.subtitle2Style`
- `context.overlineStyle`
- `context.headline1PrimaryStyle`
- `context.headline2PrimaryStyle`
- `context.headline3PrimaryStyle`
- `context.headline4PrimaryStyle`
- `context.headline5PrimaryStyle`
- `context.headline6PrimaryStyle`
- `context.subtitle1PrimaryStyle`
- `context.bodyText1PrimaryStyle`
- `context.bodyText2PrimaryStyle`
- `context.captionPrimaryStyle`
- `context.buttonPrimaryStyle`
- `context.subtitle2PrimaryStyle`
- `context.overlinePrimaryStyle`
- `context.headline1AccentStyle`
- `context.headline2AccentStyle`
- `context.headline3AccentStyle`
- `context.headline4AccentStyle`
- `context.headline5AccentStyle`
- `context.headline6AccentStyle`
- `context.subtitle1AccentStyle`
- `context.bodyText1AccentStyle`
- `context.bodyText2AccentStyle`
- `context.captionAccentStyle`
- `context.buttonAccentStyle`
- `context.subtitle2AccentStyle`
- `context.overlineAccentStyle`

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

# Install

Add it in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_dtx:
    git: 
      url:  git://github.com/Zambiee/dtx.git    
      ref: flutter_context_dtx-v1.0.0     
      path: ./packages/flutter/flutter_context_dtx
```

Import it where you want to use it e.g, in your widget's file.

```dart
import "package:flutter_context_dtx/flutter_context_dtx.dart";
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
