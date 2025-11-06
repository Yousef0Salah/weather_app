import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;
  String? icon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      icon: jsonData['condition']['icon'],
    );
  }
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  
  MaterialColor getColors() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.yellow;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers') {
      return Colors.blue;
    } else {
      return Colors.yellow;
    }
  }
}
