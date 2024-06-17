import 'package:flutter/material.dart';
import 'database_config.dart'; // Import the database helper

class ConfigurePage extends StatefulWidget {
  const ConfigurePage({super.key});

  @override
  _ConfigurePageState createState() => _ConfigurePageState();
}

class _ConfigurePageState extends State<ConfigurePage> {
  // This class manages the state of the configPage and instance of DatabaseHelper for handling database-related operations
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _lightLevelController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configure Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _temperatureController,
                decoration: InputDecoration(
                  labelText: 'Temperature',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                 // set the validation for temperature
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the temperature';
                  } else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _humidityController,
                decoration: InputDecoration(
                  labelText: 'Humidity',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                 // set the validation for humidity
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the humidity';
                  } else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _lightLevelController,
                decoration: InputDecoration(
                  labelText: 'Light Level',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                 // set the validation for light level
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the light level';
                  } else if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    double temperature = double.parse(_temperatureController.text);
                    double humidity = double.parse(_humidityController.text);
                    double lightLevel = double.parse(_lightLevelController.text);

                    await _databaseHelper.insertData(temperature, humidity, lightLevel);
                    // show dialog box after data save successfully
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('Data saved successfully!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set button background color to green
                  foregroundColor: Colors.white, // Set button text color to white
                  minimumSize: const Size(200, 50), // Set minimum button size
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
