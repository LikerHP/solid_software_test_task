import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';

class App extends StatelessWidget {
   const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wow app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}