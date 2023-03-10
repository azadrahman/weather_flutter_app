import 'package:flutter/cupertino.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/weather_api.dart';

const String apiUrl = "https://api.openweathermap.org/data/2.5/weather";
const String apiKey = "aad6f9507bb7faf659b9847a5d657781";

class WeatherModel {
  Future<dynamic> getLocationWeatherData(BuildContext context) async {
    Location location = Location();
    await location.getLocation(context);
    WeatherApi weatherApi = WeatherApi(
        url:
            '$apiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await weatherApi.getWeatherData();
    return weatherData;
  }

  Future<dynamic> getCityWeatherData(String cityName) async {
    var apiurl = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';
    WeatherApi weatherApi = WeatherApi(url: apiurl);
    var weatherData = weatherApi.getWeatherData();
    return weatherData;
  }

  String getWeatherIconMsg(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String temperatureMsg(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
