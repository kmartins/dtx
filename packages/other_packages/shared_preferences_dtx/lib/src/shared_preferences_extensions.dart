import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Contains extensions to read and write a value in [SharedPreferences]
///
extension SharedPreferencesExt on SharedPreferences {
  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  T? getValue<T extends Object>(String key) => switch (T) {
        const (double) => getDouble(key) as T?,
        const (int) => getInt(key) as T?,
        const (String) => getString(key) as T?,
        const (bool) => getBool(key) as T?,
        const (Color) => getColor(key) as T?,
        const (ThemeMode) => getThemeMode(key) as T?,
        const (DateTime) => getDateTime(key) as T?,
        const (List<String>) => getStringList(key) as T?,
        const (Map<String, dynamic>) => getJson(key) as T?,
        _ => throw _getArgumentError<T>(),
      };

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  ///
  /// If the value is null, return the [defaultValue]
  T getOrElse<T extends Object>(String key, {required T defaultValue}) =>
      switch (defaultValue) {
        (final double value) => getDoubleOrElse(key, defaultValue: value) as T,
        (final int value) => getIntOrElse(key, defaultValue: value) as T,
        (final String value) => getStringOrElse(key, defaultValue: value) as T,
        (final bool value) => getBoolOrElse(key, defaultValue: value) as T,
        (final Color value) => getColorOrElse(key, defaultValue: value) as T,
        (final ThemeMode value) =>
          getThemeModeOrElse(key, defaultValue: value) as T,
        (final DateTime value) =>
          getDateTimeOrElse(key, defaultValue: value) as T,
        (final List<String> value) => getStringListOrElse(
            key,
            defaultValue: value,
          ) as T,
        (final Map<String, dynamic> value) => getJsonOrElse(
            key,
            defaultValue: value,
          ) as T,
        _ => throw _getArgumentError<T>(),
      };

  /// Writes a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  Future<bool> setValue<T extends Object>(String key, T value) =>
      switch (value) {
        (final double value) => setDouble(key, value),
        (final int value) => setInt(key, value),
        (final String value) => setString(key, value),
        (final bool value) => setBool(key, value),
        (final Color value) => setColor(key, value),
        (final ThemeMode value) => setThemeMode(key, value),
        (final DateTime value) => setDateTime(key, value),
        (final List<String> value) => setStringList(key, value),
        (final Map<String, dynamic> value) => setJson(key, value),
        _ => throw _getArgumentError<T>(),
      };

  ArgumentError _getArgumentError<T extends Object>() => ArgumentError(
      'The $T type is incompatible - Use only double, int, String, bool, List<String>, '
      'Map<String, dynamic>, ThemeMode, Color or DateTime');

  // ignore: deprecated_member_use
  Future<bool> setColor(String key, Color color) => setInt(key, color.value);

  Future<bool> setThemeMode(String key, ThemeMode themeMode) =>
      setInt(key, ThemeMode.values.indexOf(themeMode));

  Future<bool> setJson(String key, Map<String, dynamic> map) =>
      setString(key, jsonEncode(map));

  /// Stores values as timezone independent milliseconds
  /// from the standard Unix epoch.
  Future<bool> setDateTime(String key, DateTime dateTime) =>
      setString(key, dateTime.millisecondsSinceEpoch.toString());

  Color? getColor(String key) {
    final value = getInt(key);
    return value != null ? Color(value) : null;
  }

  ThemeMode? getThemeMode(String key) {
    final value = getInt(key);
    return value != null ? ThemeMode.values[value] : null;
  }

  Map<String, dynamic>? getJson(String key) {
    final value = getString(key);
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  DateTime? getDateTime(String key) {
    final value = getString(key);
    return value != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(value), isUtc: true)
        : null;
  }

  bool getBoolOrElse(String key, {required bool defaultValue}) =>
      getBool(key) ?? defaultValue;

  int getIntOrElse(String key, {required int defaultValue}) =>
      getInt(key) ?? defaultValue;

  double getDoubleOrElse(String key, {required double defaultValue}) =>
      getDouble(key) ?? defaultValue;

  String getStringOrElse(String key, {required String defaultValue}) =>
      getString(key) ?? defaultValue;

  List<String> getStringListOrElse(
    String key, {
    required List<String> defaultValue,
  }) =>
      getStringList(key) ?? defaultValue;

  Color getColorOrElse(String key, {required Color defaultValue}) =>
      getColor(key) ?? defaultValue;

  ThemeMode getThemeModeOrElse(String key, {required ThemeMode defaultValue}) =>
      getThemeMode(key) ?? defaultValue;

  Map<String, dynamic> getJsonOrElse(
    String key, {
    required Map<String, dynamic> defaultValue,
  }) =>
      getJson(key) ?? defaultValue;

  DateTime getDateTimeOrElse(String key, {required DateTime defaultValue}) =>
      getDateTime(key) ?? defaultValue;
}
