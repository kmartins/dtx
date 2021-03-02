import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Localization],
/// [MaterialLocalizations] and [WidgetsLocalizations] using [BuildContext]
///
extension LocalizationDtx on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String? get countryCode => locale.countryCode;

  String get languageCode => locale.languageCode;

  MaterialLocalizations get materialLocalizations =>
      MaterialLocalizations.of(this);

  WidgetsLocalizations get widgetsLocalizations =>
      WidgetsLocalizations.of(this);
}
