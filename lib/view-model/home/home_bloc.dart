import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:open_wheater/models/weather.dart';
import 'package:open_wheater/repository/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadLocationEvent>(fetchLocation);
    on<HomeLoadWeatherEvent>(fetchWeather);
  }

  fetchLocation(HomeLoadLocationEvent event, Emitter<HomeState> emit) async {
    bool serviceIsEnable;
    LocationPermission permission;

    serviceIsEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceIsEnable) {
      emit(
        HomeNotAvaibleState(message: 'Location service is not enabled'),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(HomeDeniedState(message: 'Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(HomeDeniedState(message: 'Location permissions are permanently denied, we cannot request permissions.'));
    }

    final Position position = await Geolocator.getCurrentPosition();
    add(HomeLoadWeatherEvent(lat: position.latitude, lon: position.longitude));
  }

  fetchWeather(HomeLoadWeatherEvent event, Emitter<HomeState> emit) async {
    final response = await repository.fetchWeather(event.lat, event.lon);
    emit(HomeLoadedState(weather: response));
  }
}
