import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstansts {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static String apiKey = dotenv.get('WEATHER_API_KEY');
}
