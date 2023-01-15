import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/services/weather_model.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async{
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(weatherData: weatherData,)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      ),
      ),
    );
  }
}
