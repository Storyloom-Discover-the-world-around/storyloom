import 'package:flutter/material.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({super.key, required this.title, required this.links});

  final List<String> links;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        ...links.map(
          (e) => Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              e,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
