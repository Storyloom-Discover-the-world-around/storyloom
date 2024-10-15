import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key, required this.socials});

  final List<String> socials;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Follow Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
