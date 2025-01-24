import 'package:open_wheater/services/api.dart';

class HomeRepository {
  //direct instance as an example, you should use a dependency injector
  MyAPI api = MyAPI();
  fetchWeather(double lat, double lon) async => await api.fetchWeather(lat, lon);
}
