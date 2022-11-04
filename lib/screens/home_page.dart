import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';

import 'package:weather/screens/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(
      context,
    ).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return SearchPage();
                  }),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'there is no Weather 😞 Start',
                  style: TextStyle(
                    fontSize: 31,
                  ),
                ),
                Text(
                  'Searching Now 🔎',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData!.getTheme(),
                  weatherData!.getTheme()[400]!,
                  weatherData!.getTheme()[300]!,
                  weatherData!.getTheme()[200]!,
                  weatherData!.getTheme()[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'update : ${weatherData!.date}',
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImages()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('max Temp : ${weatherData!.maxTemp.toInt()}'),
                          Text('min Temp : ${weatherData!.minTeamp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
    );
  }
}
