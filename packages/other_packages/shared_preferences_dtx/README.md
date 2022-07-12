# shared_preferences_dtx

<a href="https://pub.dev/packages/shared_preferences_dtx"><img src="https://img.shields.io/pub/v/shared_preferences_dtx.svg" alt="Pub"></a>
<a href="https://github.com/zambiee/dtx/actions"><img src="https://github.com/Zambiee/dtx/workflows/Shared%20Preferences%20DTX/badge.svg" alt="build"></a>
<a href="https://github.com/passsy/dart-lint"><img src="https://img.shields.io/badge/style-lint-40c4ff.svg" alt="style: lint"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

This extension package provides easy access to the most commonly used properties, functions, and additional convenience methods that depend on the package [shared_preferences](https://pub.dev/packages/shared_preferences).

# Install

Add it in your `pubspec.yaml`:

```yaml
dependencies:
  shared_preferences:
  shared_preferences_dtx:
```

Import it where you want to use it.

```dart
import 'package:shared_preferences_dtx/shared_preferences_dtx.dart';
```

# Extensions

```dart
final preferences = await SharedPreferences.getInstance();

// set value
await preferences.setValue('String', 'String'),
await preferences.setValue('bool', false),
await preferences.setValue('int', 2),
await preferences.setValue('double', 2.5),
await preferences.setValue('list', <String>['foo', 'bar']),

// get value
preferences.getValue<String>('String');
preferences.getValue<bool>('bool');
preferences.getValue<int>('int');
preferences.getValue<double>('double');
preferences.getValue<List<String>>('list');

// get value or else
preferences.getOrElse('String', defaultValue: 'value');
preferences.getOrElse('bool', defaultValue: false);
preferences.getOrElse('int', defaultValue: 0);
preferences.getOrElse('double', defaultValue: 3.9);
preferences.getOrElse('list', defaultValue: <String>[]);
```

**Before:**
```dart
final preferences = await SharedPreferences.getInstance();

// set value
await preferences.setString('String', 'String'),
await preferences.setBool('bool', false),
await preferences.setInt('int', 2),
await preferences.setDouble('double', 2.5),
await preferences.setStringList('list', <String>['foo', 'bar']),

// get value
preferences.getString('String') ?? 'value';
preferences.getBool('bool') ?? false;
preferences.getInt('int') ?? 0;
preferences.getDouble('double') ?? 3.9;
preferences.getStringList('list') ?? <String>[];
```

# New Preferences

```dart
// set value
await preferences.setValue('color', Colors.black);
await preferences.setValue('theme_mode', ThemeMode.dark);
await preferences.setValue('user', {'name': 'user', 'age': 20});
await preferences.setValue('date_time', DateTime(2022, 07, 12)));

// get value
preferences.getValue<Color>('color');
preferences.getValue<ThemeMode>('theme_mode');
preferences.getValue<Map<String, dynamic>>('user');
preferences.getValue<DateTime>('date_time');

// get value or else
preferences.getOrElse('color', defaultValue: Colors.black);
preferences.getOrElse('theme_mode', defaultValue: ThemeMode.dark);
preferences.getOrElse('user', defaultValue:  {'name': 'user', 'age': 20});
preferences.getOrElse('date_time', defaultValue: DateTime(2022, 07, 12));
```
or 
```dart
// set value
await preferences.setColor('color', Colors.black);
await preferences.setThemeMode('theme_mode', ThemeMode.dark);
await preferences.setJson('user', {'name': 'user', 'age': 20});
await preferences.setDateTime('date_time', DateTime(2022, 07, 12)); // saves in utc

// get value
preferences.getColor('color') ?? Colors.black;
preferences.getThemeMode('theme_mode') ?? ThemeMode.light;
preferences.getJson('user') ?? {'name': 'user', 'age': 20};
preferences.getDateTime('date_time') ?? DateTime(2022, 07, 12); // utc
```

> Date time is saved as timezone independent milliseconds from the standard Unix epoch.

## 📝 License

Copyright © 2021 [Zambiee](https://github.com/Zambiee).<br />
This project is [MIT](https://opensource.org/licenses/MIT) licensed.