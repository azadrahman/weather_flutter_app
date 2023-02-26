import 'package:flutter/cupertino.dart';
import 'package:weather/services/geo_distance.dart';
import 'package:weather/services/location.dart';

const apiUrl = 'http://10.11.13.1:3401/geo-distance';

class GeoDistanceModel {
  Future<dynamic> fetchDistance(BuildContext context) async {
    Location location = Location();
    await location.getLocation(context);
    GeoDistanceApi geoDistanceApi = GeoDistanceApi(
        url: '$apiUrl/${location.latitude}/${location.longitude}');
    var distanceData = geoDistanceApi.getGeoDistance();
    return distanceData;
  }
}
