import 'package:geolocator/geolocator.dart';

class Location {
   late double longitude;
   late double latitude;

  Future<void> getLocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;

    }catch(e){
      print('error: $e');
    }
  }
}