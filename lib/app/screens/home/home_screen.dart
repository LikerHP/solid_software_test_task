import 'dart:math' as math;

import 'package:flutter/material.dart';

const double _textFontSize = 24.0;

///Widget that represents UI of main screen.
class HomeScreen extends StatefulWidget {
  /// Creating an instance of HomeScreen widget
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Initialization of variables that contains colors
  ///for screen background and text,
  ///and set them to default [Colors.black] values.
  Color backgroundColor = Colors.black;
  Color textColor = Colors.black;

  @override
  void initState() {
    backgroundColor = generateRandomBackgroundColor();
    textColor = checkWhichTextColorIsNeeded(backgroundColor.computeLuminance());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => updateScreenState(),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: backgroundColor,
              ),
            ),
            Center(
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _textFontSize,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Returns random color for background by tap on screen
  Color generateRandomBackgroundColor() {
    final Color newBackgroundColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return newBackgroundColor;
  }

  ///Check if background color is dark or bright
  ///and sets text color.
  ///This helps text to be readable despite on background color.
  Color checkWhichTextColorIsNeeded(double luminance) {
    final Color newTextColor = luminance < 0.2 ? Colors.white : Colors.black;

    return newTextColor;
  }

  ///Notify the framework that state of the screen is changed and
  ///apply changes to widgets.
  void updateScreenState() {
    setState(() {
      backgroundColor = generateRandomBackgroundColor();
      textColor =
          checkWhichTextColorIsNeeded(backgroundColor.computeLuminance());
    });
  }
}
