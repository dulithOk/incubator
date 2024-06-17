import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'configh.dart';
import 'current.dart';
import 'history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Set the initial route to the login page
      routes: {
        '/login': (context) => const LoginPage(),// Add route for login Page
        '/home': (context) => const HomePage(),// Add route for home Page
        '/configure': (context) => const ConfigurePage(), // Add route for Configure Page
        '/current': (context) => const CurrentPage(), // Add route for Current Page
        '/history' : (context) => const History(), // add route for the history page
      },
    );
  }
}
