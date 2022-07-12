import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Contains extensions to read and write a value in [SharedPreferences]
///
extension SharedPreferencesExt on SharedPreferences {
  Type _typeOf<T>() => T;

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  T? getValue<T>(String key) {
    assert(
        T != dynamic,
        'Incompatible dynamic type - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
    if (T == double) {
      return getDouble(key) as T?;
    } else if (T == int) {
      return getInt(key) as T?;
    } else if (T == String) {
      return getString(key) as T?;
    } else if (_typeOf<List<String>>() == T) {
      return getStringList(key) as T?;
    } else if (T == bool) {
      return getBool(key) as T?;
    } else if (T == Color) {
      return getColor(key) as T?;
    } else if (T == _typeOf<Map<String, dynamic>>()) {
      return getJson(key) as T?;
    } else if (T == ThemeMode) {
      return getThemeMode(key) as T?;
    } else if (T == DateTime) {
      return getDateTime(key) as T?;
    }
    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode or Color');
  }

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  ///
  /// If the value is null, return the [defaultValue]
  T getOrElse<T>(String key, {required T defaultValue}) {
    assert(
        T != dynamic,
        'Incompatible dynamic type - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
    if (T == double) {
      return getDouble(key) as T? ?? defaultValue;
    } else if (T == int) {
      return getInt(key) as T? ?? defaultValue;
    } else if (T == String) {
      return getString(key) as T? ?? defaultValue;
    } else if (_typeOf<List<String>>() == T) {
      return getStringList(key) as T? ?? defaultValue;
    } else if (T == bool) {
      return getBool(key) as T? ?? defaultValue;
    } else if (T == Color) {
      return getColor(key) as T? ?? defaultValue;
    } else if (T == _typeOf<Map<String, dynamic>>()) {
      return getJson(key) as T? ?? defaultValue;
    } else if (T == ThemeMode) {
      return getThemeMode(key) as T? ?? defaultValue;
    } else if (T == DateTime) {
      return getDateTime(key) as T? ?? defaultValue;
    }
    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

  /// Writes a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  Future<bool> setValue<T>(String key, T value) {
    if (value is List<String>) {
      return setStringList(key, value);
    } else if (value is double) {
      return setDouble(key, value);
    } else if (value is int) {
      return setInt(key, value);
    } else if (value is String) {
      return setString(key, value);
    } else if (value is bool) {
      return setBool(key, value);
    } else if (value is Color) {
      return setColor(key, value);
    } else if (value is Map<String, dynamic>) {
      return setJson(key, value);
    } else if (value is ThemeMode) {
      return setThemeMode(key, value);
    } else if (value is DateTime) {
      return setDateTime(key, value);
    }

    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool, List<String>, '
        'Map<String, dynamic>, ThemeMode, Color or DateTime');
  }

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
}
