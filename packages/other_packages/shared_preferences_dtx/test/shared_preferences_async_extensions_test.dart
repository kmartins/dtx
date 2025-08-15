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
  group('SharedPreferencesAsyncAsyncExtensions', () {
    late SharedPreferencesAsync preferences;
    const user = User('user', 20);
    final dateTime = DateTime.utc(2022, 07, 12, 03, 04, 05, 99);
    final differentDateTime = DateTime.utc(2021, 01, 26, 03, 04, 05, 99);

    setUp(() {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
      preferences = SharedPreferencesAsync();
    });

    tearDown(() => preferences.clear());

    test('reading default value', () async {
      final (
        stringValue,
        boolValue,
        intValue,
        doubleValue,
        listStringValue,
        colorValue,
        themeModeValue,
        dateTimeValue,
        userJson
      ) = await (
        preferences.getOrElse<String>('string', defaultValue: 'String'),
        preferences.getOrElse<bool>('bool', defaultValue: false),
        preferences.getOrElse<int>('int', defaultValue: 2),
        preferences.getOrElse<double>('double', defaultValue: 2.5),
        preferences.getOrElse<List<String>>(
          'list',
          defaultValue: <String>['foo', 'bar'],
        ),
        preferences.getOrElse<Color>('color', defaultValue: Colors.black),
        preferences.getOrElse<ThemeMode>(
          'theme_mode',
          defaultValue: ThemeMode.dark,
        ),
        preferences.getOrElse<DateTime>('date_time', defaultValue: dateTime),
        preferences.getOrElse<Map<String, dynamic>>(
          'user',
          defaultValue: user.toJson(),
        ),
      ).wait;
      expect(stringValue, 'String');
      expect(boolValue, false);
      expect(intValue, 2);
      expect(doubleValue, 2.5);
      expect(listStringValue, <String>['foo', 'bar']);
      expect(colorValue, Colors.black);
      expect(themeModeValue, ThemeMode.dark);
      expect(dateTimeValue, dateTime);
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

      final (
        stringValue,
        boolValue,
        intValue,
        doubleValue,
        listStringValue,
        colorValue,
        themeModeValue,
        dateTimeValue,
        userJson
      ) = await (
        preferences.getValue<String>('string'),
        preferences.getValue<bool>('bool'),
        preferences.getValue<int>('int'),
        preferences.getValue<double>('double'),
        preferences.getValue<List<String>>('list'),
        preferences.getValue<Color>('color'),
        preferences.getValue<ThemeMode>('theme_mode'),
        preferences.getValue<DateTime>('date_time'),
        preferences.getValue<Map<String, dynamic>>('user'),
      ).wait;

      // expect(stringValue, 'String');
      expect(boolValue, isFalse);
      expect(intValue, 2);
      expect(doubleValue, 2.5);
      expect(listStringValue, <String>['foo', 'bar']);
      expect(colorValue, Colors.black);
      expect(themeModeValue, ThemeMode.system);
      expect(dateTimeValue, dateTime);
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
      final (
        stringValue,
        boolValue,
        intValue,
        doubleValue,
        listStringValue,
        colorValue,
        themeModeValue,
        dateTimeValue,
        userJson
      ) = await (
        preferences.getOrElse('string', defaultValue: 'test'),
        preferences.getOrElse('bool', defaultValue: true),
        preferences.getOrElse('int', defaultValue: 10),
        preferences.getOrElse('double', defaultValue: 12.5),
        preferences.getOrElse('list', defaultValue: <String>['foo']),
        preferences.getOrElse('color', defaultValue: Colors.white),
        preferences.getOrElse('theme_mode', defaultValue: ThemeMode.dark),
        preferences.getOrElse('date_time', defaultValue: differentDateTime),
        preferences.getOrElse(
          'user',
          defaultValue: const User('other', 50).toJson(),
        ),
      ).wait;

      expect(stringValue, 'String');
      expect(boolValue, false);
      expect(intValue, 2);
      expect(doubleValue, 2.5);
      expect(listStringValue, <String>['foo', 'bar']);
      expect(colorValue, Colors.black);
      expect(themeModeValue, ThemeMode.light);
      expect(dateTimeValue, dateTime);
      expect(userJson, user.toJson());
    });

    group('getTypeOrDefault', () {
      test('gets default', () async {
        final (
          stringValue,
          boolValue,
          intValue,
          doubleValue,
          listStringValue,
          colorValue,
          themeModeValue,
          dateTimeValue,
          userJson
        ) = await (
          preferences.getOrElse<String>('string', defaultValue: 'String'),
          preferences.getOrElse<bool>('bool', defaultValue: false),
          preferences.getOrElse<int>('int', defaultValue: 2),
          preferences.getOrElse<double>('double', defaultValue: 2.5),
          preferences.getOrElse<List<String>>(
            'list',
            defaultValue: <String>['foo', 'bar'],
          ),
          preferences.getOrElse<Color>('color', defaultValue: Colors.black),
          preferences.getOrElse<ThemeMode>(
            'theme_mode',
            defaultValue: ThemeMode.dark,
          ),
          preferences.getOrElse<DateTime>('date_time', defaultValue: dateTime),
          preferences.getOrElse<Map<String, dynamic>>(
            'user',
            defaultValue: user.toJson(),
          ),
        ).wait;

        expect(stringValue, 'String');
        expect(boolValue, false);
        expect(intValue, 2);
        expect(doubleValue, 2.5);
        expect(listStringValue, <String>['foo', 'bar']);
        expect(colorValue, Colors.black);
        expect(themeModeValue, ThemeMode.dark);
        expect(dateTimeValue, dateTime);
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

        final (
          stringValue,
          boolValue,
          intValue,
          doubleValue,
          listStringValue,
          colorValue,
          themeModeValue,
          dateTimeValue,
          userJson
        ) = await (
          preferences.getOrElse<String>('string', defaultValue: 'test'),
          preferences.getOrElse<bool>('bool', defaultValue: true),
          preferences.getOrElse<int>('int', defaultValue: 10),
          preferences.getOrElse<double>('double', defaultValue: 12.5),
          preferences.getOrElse<List<String>>(
            'list',
            defaultValue: <String>['foo'],
          ),
          preferences.getOrElse<Color>('color', defaultValue: Colors.white),
          preferences.getOrElse<ThemeMode>(
            'theme_mode',
            defaultValue: ThemeMode.dark,
          ),
          preferences.getOrElse<DateTime>('date_time', defaultValue: dateTime),
          preferences.getOrElse<Map<String, dynamic>>(
            'user',
            defaultValue: user.toJson(),
          ),
        ).wait;

        expect(stringValue, 'String');
        expect(boolValue, false);
        expect(intValue, 2);
        expect(doubleValue, 2.5);
        expect(listStringValue, <String>['foo', 'bar']);
        expect(colorValue, Colors.black);
        expect(themeModeValue, ThemeMode.light);
        expect(dateTimeValue, dateTime);
        expect(userJson, user.toJson());
        expect(User.fromJson(userJson), user);
      });
    });

    test('throwing exception with type incompatible', () {
      expect(
        () => preferences.getValue('String'),
        throwsArgumentError,
      );
      expect(
        () => preferences.getValue<SharedPreferencesAsync>('value'),
        throwsArgumentError,
      );
      expect(
        () => preferences.getOrElse<SharedPreferencesAsync>(
          'value',
          defaultValue: preferences,
        ),
        throwsArgumentError,
      );
      expect(
        () => preferences.setValue<SharedPreferencesAsync>(
          'preferences',
          preferences,
        ),
        throwsArgumentError,
      );
      expect(
        () => preferences.setValue<SharedPreferencesAsync>(
          'preferences',
          preferences,
        ),
        throwsArgumentError,
      );
    });
  });
}
