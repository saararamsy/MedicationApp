import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey for the form to manage the state of the form and its validation
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture the input from email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // To track whether the form is in a loading state (for showing a spinner)
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            // SingleChildScrollView helps when there’s limited screen space (small devices)
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: [
                // App Title
                const Text(
                  'Medication App',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                    height: 8.0), // Spacer between title and subtitle

                // Login Title
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                    height: 32.0), // Spacer between subtitle and form

                // Login Form
                Form(
                  key:
                      _formKey, // Linking the form to the GlobalKey for validation
                  child: Column(
                    children: [
                      // Email Input Field
                      TextFormField(
                        controller:
                            emailController, // Bind emailController to this field
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border:
                              OutlineInputBorder(), // Add border for better styling
                        ),
                        keyboardType:
                            TextInputType.emailAddress, // Use email input type
                        validator: (value) {
                          // Validator to ensure valid email format
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email'; // If empty
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email'; // If not in correct format
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                          height:
                              16), // Spacer between email and password fields

                      // Password Input Field with length validation
                      TextFormField(
                        controller:
                            passwordController, // Bind passwordController to this field
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border:
                              OutlineInputBorder(), // Add border for better styling
                        ),
                        obscureText: true, // Hide password text for security
                        validator: (value) {
                          // Validator to ensure password length
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password'; // If empty
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long'; // Length validation
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32), // Spacer before login button

                      // Show loading spinner if in loading state
                      if (_isLoading)
                        const CircularProgressIndicator(), // Loading indicator when login is processing

                      // Login button appears when not in loading state
                      if (!_isLoading)
                        ElevatedButton(
                          onPressed: () {
                            // Validate form when the login button is pressed
                            if (_formKey.currentState!.validate()) {
                              // Set loading state to true to show spinner
                              setState(() {
                                _isLoading = true; // Set loading state
                              });

                              // Simulate a delay to show the loading indicator (as in a real login scenario)
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading =
                                      false; // End loading state after delay
                                });

                                // Show a success message using SnackBar once login is successful
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Login Successful! Redirecting...'),
                                    backgroundColor: Colors
                                        .green, // Success message in green
                                  ),
                                );

                                // Redirect to home screen after a short delay
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                });
                              });
                            }
                          },
                          child: const Text('Login'), // Text on the button
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
