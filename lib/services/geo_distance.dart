import 'dart:convert';

import 'package:http/http.dart' as http;

class GeoDistanceApi {
  String url;
  GeoDistanceApi({required this.url});

  Future<dynamic> getGeoDistance() async {
    try {
      http.Response res = await http.get(Uri.parse(url));
      var decodedData = jsonDecode(res.body);
      return decodedData;
    } catch (err) {
      print("$err");
    }
  }
}
