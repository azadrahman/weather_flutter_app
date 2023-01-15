import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  String url;
  WeatherApi({required this.url});

  Future getWeatherData() async{
    try{
      http.Response res = await http.get(Uri.parse(url));
      var decodedData = jsonDecode(res.body);
      return decodedData;
    }catch(e){
      print(e);
    }
  }
}