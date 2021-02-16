import 'package:shared_preferences/shared_preferences.dart';

///
/// Contains extensions to read and write a value in [SharedPreferences]
///
extension SharedPreferencesExt on SharedPreferences {
  Type _typeOf<T>() => T;

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  T? getValue<T>(String key) {
    assert(T != dynamic,
        'Incompatible dynamic type - Use only double, int, String, bool or List<String>');
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
    }
    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool or List<String>');
  }

  /// Reads a value, throwing an exception if it's not a
  /// double, int, string, bool or List<String>.
  ///
  /// If the value is null, return the [defaultValue]
  T getOrElse<T>(String key, {required T defaultValue}) {
    assert(T != dynamic,
        'Incompatible dynamic type - Use only double, int, String, bool or List<String>');
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
    }
    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool or List<String>');
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
    }

    throw ArgumentError(
        'Incompatible preference type - Use only double, int, String, bool or List<String>');
  }
}
