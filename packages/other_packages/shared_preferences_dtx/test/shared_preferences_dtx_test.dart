import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_dtx/shared_preferences_dtx.dart';

void main() {
  group('SharedPreferencesExtensions', () {
    late SharedPreferences preferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      preferences = await SharedPreferences.getInstance();
    });

    tearDown(() => preferences.clear());

    test('reading default value', () {
      expect(preferences.getOrElse<String>('String', defaultValue: 'String'),
          'String');
      expect(preferences.getOrElse<bool>('bool', defaultValue: false), false);
      expect(preferences.getOrElse<int>('int', defaultValue: 2), 2);
      expect(preferences.getOrElse<double>('double', defaultValue: 2.5), 2.5);
      expect(
          preferences.getOrElse<List<String>>('list',
              defaultValue: <String>['foo', 'bar']),
          <String>['foo', 'bar']);
    });

    test('writing and reading', () async {
      await Future.wait([
        preferences.setValue<String>('String', 'String'),
        preferences.setValue<bool>('bool', false),
        preferences.setValue<int>('int', 2),
        preferences.setValue<double>('double', 2.5),
        preferences.setValue<List<String>>('list', <String>['foo', 'bar'])
      ]);

      expect(preferences.getValue<String>('String'), 'String');
      expect(preferences.getValue<bool>('bool'), isFalse);
      expect(preferences.getValue<int>('int'), 2);
      expect(preferences.getValue<double>('double'), 2.5);
      expect(
          preferences.getValue<List<String>>('list'), <String>['foo', 'bar']);
    });

    test('writing and reading without explicit types', () async {
      await Future.wait([
        preferences.setValue('String', 'String'),
        preferences.setValue('bool', false),
        preferences.setValue('int', 2),
        preferences.setValue('double', 2.5),
        preferences.setValue('list', <String>['foo', 'bar']),
      ]);

      expect(preferences.getOrElse('String', defaultValue: 'test'), 'String');
      expect(preferences.getOrElse('bool', defaultValue: true), false);
      expect(preferences.getOrElse('int', defaultValue: 10), 2);
      expect(preferences.getOrElse('double', defaultValue: 12.5), 2.5);
      expect(preferences.getOrElse('list', defaultValue: <String>['foo']),
          <String>['foo', 'bar']);
    });

    test('throwing exception with type incompatible', () {
      expect(
        () => preferences.getValue('String'),
        throwsAssertionError,
      );
      expect(
        () => preferences.getValue<SharedPreferences>('value'),
        throwsArgumentError,
      );
      expect(
        () => preferences.getOrElse<SharedPreferences>('value',
            defaultValue: preferences),
        throwsArgumentError,
      );
      expect(
        () =>
            preferences.setValue<SharedPreferences>('preferences', preferences),
        throwsArgumentError,
      );
      expect(
        () =>
            preferences.setValue<SharedPreferences>('preferences', preferences),
        throwsArgumentError,
      );
      expect(
        () => preferences.setValue<dynamic>('preferences', preferences),
        throwsArgumentError,
      );
    });
  });
}
