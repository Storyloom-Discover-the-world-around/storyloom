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
            SizedBox(

              height: 800, // Set a height for the grid
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  CategoriesCardWidget(
                      image:
                          'https://storyloom.in/_next/image?url=%2Fadventure.jpg&w=1920&q=75',
                      title: 'Adventure',
                      category: "Adventure"),
                  CategoriesCardWidget(
                      image:
                          'https://storyloom.in/_next/image?url=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1527628173875-3c7bfd28ad78%3Fq%3D80%26w%3D1887%26auto%3Dformat%26fit%3Dcrop%26ixlib%3Drb-4.0.3%26ixid%3DM3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%253D%253D&w=1920&q=75',
                      title: 'Romance',
                      category: "Romance"),
                  CategoriesCardWidget(
                      image:
                          'https://storyloom.in/_next/image?url=%2Ffantasy.jpg&w=1920&q=75',
                      title: 'Fantasy',
                      category: "Fantasy"),
                  CategoriesCardWidget(
                      image:
                          'https://storyloom.in/_next/image?url=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1589874186480-ecd085096d68%3Fq%3D80%26w%3D1887%26auto%3Dformat%26fit%3Dcrop%26ixlib%3Drb-4.0.3%26ixid%3DM3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%253D%253D&w=1920&q=75',
                      title: 'Science Fiction',
                      category: "Science Fiction"),
                  CategoriesCardWidget(
                      image:
                          'https://i.pinimg.com/236x/54/93/22/549322041d3eb23527fbf1d5e1d4bafa.jpg',
                      title: 'Adventure',
                      category: "Adventure"),
                  CategoriesCardWidget(
                      image:
                          'https://i.pinimg.com/236x/54/93/22/549322041d3eb23527fbf1d5e1d4bafa.jpg',
                      title: 'Adventure',
                      category: "Adventure"),
                  CategoriesCardWidget(
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
