import 'package:flutter/material.dart';

class ForktailStoryCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String country;
  final String description;

  const ForktailStoryCardWidget({
    required this.image,
    required this.title,
    required this.country,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/forktale', arguments: country);
      },
      child: SizedBox(
        height: 250, // Height greater than width
        width: 350, // Width of the card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.black,
          elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                // Background image (top portion)
                Expanded(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
                // Content container (bottom portion)
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Description
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      // Read More link
                      GestureDetector(
                        onTap: () {
                          // Action for "Read More"
                          Navigator.pushNamed(context, '/forktale',
                              arguments: country);
                        },
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
