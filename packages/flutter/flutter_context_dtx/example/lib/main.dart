import 'package:flutter/material.dart';
import 'package:flutter_context_dtx/flutter_context_dtx.dart';

import 'pages/focus_scope.dart';
import 'pages/form.dart';

void main() => runApp(const MyApp());

class Routes {
  static const focusScope = '/focusScopePage';
  static const form = '/formPage';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white24,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: Colors.blue),
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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('-----------------------');
    print('Is Phone ${context.isPhoneScreen}');
    print('Is tablet ${context.isTabletScreen}');
    print('Is Laptop ${context.isLaptopScreen}');
    print('Is Desktop ${context.isDesktopScreen}');
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: context.widthBody,
          color: Colors.red,
        ),
      ),
      // body: Center(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[
      //         ElevatedButton(
      //           onPressed: () => context.pushNamed(Routes.form),
      //           child: Text(
      //             'Form Example',
      //             style: context.headline6TextStyle,
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         ElevatedButton(
      //           onPressed: () => context.pushNamed(Routes.focusScope),
      //           child: Text(
      //             'Focus Scope Example',
      //             style: context.headline6TextStyle,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
