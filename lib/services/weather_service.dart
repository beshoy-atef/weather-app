import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'ce00cb5a0f4a4b0792e125301222810';
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromjson(data);
    } catch (e) {
      const SnackBar(content: Text('city name is wrong'));
    }
    return weather;
  }
}
