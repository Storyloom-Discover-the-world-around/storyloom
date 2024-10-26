import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class FlexWidget extends StatelessWidget {
  const FlexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30, // Fixed height
      width: double.infinity, // Takes full width of the screen
      color: Colors.transparent, // Transparent background
      child: Marquee(
        text:
            'Discover the Magic        Explore New Stories        Uncover Hidden Gems        Dive into Adventures        Join the Community',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 50.0,
        velocity: 100.0,
        startPadding: 10.0,
        accelerationDuration: const Duration(seconds: 0),
        accelerationCurve: Curves.linear,
      ),
    );
  }
}
