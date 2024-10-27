import 'package:flutter/material.dart';
import 'package:storyloom/pages/folktales/forktales_dropdown_widget/forktales_dropdown_widget.dart';
import 'package:storyloom/pages/folktales/forktales_screen_widgets/forktale_story_card/forktale_story_card_widget.dart';

class FolktalesPage extends StatefulWidget {
  const FolktalesPage({super.key});

  @override
  FolktalesPageState createState() => FolktalesPageState(); // Made public
}

class FolktalesPageState extends State<FolktalesPage> {
  // Made public
  String selectedCountry = 'All';

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
            const ForktailStoryCardWidget(
              image:
                  "https://i.pinimg.com/564x/ca/a6/b7/caa6b7765a6c9f19b355f44bb0d561b2.jpg",
              title: "The Firebird",
              country: "Russia",
              description: "Once upon a time, in a faraway kingdom, there...",
            ),
            const SizedBox(height: 16),
            const ForktailStoryCardWidget(
              image:
                  "https://i.pinimg.com/564x/ca/a6/b7/caa6b7765a6c9f19b355f44bb0d561b2.jpg",
              title: "The Firebird",
              country: "Russia",
              description: "Once upon a time, in a faraway kingdom, there...",
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
