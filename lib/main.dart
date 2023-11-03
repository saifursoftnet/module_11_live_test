import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomeScreen(),
      title: 'Module-11_Live-Test',
    );
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenIU();
}

class HomeScreenIU extends State<HomeScreen>{
  final List<Weather> weatherInfo = [
    Weather (
      city: "NEW YORK",
      temperature: 20,
      condition: "CLEAR",
      humidity: 60,
      windSpeed: 5.5,
    ),

    Weather (
      city: "LOS ANGELES",
      temperature: 25,
      condition: "SUNNY",
      humidity: 50,
      windSpeed: 6.8,
    ),

    Weather (
      city: "LONDON",
      temperature: 15,
      condition: "PARTLY CLOUDY",
      humidity: 70,
      windSpeed: 4.2,
    ),

    Weather (
      city: "TOKYO",
      temperature: 28,
      condition: "RAINY",
      humidity: 75,
      windSpeed: 8.0,
    ),

    Weather (
      city: "SYDNEY",
      temperature: 22,
      condition: "CLOUDY",
      humidity: 55,
      windSpeed: 7.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Information App'),
      ),

      body: ListView.builder(
        itemCount: weatherInfo.length,
        itemBuilder: (context, index) {
          Weather weather = weatherInfo[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: ${weather.city}'),
                  Text('Temperature: ${weather.temperature}°C'),
                  Text('Condition: ${weather.condition}'),
                  Text('Humidity: ${weather.humidity}%'),
                  Text('Wind Speed: ${weather.windSpeed} km/h'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Weather{
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather( {
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,

  }
  );

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}
