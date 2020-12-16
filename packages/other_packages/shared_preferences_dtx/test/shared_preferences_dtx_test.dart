import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_dtx/shared_preferences_dtx.dart';

void main() {
  group('SharedPreferencesExtensions', () {
    SharedPreferences preferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      preferences = await SharedPreferences.getInstance();
    });

    tearDown(() => preferences.clear());

    test('reading default value', () {
      expect(preferences.getValue<String>('String', defaultValue: 'String'),
          'String');
      expect(preferences.getValue<bool>('bool', defaultValue: false), false);
      expect(preferences.getValue<int>('int', defaultValue: 2), 2);
      expect(preferences.getValue<double>('double', defaultValue: 2.5), 2.5);
      expect(
          preferences.getValue<List<String>>('list',
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

      expect(preferences.getValue('String', defaultValue: 'Valor'), 'String');
      expect(preferences.getValue('bool', defaultValue: false), isFalse);
      expect(preferences.getValue('int', defaultValue: 0), 2);
      expect(preferences.getValue('double', defaultValue: 3.9), 2.5);
      expect(preferences.getValue('list', defaultValue: <String>[]),
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

    test('throwing exception with null key', () {
      expect(
        () => preferences.setValue<int>(null, 2),
        throwsAssertionError,
      );
      expect(
        () => preferences.getValue<int>(null),
        throwsAssertionError,
      );
    });
  });
}
