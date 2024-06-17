import 'package:flutter/material.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Total seed count:',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Germinated Seed count:',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Germinated percentage',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 32.0), // Add some spacing before buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Cancel button pressed
                    Navigator.of(context).pop(); // Go back to the previous page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Set button background color to black
                    foregroundColor: Colors.white, // Set button text color to white
                    minimumSize: const Size(120, 50), // Set minimum button size
                  ),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16.0), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Refresh button pressed
                    // Implement your refresh logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Set button background color to black
                    foregroundColor: Colors.white, // Set button text color to white
                    minimumSize: const Size(120, 50), // Set minimum button size
                  ),
                  child: const Text('Refresh'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
