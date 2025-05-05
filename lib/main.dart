
import 'package:flutter/material.dart';


import 'home_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'list_view_page.dart';
import 'grid_view_page.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'All Functions App',
      
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
 
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/list': (context) => const ListViewPage(),
        '/grid': (context) => const GridViewPage(),
      },
    );
  }
}
