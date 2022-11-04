import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context, listen: true).weatherData ==
                    null
                ? Colors.blue
                : Provider.of<WeatherProvider>(
                    context,
                  ).weatherData!.getTheme(),
      ),
      home: const HomePage(),
    );
  }
}
