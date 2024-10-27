import 'package:flutter/material.dart';
import 'package:storyloom/pages/genres/Genre_dropdown_widget/genre_dropdown_widget.dart';
import 'package:storyloom/pages/genres/Genre_story_card_widget/genre_story_card_widget.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  GenresPageState createState() => GenresPageState(); // Made public
}

class GenresPageState extends State<GenresPage> {
  // Made public
  String selectedGenre = 'All'; // Default genre

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.125),

            Text(
              '$selectedGenre Stories',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Add spacing

            GenreDropdown(
              selectedGenre: selectedGenre,
              onChanged: (newGenre) {
                setState(() {
                  selectedGenre = newGenre;
                });
              },
            ),
            const SizedBox(height: 20), // Add spacing

            const GenreStoryCardWidget(
              image:
                  "https://i.pinimg.com/564x/ca/a6/b7/caa6b7765a6c9f19b355f44bb0d561b2.jpg",
              title: "The Firebird",
              genre: "Russia",
              description: "Once upon a time, in a faraway kingdom, there...",
            ),
            const SizedBox(height: 16), // Add spacing between cards
            const GenreStoryCardWidget(
              image:
                  "https://i.pinimg.com/564x/ca/a6/b7/caa6b7765a6c9f19b355f44bb0d561b2.jpg",
              title: "The Firebird",
              genre: "Russia",
              description: "Once upon a time, in a faraway kingdom, there...",
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
