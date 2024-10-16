import 'package:flutter/material.dart';
import 'package:storyloom/widgets/social_media_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 0, 0, 1),
          Color.fromRGBO(17, 24, 39, 1),
          Color.fromRGBO(0, 0, 0, 1),
        ]),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "© 2024 StoryLoom. All rights reserved.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          SocialMediaWidget(
            socials: {
              'instagram': 'https://instagram.com/_storyloom_',
              'twitter': 'https://twitter.com/storyloom',
              'github':
                  'https://github.com/Storyloom-Discover-the-world-around/',
            },
          ),
        ],
      ),
    );
  }
}
