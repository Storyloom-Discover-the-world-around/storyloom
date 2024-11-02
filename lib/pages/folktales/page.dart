import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storyloom/pages/folktales/forktales_dropdown_widget/forktales_dropdown_widget.dart';
import 'package:storyloom/pages/folktales/forktales_screen_widgets/forktale_story_card/forktale_story_card_widget.dart';

class FolktalesPage extends StatefulWidget {
  const FolktalesPage({Key? key}) : super(key: key);

  @override
  FolktalesPageState createState() => FolktalesPageState();
}

class FolktalesPageState extends State<FolktalesPage> {
  String selectedCountry = 'All';
  List<dynamic> stories = [];

  @override
  void initState() {
    super.initState();
    loadStories();
  }

  Future<void> loadStories() async {
    try {
      final String response = await rootBundle.loadString('/folkTails.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        stories = data;
      });
    } catch (e) {
      // Handle error (e.g., show a message)
      print('Error loading stories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final filteredStories = stories.where((story) {
      return selectedCountry == 'All' || story['genre'] == selectedCountry;
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.125),
            Text(
              '$selectedCountry Folktales',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ForktalesDropdown(
              selectedCountry: selectedCountry,
              onChanged: (newCountry) {
                setState(() {
                  selectedCountry = newCountry;
                });
              },
            ),
            const SizedBox(height: 20),
            ...filteredStories.map((story) {
              String storySnippet =
                  story['story']['en'].substring(0, 20) + '...';

              return Column(
                children: [
                  ForktailStoryCardWidget(
                    image: story['image'],
                    title: story['title'],
                    country: story['genre'],
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
