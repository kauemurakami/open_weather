part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoadLocationEvent extends HomeEvent {}

class HomeLoadWeatherEvent extends HomeEvent {
  final double lat, lon;

  HomeLoadWeatherEvent({required this.lat, required this.lon});
}

class HomeDeniedLocationEvent extends HomeEvent {}
