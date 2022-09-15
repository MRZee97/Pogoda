part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class WeatherSearchButtonPressed extends WeatherEvent {
  WeatherSearchButtonPressed({required this.city});
  String city;
}