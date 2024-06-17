import 'package:flutter/material.dart';

class History extends StatelessWidget {

  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Graph Displaying History Data',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // Space between the title and the placeholder box
            Container(
              width: 300,
              height: 200,
              // set the graph box decoration
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Graph Placeholder',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
