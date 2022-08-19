import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_mobile_flutter/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endPoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9831b85e6410d2ae724f4f85ddbbde84");
    var response = await http.get(endPoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);
  }
}