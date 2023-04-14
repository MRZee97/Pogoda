
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {

  @override
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {
}

// состояние загрузки
class WeatherStateLoading extends WeatherState {}

// загруженное
class WeatherStateLoaded extends WeatherState {
  WeatherStateLoaded({required this.temps, required this.windSpeeds, required this.humidities});
  List temps;
  List windSpeeds;
  List humidities;
}
// состояние ошибки
class WeatherStateError extends WeatherState {}
