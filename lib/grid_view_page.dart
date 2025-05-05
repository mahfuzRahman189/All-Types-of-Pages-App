

import 'package:flutter/material.dart';

import 'country.dart';


class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the grid view page
      appBar: AppBar(
        title: const Text('Country Grid View'),
      ),
      // Body containing the GridView
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0), // Add padding around the grid
        // Define grid layout properties
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Horizontal space between items
          mainAxisSpacing: 10.0, // Vertical space between items
          childAspectRatio: 3 / 2, // Aspect ratio of each item (width / height)
        ),
        // Number of items in the grid
        itemCount: sampleCountries.length,
        // Builder function for each grid item
        itemBuilder: (context, index) {
          final country = sampleCountries[index];
          return Card( // Use Card for each grid item
            elevation: 3, // Add some shadow
            child: InkWell( // Make the card tappable
             onTap: () {
                // Optional: Add action when a grid item is tapped
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${country.name}')),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                children: <Widget>[
                  // Display the flag
                  Text(
                    country.flag,
                    style: const TextStyle(fontSize: 40), // Larger flag for grid
                  ),
                  const SizedBox(height: 8), // Space between flag and name
                  // Display the country name
                  Text(
                    country.name,
                    textAlign: TextAlign.center, // Center text
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}