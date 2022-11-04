import 'package:flutter/material.dart';

class WeatherModel {
  final String date;
  final String weatherStateName;
  final double temp;
  final double maxTemp;
  final double minTeamp;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.maxTemp,
      required this.minTeamp});

  factory WeatherModel.fromjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        weatherStateName: jsondata['condition']['text'],
        temp: jsondata['avgtemp_c'],
        maxTemp: jsondata['maxtemp_c'],
        minTeamp: jsondata['mintemp_c']);
  }
  String getImages() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Patchy light drizzle') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Light rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Blowing snow' ||
        weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Light snow') {
      return 'assets/images/snow.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getTheme() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return Colors.orange;
    } else if (weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Cloudy') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Patchy light drizzle') {
      return Colors.grey;
    } else if (weatherStateName == 'Light rain' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Moderate rain') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Blowing snow' ||
        weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Light snow') {
      return Colors.cyan;
    } else {
      return Colors.blue;
    }
  }
}
