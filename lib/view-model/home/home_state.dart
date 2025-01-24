part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final Weather weather;

  HomeLoadedState({required this.weather});
}

final class HomeNotAvaibleState extends HomeState {
  final String message;

  HomeNotAvaibleState({required this.message});
}

final class HomeDeniedState extends HomeState {
  final String message;

  HomeDeniedState({required this.message});
}
