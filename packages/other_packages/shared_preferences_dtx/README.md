# Shared Preferences DTX

<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>

**None package is not yet in the [pub](https://pub.dev/).**

This extension package provides easy access to the most commonly used properties, functions, and additional convenience methods that depend on the package [shared_preferences](https://pub.dev/packages/shared_preferences).

# Extensions

```dart
final preferences = await SharedPreferences.getInstance();

// set value
preferences.setValue('String', 'String'),
preferences.setValue('bool', false),
preferences.setValue('int', 2),
preferences.setValue('double', 2.5),
preferences.setValue('list', <String>['foo', 'bar']),

// get value
preferences.getValue('String', defaultValue: 'value');
preferences.getValue('bool', defaultValue: false);
preferences.getValue('int', defaultValue: 0);
preferences.getValue('double', defaultValue: 3.9);
preferences.getValue('list', defaultValue: <String>[]);
```

**Before:**
```dart
final preferences = await SharedPreferences.getInstance();

// set value
preferences.setString('String', 'String'),
preferences.setBool('bool', false),
preferences.setInt('int', 2),
preferences.setDouble('double', 2.5),
preferences.setStringList('list', <String>['foo', 'bar']),

// get value
preferences.getString('String') ?? 'value';
preferences.getBool('bool') ?? false;
preferences.getInt('int') ?? 0;
preferences.getDouble('double') ?? 3.9;
preferences.getStringList('list') ?? <String>[];
```

# Install

Add it in your `pubspec.yaml`:

```yaml
dependencies:
  shared_preferences_dtx:
    git: git@github.com:zambiee/dtx.git
    ref: shared_preferences_dtx-v1.0.0
    path: /packages/other_packages/shared_preferences_dtx
```

Import it where you want to use it.

```dart
import "package:shared_preferences_dtx/shared_preferences_dtx.dart";
```
