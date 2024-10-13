import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importing the login screen
import 'home_screen.dart'; // Importing the home screen

void main() {
  // Entry point of the app
  runApp(MyApp()); // Run the MyApp widget as the root of the application
}

// MyApp is the root widget for the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Medication App', // Title of the app, used by Android task switcher
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set a blue color theme
        useMaterial3:
            true, // Use Material Design 3 (the latest version for modern UI)
      ),
      initialRoute: '/', // Set the initial route to be the login screen
      routes: {
        '/': (context) => LoginScreen(), // Define route for the login screen
        '/home': (context) => HomeScreen(), // Define route for the home screen
      },
    );
  }
}
