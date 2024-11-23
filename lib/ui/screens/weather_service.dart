import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = '22c97c406a4c949c734b810a72469087'; // Replace with your OpenWeatherMap API key

  Future<Map<String, dynamic>> fetchWeather(double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'), // Added units=metric for Celsius
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> fetchWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'), // Added units=metric for Celsius
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // New method to fetch weather for Ahmedabad
  Future<double?> fetchAhmedabadTemperature() async {
    const String cityName = 'Ahmedabad'; // Default city name
    final weatherData = await fetchWeatherByCity(cityName);
    if (weatherData != null) {
      return weatherData['main']['temp']; // Return the temperature
    }
    return null; // In case of an error or no data
  }
}
