import 'package:flutter/material.dart';
import 'package:test_task/app/screens/home/home_screen.dart';

/// App is the root widget of whole app.
/// This widget return MaterialApp widget that contains specific information
/// about app theme, localizations, app routing etc.
class App extends StatelessWidget {
  ///Create an instance of App widget
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wow app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
