import 'package:flutter/material.dart';

class ForktalesDropdown extends StatelessWidget {
  final String selectedCountry;
  final Function(String) onChanged;

  ForktalesDropdown(
      {super.key, required this.selectedCountry, required this.onChanged});

  final List<String> country = [
    'All',
    'Russia',
    'Japan',
    'France',
    'German',
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
          value: selectedCountry,
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
          items: country.map<DropdownMenuItem<String>>((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(
                country,
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
