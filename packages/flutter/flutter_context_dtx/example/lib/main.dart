import 'package:example/pages/focus_scope.dart';
import 'package:example/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_dtx/flutter_context_dtx.dart';

void main() => runApp(const MyApp());

class Routes {
  static const focusScope = '/focusScopePage';
  static const form = '/formPage';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white24,
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.blue),
        ),
      ),
      home: const HomePage(),
      routes: {
        Routes.focusScope: (_) => const FocusScopePage(),
        Routes.form: (_) => const FormPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.pushNamed(Routes.form),
                child: Text(
                  'Form Example',
                  style: context.headline6TextStyle,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.pushNamed(Routes.focusScope),
                child: Text(
                  'Focus Scope Example',
                  style: context.headline6TextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
