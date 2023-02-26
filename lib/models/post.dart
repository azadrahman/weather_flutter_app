import 'dart:convert';

import 'package:http/http.dart' as http;

class PostDto {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDto({this.body, this.title, this.id, this.userId});

  PostDto.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class PostApi {
  Future fetch() async {
    try {
      http.Response res = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      return jsonDecode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
