import 'dart:math' as math;

import 'package:flutter/material.dart';

const double _textFontSize = 24.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color? screenColor;
  Color? textColor;

  @override
  void initState() {
    screenColor = generateRandomColor();
    textColor = checkWhichTextColorIsNeeded(screenColor!.computeLuminance());

    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => updateScreenState(),
        child: Stack(
          children: [
            buildColorScreen(),
            buildScreenText(),
          ],
        ),
      ),
    );
  }

  Widget buildColorScreen() {
    return Positioned(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: screenColor,
      ),
    );
  }

  Widget buildScreenText() {
    return Positioned.fill(
        child: Center(
      child: Text(
        'Hello there',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: _textFontSize,
          color: textColor,
        ),
      ),
    ));
  }

  Color generateRandomColor() {
    final Color newScreenColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    checkWhichTextColorIsNeeded(newScreenColor.computeLuminance());

    return newScreenColor;
  }

  Color checkWhichTextColorIsNeeded(double luminance) {
    final Color newTextColor = luminance < 0.2 ? Colors.white : Colors.black;

    return newTextColor;
  }

  void updateScreenState() {
    setState(() {
      screenColor = generateRandomColor();
      textColor = checkWhichTextColorIsNeeded(screenColor!.computeLuminance());
    });
  }
}
