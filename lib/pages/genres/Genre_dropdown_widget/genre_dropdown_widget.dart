import 'package:flutter/material.dart';

class GenreDropdown extends StatelessWidget {
  final String selectedGenre;
  final Function(String) onChanged;

  GenreDropdown(
      {super.key, required this.selectedGenre, required this.onChanged});

  final List<String> genres = [
    'All',
    'Adventure',
    'Romance',
    'Fantasy',
    'Mystery',
    'Horror'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: const BoxDecoration(
          color: Colors.black54 // Background color with opacity
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.grey[850], // Dark background for dropdown items
          value: selectedGenre,
          onChanged: (String? newGenre) {
            if (newGenre != null) {
              onChanged(newGenre);
            }
          },
          icon: const Icon(Icons.arrow_drop_down,
              color: Colors.white), // Custom dropdown arrow
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16), // Text style for dropdown items
          items: genres.map<DropdownMenuItem<String>>((String genre) {
            return DropdownMenuItem<String>(
              value: genre,
              child: Text(
                genre,
                style: const TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
