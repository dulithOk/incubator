import 'package:flutter/material.dart';
import 'configh.dart'; // Import the configure.dart file
import 'current.dart'; // Import the configure.dart file
import 'history.dart'; // Import the history.dart file

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Set the background color to green
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.green, // Set the app bar color to green
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the configure page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ConfigurePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set button background color to white
                foregroundColor: Colors.green, // Set button text color to green
                minimumSize: Size(200, 50), // Set minimum button size
              ),
              child: const Text('Configure'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the current page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CurrentPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set button background color to white
                foregroundColor: Colors.green, // Set button text color to green
                minimumSize: Size(200, 50), // Set minimum button size
              ),
              child: const Text('Current'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the history page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const History()),
                );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set button background color to white
                foregroundColor: Colors.green, // Set button text color to green
                minimumSize: Size(200, 50), // Set minimum button size
              ),
              child: const Text('History'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set button background color to white
                foregroundColor: Colors.green, // Set button text color to green
                minimumSize: Size(200, 50), // Set minimum button size
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.green), // set the icon for logout button
                  SizedBox(width: 8.0),
                  Text('Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pushReplacementNamed('/login'); // Navigate to the login page
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
