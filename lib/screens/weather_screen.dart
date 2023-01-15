import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.weatherData});
  final dynamic weatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late int condition;
  late String cityName;
  late String msgIcon;
  late String weatherMsg;
  late String weatherDescription;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
        if(weatherData == null) {
          temperature = 0;
          msgIcon = 'Error';
          weatherMsg = 'Unable to get weather';
          cityName = '';
          weatherDescription= '';
          return;
        }
        var temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
        msgIcon =  weather.getWeatherIconMsg(condition);
        weatherMsg = weather.temperatureMsg(temperature);
        weatherDescription = weatherData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async{
                    var weatherData = await weather.getLocationWeatherData();
                    updateUI(weatherData);
                  }, child: Icon(Icons.near_me, size: 50,),),
                  TextButton(onPressed: () async{
                    var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                    if(typedName != null) {
                      var weatherData = await weather.getCityWeatherData(typedName);
                      updateUI(weatherData);
                    }
                  }, child: Icon(Icons.location_city, size: 50,),),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Text('$temperature∘', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                    SizedBox(width: 15,),
                    Text('$msgIcon', style: TextStyle(fontSize: 30,),),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Text('$weatherDescription', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('$weatherMsg in $cityName', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
