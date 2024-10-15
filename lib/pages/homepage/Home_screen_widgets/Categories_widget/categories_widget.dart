import 'package:flutter/material.dart';
import 'package:storyloom/pages/homepage/Home_screen_widgets/Categories_widget/Categiries_card_widget/categiries_card_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

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
              'Choose from Various Categories',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30), // Adjust spacing before the cards
            // Use a fixed height for the GridView
            Container(
              height: 400, // Set a height for the grid
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  CategiriesCardWidget(
                      image:
                          'https://i.pinimg.com/236x/54/93/22/549322041d3eb23527fbf1d5e1d4bafa.jpg',
                      title: 'Adventure',
                      category: "Adventure"),
                  CategiriesCardWidget(
                      image:
                          'https://i.pinimg.com/236x/54/93/22/549322041d3eb23527fbf1d5e1d4bafa.jpg',
                      title: 'Adventure',
                      category: "Adventure"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
