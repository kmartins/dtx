import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_dtx/shared_preferences_dtx.dart';

Future<void> main() async {
  final preferences = await SharedPreferences.getInstance();
  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatefulWidget {
  final SharedPreferences preferences;

  const MyApp({
    Key? key,
    required this.preferences,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final SharedPreferences preferences = widget.preferences;
  late ThemeMode themeMode = preferences.getOrElse(
    'theme_mode',
    defaultValue: ThemeMode.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        preferences: widget.preferences,
        onChangeThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.light) {
              themeMode = ThemeMode.dark;
            } else {
              themeMode = ThemeMode.light;
            }
          });
          preferences.setThemeMode('theme_mode', themeMode);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final SharedPreferences preferences;
  final void Function() onChangeThemeMode;
  const MyHomePage({
    Key? key,
    required this.title,
    required this.preferences,
    required this.onChangeThemeMode,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final SharedPreferences preferences = widget.preferences;
  late int _counter = preferences.getOrElse('count', defaultValue: 0);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    preferences.setInt('count', _counter);
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    preferences.setInt('count', _counter);
  }

  void _clear() {
    setState(() => _counter = 0);
    preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_sharp),
            onPressed: widget.onChangeThemeMode,
          ),
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: () {
              _clear();
              widget.onChangeThemeMode();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
