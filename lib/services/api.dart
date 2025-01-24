import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_wheater/constants/api_constansts.dart';
import 'package:open_wheater/models/weather.dart';

class MyAPI {
  fetchWeather(double lat, double lon) async {
    final Uri uri = Uri.parse('${ApiConstansts.baseUrl}?lat=$lat&lon=$lon&appid=${ApiConstansts.apiKey}&units=metric');
    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('An error occurred when data.');
    }
  }
}
