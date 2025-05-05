
import 'package:flutter/material.dart';

import 'country.dart';

// List View Page Widget
class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the list view page
      appBar: AppBar(
        title: const Text('Country List View'),
      ),
      // Body containing the ListView
      body: ListView.builder(
        // Number of items in the list
        itemCount: sampleCountries.length,
        // Builder function for each list item
        itemBuilder: (context, index) {
          final country = sampleCountries[index];
          return Card( // Wrap ListTile in a Card for better visual separation
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              // Leading widget: Display the flag
              leading: Text(
                country.flag,
                style: const TextStyle(fontSize: 30), // Make flag larger
              ),
              // Title widget: Display the country name
              title: Text(country.name),
              // Optional: Add subtitle or trailing widgets if needed
              // subtitle: Text('Capital: ...'),
              // trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Optional: Add action when a list item is tapped
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${country.name}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
