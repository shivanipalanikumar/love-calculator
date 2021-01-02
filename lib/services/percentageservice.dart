import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/reponse.dart';

Future<Response> calculateLove(String boy, String girl) {
  final Map<String, String> headers = {
    "x-rapidapi-key": "6a5640f000msh225738551f62ef9p1dc2e9jsnb2dd8535eb8b",
		"x-rapidapi-host": "love-calculator.p.rapidapi.com"
  };
  final String url = "https://love-calculator.p.rapidapi.com/getPercentage?" +
      'fname=' +
      boy +
      '&sname=' +
      girl;
  return http.get(url, headers: headers).then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      return Response.fromJson(jsonData);
    }
  }).catchError((e) {
    print(e.toString());
  });
}