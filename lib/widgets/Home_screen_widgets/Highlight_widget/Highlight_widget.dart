import 'package:flutter/material.dart';
import 'package:storyloom/widgets/links_widget.dart';
import 'package:storyloom/widgets/social_media_widget.dart';

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/highlight.png'), // Path to your image
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
          ),

          // Overlay Container for Text
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.black.withOpacity(0.6),
            child: const Center(
              // Center the text vertically and horizontally
              child: Text(
                'Intriguing Plots and Characters',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:
                      Colors.white, // Ensure the text is visible on the image
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
