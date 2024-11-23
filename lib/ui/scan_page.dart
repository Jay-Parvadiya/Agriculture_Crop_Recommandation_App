import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flut/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  // Controllers to capture user input
  final TextEditingController nitrogenController = TextEditingController();
  final TextEditingController phosphorusController = TextEditingController();
  final TextEditingController potassiumController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();

  String displayText = 'Enter the details to predict the crop';
  bool isLoading = false;

  // Function to send input data to the Flask API and get recommendation
  Future<void> getRecommendation() async {
    if (nitrogenController.text.isEmpty ||
        phosphorusController.text.isEmpty ||
        potassiumController.text.isEmpty ||
        temperatureController.text.isEmpty ||
        humidityController.text.isEmpty ||
        phController.text.isEmpty ||
        rainfallController.text.isEmpty) {
      setState(() {
        displayText = 'Please fill in all fields.';
      });
      return;
    }

    setState(() {
      isLoading = true;
      displayText = '';
    });

    final url = Uri.parse('https://api-smart-agriculture-crop.onrender.com/predict');
    final headers = {
      'accept': 'application/json',
      'x-api-key': 'c9f8b4a0ff0c4c4dbd1a809e83d4c4a7',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'Nitrogen': double.parse(nitrogenController.text),
      'Phosporus': double.parse(phosphorusController.text),
      'Potassium': double.parse(potassiumController.text),
      'Temperature': double.parse(temperatureController.text),
      'Humidity': double.parse(humidityController.text),
      'pH': double.parse(phController.text),
      'Rainfall': double.parse(rainfallController.text),
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          displayText = jsonResponse.containsKey('crop')
              ? 'Predicted Crop: ${jsonResponse['crop']}'
              : 'Error: No "crop" in response';
        });
      } else {
        setState(() {
          displayText = 'Error: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        displayText = 'Error: Unable to connect to the server: $e';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crop Recommendation System',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              _buildInputField(
                controller: nitrogenController,
                label: 'Nitrogen',
                hint: 'Enter Nitrogen value',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: phosphorusController,
                label: 'Phosphorus',
                hint: 'Enter Phosphorus value',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: potassiumController,
                label: 'Potassium',
                hint: 'Enter Potassium value',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: temperatureController,
                label: 'Temperature (°C)',
                hint: 'Enter Temperature value in °C',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: humidityController,
                label: 'Humidity (%)',
                hint: 'Enter Humidity value in %',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: phController,
                label: 'pH',
                hint: 'Enter pH value',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: rainfallController,
                label: 'Rainfall (mm)',
                hint: 'Enter Rainfall value in mm',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : getRecommendation,
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Get Recommendation',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  backgroundColor: Constants.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  displayText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Constants.primaryColor.withOpacity(0.05),
      ),
    );
  }
}
