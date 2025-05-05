

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Form key to manage form state
  final _formKey = GlobalKey<FormState>();
  // Text editing controllers for input fields
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Function to handle signup attempt
  void _signup() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // If valid, show a snackbar (replace with actual signup logic later)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing Up... (No backend)')),
      );
      // You would typically call a user creation service here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the signup page
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      // Body of the signup page
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Assign form key
          child: ListView( // Use ListView to prevent overflow on smaller screens
            children: <Widget>[
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Username input field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              // Email input field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  // Basic email format check
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                     return 'Please enter a valid email address';
                  }
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
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              // Confirm Password input field
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                // Validation rule
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Signup button
              ElevatedButton(
                onPressed: _signup, // Call signup function on press
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Sign Up'),
              ),
               const SizedBox(height: 15),
              // Link to Login page
              TextButton(
                onPressed: () {
                  // Navigate to Login page, replacing the current route
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
