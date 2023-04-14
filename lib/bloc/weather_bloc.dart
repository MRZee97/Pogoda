import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pogoda/data/server_interaction.dart';
part 'weather_event.dart';
part 'weather_state.dart';
class WeatherBloc extends Bloc<WeatherEvent,  WeatherState> {
  // объявление методов
  final ServerInteraction _serverInteraction;
  WeatherBloc({required ServerInteraction serverInteraction}) : _serverInteraction = serverInteraction,
  super(WeatherStateInitial()) {
  on<WeatherEvent>(
  (event, emit) async {
    // обработка события нажатия на кнопку
  if (event is WeatherSearchButtonPressed) {
    // Загрузка
    emit(WeatherStateLoading());

    try {
      // запрос к api на погоду по введеному городу
      final result = await _serverInteraction.getWeatherByCity(event.city);
      // сортировка
      List temps = [
        result["list"][0]["main"]["temp"],
        result["list"][1]["main"]["temp"],
        result["list"][2]["main"]["temp"],
      ];
      List windSpeeds = [
        result["list"][0]["wind"]["speed"],
        result["list"][1]["wind"]["speed"],
        result["list"][2]["wind"]["speed"],
      ];
      List humidities = [
        result["list"][0]["main"]["humidity"],
        result["list"][1]["main"]["humidity"],
        result["list"][2]["main"]["humidity"]
      ];

      // возвращение загруженных дпанных
      emit(WeatherStateLoaded(temps:temps, windSpeeds:windSpeeds, humidities:humidities));
    } catch(e){
      //состояние ошибки
      emit(WeatherStateError());
    }
  }
  },
  );
  }
}