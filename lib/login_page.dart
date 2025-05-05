

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key to manage form state
  final _formKey = GlobalKey<FormState>();
  // Text editing controllers for input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Function to handle login attempt
  void _login() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // If valid, show a snackbar (replace with actual login logic later)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging In... (No backend)')),
      );
      // You would typically call an authentication service here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the login page
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      // Body of the login page
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Email/Username input field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email or Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or username';
                  }
                  // Add more specific email validation if needed
                  return null;
                },
              ),
              const SizedBox(height: 15),
              // Password input field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // Hide password text
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Login button
              ElevatedButton(
                onPressed: _login, // Call login function on press
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 15),
              // Link to Signup page
              TextButton(
                onPressed: () {
                  // Navigate to Signup page, replacing the current route
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
