import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:storyloom/pages/genres/Genre_dropdown_widget/genre_dropdown_widget.dart';
import 'package:storyloom/pages/genres/Genre_story_card_widget/genre_story_card_widget.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  GenresPageState createState() => GenresPageState();
}

class GenresPageState extends State<GenresPage> {
  String selectedGenre = 'All';
  List<dynamic> stories = [];

  @override
  void initState() {
    super.initState();
    loadStories();
  }

  Future<void> loadStories() async {
    final String response = await rootBundle.loadString('/data.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      stories = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final filteredStories = stories.where((story) {
      return selectedGenre == 'All' || story['genre'] == selectedGenre;
    }).toList();

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
            const SizedBox(height: 20),
            GenreDropdown(
              selectedGenre: selectedGenre,
              onChanged: (newGenre) {
                setState(() {
                  selectedGenre = newGenre;
                });
              },
            ),
            const SizedBox(height: 20),
            ...filteredStories.map((story) {
              String storySnippet =
                  story['story']['en'].substring(0, 20) + '...';

              return Column(
                children: [
                  GenreStoryCardWidget(
                    image: story['image'],
                    title: story['title'],
                    genre: story['genre'],
                    description: storySnippet,
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
