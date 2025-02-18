// ignore_for_file: document_ignores

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Contains extensions to read and write a value in [SharedPreferencesWithCache]
///
extension SharedPreferencesAsyncExt on SharedPreferencesAsync {
  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or  `List<String>`.
  Future<T?> getValue<T extends Object>(String key) async => switch (T) {
        const (double) => await getDouble(key) as T?,
        const (int) => await getInt(key) as T?,
        const (String) => await getString(key) as T?,
        const (bool) => await getBool(key) as T?,
        const (Color) => await getColor(key) as T?,
        const (ThemeMode) => await getThemeMode(key) as T?,
        const (DateTime) => await getDateTime(key) as T?,
        const (List<String>) => await getStringList(key) as T?,
        const (Map<String, dynamic>) => await getJson(key) as T?,
        _ => throw _getArgumentError<T>(),
      };

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or `List<String>`.
  ///
  /// If the value is null, return the [defaultValue]
  Future<T> getOrElse<T extends Object>(
    String key, {
    required T defaultValue,
  }) =>
      switch (defaultValue) {
        (final double value) =>
          getDoubleOrElse(key, defaultValue: value) as Future<T>,
        (final int value) =>
          getIntOrElse(key, defaultValue: value) as Future<T>,
        (final String value) =>
          getStringOrElse(key, defaultValue: value) as Future<T>,
        (final bool value) =>
          getBoolOrElse(key, defaultValue: value) as Future<T>,
        (final Color value) =>
          getColorOrElse(key, defaultValue: value) as Future<T>,
        (final ThemeMode value) =>
          getThemeModeOrElse(key, defaultValue: value) as Future<T>,
        (final DateTime value) =>
          getDateTimeOrElse(key, defaultValue: value) as Future<T>,
        (final List<String> value) => getStringListOrElse(
            key,
            defaultValue: value,
          ) as Future<T>,
        (final Map<String, dynamic> value) => getJsonOrElse(
            key,
            defaultValue: value,
          ) as Future<T>,
        _ => throw _getArgumentError<T>(),
      };

  /// Writes a value, throwing an exception if it's not a
  /// double, int, string, bool or `List<String>`.
  Future<void> setValue<T extends Object>(String key, T value) =>
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
  Future<void> setColor(String key, Color color) => setInt(key, color.value);

  Future<void> setThemeMode(String key, ThemeMode themeMode) =>
      setInt(key, ThemeMode.values.indexOf(themeMode));

  Future<void> setJson(String key, Map<String, dynamic> map) =>
      setString(key, jsonEncode(map));

  /// Stores values as timezone independent milliseconds
  /// from the standard Unix epoch.
  Future<void> setDateTime(String key, DateTime dateTime) =>
      setString(key, dateTime.millisecondsSinceEpoch.toString());

  Future<Color?> getColor(String key) async {
    final value = await getInt(key);
    return value != null ? Color(value) : null;
  }

  Future<ThemeMode?> getThemeMode(String key) async {
    final value = await getInt(key);
    return value != null ? ThemeMode.values[value] : null;
  }

  Future<Map<String, dynamic>?> getJson(String key) async {
    final value = await getString(key);
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  Future<DateTime?> getDateTime(String key) async {
    final value = await getString(key);
    return value != null
        ? DateTime.fromMillisecondsSinceEpoch(int.parse(value), isUtc: true)
        : null;
  }

  Future<bool> getBoolOrElse(String key, {required bool defaultValue}) async =>
      await getBool(key) ?? defaultValue;

  Future<int> getIntOrElse(String key, {required int defaultValue}) async =>
      await getInt(key) ?? defaultValue;

  Future<double> getDoubleOrElse(
    String key, {
    required double defaultValue,
  }) async =>
      await getDouble(key) ?? defaultValue;

  Future<String> getStringOrElse(
    String key, {
    required String defaultValue,
  }) async =>
      await getString(key) ?? defaultValue;

  Future<List<String>> getStringListOrElse(
    String key, {
    required List<String> defaultValue,
  }) async =>
      await getStringList(key) ?? defaultValue;

  Future<Color> getColorOrElse(
    String key, {
    required Color defaultValue,
  }) async =>
      await getColor(key) ?? defaultValue;

  Future<ThemeMode> getThemeModeOrElse(
    String key, {
    required ThemeMode defaultValue,
  }) async =>
      await getThemeMode(key) ?? defaultValue;

  Future<Map<String, dynamic>> getJsonOrElse(
    String key, {
    required Map<String, dynamic> defaultValue,
  }) async =>
      await getJson(key) ?? defaultValue;

  Future<DateTime> getDateTimeOrElse(
    String key, {
    required DateTime defaultValue,
  }) async =>
      await getDateTime(key) ?? defaultValue;
}
