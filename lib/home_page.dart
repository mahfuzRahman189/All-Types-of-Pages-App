
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
     
      body: Center(
        // Center the Row horizontally
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Use a Row to place columns side-by-side
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceEvenly, // Distribute space evenly between columns
            children: <Widget>[
              // First Column for Signin/Signup
              Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center, // Center buttons vertically in the column
                children: <Widget>[
                  // Button to navigate to Login Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Optional: Add padding if you want more control over size
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('Sign In Page'), // Changed text
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Spacer between buttons in the column
                  // Button to navigate to Signup Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Optional: Add padding
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('Sign Up Page'), // Changed text
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),

              // Second Column for Listview/Gridview
              Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center, // Center buttons vertically in the column
                children: <Widget>[
                  // Button to navigate to List View Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Optional: Add padding
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('List View'), // Changed text
                    onPressed: () {
                      Navigator.pushNamed(context, '/list');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Spacer between buttons in the column
                  // Button to navigate to Grid View Page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Optional: Add padding
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: const Text('Grid View'), // Changed text
                    onPressed: () {
                      Navigator.pushNamed(context, '/grid');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
