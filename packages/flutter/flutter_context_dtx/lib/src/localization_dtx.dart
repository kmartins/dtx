import 'package:flutter/material.dart';

///
/// Contains extensions for easier access to [Localization] using [BuildContext]
///
extension LocalizationDtx on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get countryCode => locale.countryCode;

  String get languageCode => locale.languageCode;
}
