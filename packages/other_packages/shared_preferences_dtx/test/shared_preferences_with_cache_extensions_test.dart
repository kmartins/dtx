import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_dtx/shared_preferences_dtx.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class User {
  final String name;
  final int age;

  const User(this.name, this.age);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.name == name && o.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

void main() {
  group('SharedPreferencesWithCacheExtensions', () {
    late SharedPreferencesWithCache preferences;
    const user = User('user', 20);
    final dateTime = DateTime.utc(2022, 07, 12, 03, 04, 05, 99);
    final differentDateTime = DateTime.utc(2021, 01, 26, 03, 04, 05, 99);

    setUp(() async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
      preferences = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(),
      );
    });

    tearDown(() => preferences.clear());

    test('reading default value', () {
      expect(
        preferences.getOrElse<String>('string', defaultValue: 'String'),
        'String',
      );
      expect(preferences.getOrElse<bool>('bool', defaultValue: false), false);
      expect(preferences.getOrElse<int>('int', defaultValue: 2), 2);
      expect(preferences.getOrElse<double>('double', defaultValue: 2.5), 2.5);
      expect(
        preferences.getOrElse<List<String>>(
          'list',
          defaultValue: <String>['foo', 'bar'],
        ),
        <String>['foo', 'bar'],
      );
      expect(
        preferences.getOrElse<Color>('color', defaultValue: Colors.black),
        Colors.black,
      );
      expect(
        preferences.getOrElse<ThemeMode>(
          'theme_mode',
          defaultValue: ThemeMode.dark,
        ),
        ThemeMode.dark,
      );
      expect(
        preferences.getOrElse<DateTime>('date_time', defaultValue: dateTime),
        dateTime,
      );
      final userJson = preferences.getOrElse<Map<String, dynamic>>(
        'user',
        defaultValue: user.toJson(),
      );
      expect(userJson, user.toJson());
      expect(User.fromJson(userJson), user);
    });

    test('writing and reading', () async {
      await Future.wait([
        preferences.setValue<String>('string', 'String'),
        preferences.setValue<bool>('bool', false),
        preferences.setValue<int>('int', 2),
        preferences.setValue<double>('double', 2.5),
        preferences.setValue<List<String>>('list', <String>['foo', 'bar']),
        preferences.setValue<Color>('color', Colors.black),
        preferences.setValue<Map<String, dynamic>>('user', user.toJson()),
        preferences.setValue<ThemeMode>('theme_mode', ThemeMode.system),
        preferences.setValue<DateTime>('date_time', dateTime),
      ]);

      expect(preferences.getValue<String>('string'), 'String');
      expect(preferences.getValue<bool>('bool'), isFalse);
      expect(preferences.getValue<int>('int'), 2);
      expect(preferences.getValue<double>('double'), 2.5);
      expect(
        preferences.getValue<List<String>>('list'),
        <String>['foo', 'bar'],
      );
      expect(preferences.getValue<Color>('color'), Colors.black);
      expect(preferences.getValue<ThemeMode>('theme_mode'), ThemeMode.system);
      expect(preferences.getValue<DateTime>('date_time'), dateTime);
      final userJson = preferences.getValue<Map<String, dynamic>>('user');
      expect(userJson, isNotNull);
      if (userJson != null) {
        expect(User.fromJson(userJson), user);
      }
    });

    test('writing and reading without explicit types', () async {
      await Future.wait([
        preferences.setValue('string', 'String'),
        preferences.setValue('bool', false),
        preferences.setValue('int', 2),
        preferences.setValue('double', 2.5),
        preferences.setValue('list', <String>['foo', 'bar']),
        preferences.setValue('color', Colors.black),
        preferences.setValue('theme_mode', ThemeMode.light),
        preferences.setValue('user', user.toJson()),
        preferences.setValue('date_time', dateTime),
      ]);
      expect(preferences.getOrElse('string', defaultValue: 'test'), 'String');
      expect(preferences.getOrElse('bool', defaultValue: true), false);
      expect(preferences.getOrElse('int', defaultValue: 10), 2);
      expect(preferences.getOrElse('double', defaultValue: 12.5), 2.5);
      expect(
        preferences.getOrElse('list', defaultValue: <String>['foo']),
        <String>['foo', 'bar'],
      );
      expect(
        preferences.getOrElse('color', defaultValue: Colors.white),
        Colors.black,
      );
      expect(
        preferences.getOrElse('theme_mode', defaultValue: ThemeMode.dark),
        ThemeMode.light,
      );
      expect(
        preferences.getOrElse('date_time', defaultValue: differentDateTime),
        dateTime,
      );
      final userJson = preferences.getOrElse(
        'user',
        defaultValue: const User('other', 50).toJson(),
      );
      expect(User.fromJson(userJson), user);
    });

    group('getTypeOrDefault', () {
      test('gets default', () {
        expect(
          preferences.getStringOrElse('string', defaultValue: 'String'),
          'String',
        );
        expect(preferences.getBoolOrElse('bool', defaultValue: false), false);
        expect(preferences.getIntOrElse('int', defaultValue: 2), 2);
        expect(preferences.getDoubleOrElse('double', defaultValue: 2.5), 2.5);
        expect(
          preferences.getStringListOrElse(
            'list',
            defaultValue: <String>['foo', 'bar'],
          ),
          <String>['foo', 'bar'],
        );
        expect(
          preferences.getColorOrElse('color', defaultValue: Colors.black),
          Colors.black,
        );
        expect(
          preferences.getThemeModeOrElse(
            'theme_mode',
            defaultValue: ThemeMode.dark,
          ),
          ThemeMode.dark,
        );
        expect(
          preferences.getDateTimeOrElse('date_time', defaultValue: dateTime),
          dateTime,
        );
        final userJson =
            preferences.getJsonOrElse('user', defaultValue: user.toJson());
        expect(userJson, user.toJson());
        expect(User.fromJson(userJson), user);
      });

      test('gets saved value', () async {
        await Future.wait([
          preferences.setValue('string', 'String'),
          preferences.setValue('bool', false),
          preferences.setValue('int', 2),
          preferences.setValue('double', 2.5),
          preferences.setValue('list', <String>['foo', 'bar']),
          preferences.setValue('color', Colors.black),
          preferences.setValue('theme_mode', ThemeMode.light),
          preferences.setValue('user', user.toJson()),
          preferences.setValue('date_time', dateTime),
        ]);
        expect(
          preferences.getStringOrElse('string', defaultValue: 'test'),
          'String',
        );
        expect(preferences.getBoolOrElse('bool', defaultValue: true), false);
        expect(preferences.getIntOrElse('int', defaultValue: 10), 2);
        expect(preferences.getDoubleOrElse('double', defaultValue: 12.5), 2.5);
        expect(
          preferences
              .getStringListOrElse('list', defaultValue: <String>['foo']),
          <String>['foo', 'bar'],
        );
        expect(
          preferences.getColorOrElse('color', defaultValue: Colors.white),
          Colors.black,
        );
        expect(
          preferences.getThemeModeOrElse(
            'theme_mode',
            defaultValue: ThemeMode.dark,
          ),
          ThemeMode.light,
        );
        expect(
          preferences.getDateTimeOrElse(
            'date_time',
            defaultValue: differentDateTime,
          ),
          dateTime,
        );
        final userJson = preferences.getJsonOrElse(
          'user',
          defaultValue: const User('other', 50).toJson(),
        );
        expect(User.fromJson(userJson), user);
      });
    });

    test('throwing exception with type incompatible', () {
      expect(
        () => preferences.getValue('String'),
        throwsArgumentError,
      );
      expect(
        () => preferences.getValue<SharedPreferencesWithCache>('value'),
        throwsArgumentError,
      );
      expect(
        () => preferences.getOrElse<SharedPreferencesWithCache>(
          'value',
          defaultValue: preferences,
        ),
        throwsArgumentError,
      );
      expect(
        () => preferences.setValue<SharedPreferencesWithCache>(
          'preferences',
          preferences,
        ),
        throwsArgumentError,
      );
      expect(
        () => preferences.setValue<SharedPreferencesWithCache>(
          'preferences',
          preferences,
        ),
        throwsArgumentError,
      );
    });
  });
}
