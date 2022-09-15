
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {

  @override
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {
}

class WeatherStateLoading extends WeatherState {}
class WeatherStateLoaded extends WeatherState {
  WeatherStateLoaded({required this.temps, required this.windSpeeds, required this.humidities});
  List temps;
  List windSpeeds;
  List humidities;
}
class WeatherStateError extends WeatherState {}
