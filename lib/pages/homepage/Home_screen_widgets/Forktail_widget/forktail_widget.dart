import 'package:flutter/material.dart';
import 'Forktail_card_widget/forktail_card_widget.dart';

class ForktailWidget extends StatelessWidget {
  const ForktailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Explore the World Around',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Discover folktales from different cultures and immerse yourself in their magic.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Lighter text to match dark theme
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Adjust spacing before the cards
            // Use a fixed height for the GridView
            SizedBox(
              height: 400, // Set a height for the grid
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  ForktailCardWidget(
                    image:
                        'https://i.pinimg.com/236x/54/93/22/549322041d3eb23527fbf1d5e1d4bafa.jpg',
                    title: 'Russia',
                    country: 'Russia',
                  ),
                  ForktailCardWidget(
                    image:
                        'https://i.pinimg.com/564x/0e/c7/aa/0ec7aa1383c347acb0b1a91bf506f51b.jpg',
                    title: 'Germany',
                    country: 'Germany',
                  ),
                  ForktailCardWidget(
                    image:
                        'https://i.pinimg.com/564x/a7/87/8d/a7878d054c0c281018d5b08049d9f0d7.jpg',
                    title: 'France',
                    country: 'France',
                  ),
                  ForktailCardWidget(
                    image:
                        'https://i.pinimg.com/564x/fc/87/6a/fc876ac2ec535f0e964da8b04b914248.jpg',
                    title: 'Spain',
                    country: 'Spain',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
