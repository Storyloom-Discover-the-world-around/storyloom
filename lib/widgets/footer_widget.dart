import 'package:flutter/material.dart';
import 'package:storyloom/widgets/links_widget.dart';
import 'package:storyloom/widgets/social_media_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375,
          height: 1000,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(17, 24, 39, 1),
            Color.fromRGBO(0, 0, 0, 1)
          ])),
        ),
        const FadedWidget(),
      ],
    );
  }
}

class FadedWidget extends StatelessWidget {
  const FadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 65,
        ),
        Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "StoryLoom is your go-to platform for discovering and sharing captivating stories. Explore a world of fiction and non-fiction, translated into multiple languages, and immerse yourself in the magic of storytelling.",
          style: TextStyle(
            color: Colors.white30,
            fontSize: 14.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LinksWidget(
          title: "Quick Links",
          links: ["Home", "Stories", "Contact"],
        ),
        SizedBox(height: 25),
        LinksWidget(
          title: "Folktales",
          links: [
            "Russian",
            "German",
            "French",
            "Spanish",
            "Japanese",
            "Indian"
          ],
        ),
        SizedBox(height: 25),
        LinksWidget(
          title: "Genres",
          links: [
            "Adventure",
            "Romance",
            "Mystery",
            "Fantasy",
            "Science Fiction",
            "Thriller",
            "Horror",
            "Comedy"
          ],
        ),
        SizedBox(height: 25),
        SocialMediaWidget(socials: ['x', 'instagram']),
        SizedBox(height: 25),
        Divider(thickness: 1, color: Color.fromRGBO(75, 85, 99, 1)),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "© 2024 StoryLoom. All rights reserved.",
            style: TextStyle(
              color: Color.fromRGBO(75, 85, 99, 1),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
