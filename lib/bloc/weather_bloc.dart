import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pogoda/data/server_interaction.dart';
part 'weather_event.dart';
part 'weather_state.dart';
class WeatherBloc extends Bloc<WeatherEvent,  WeatherState> {
  final ServerInteraction serverInteraction;
  WeatherBloc({required this.serverInteraction}) :
  super(WeatherStateInitial()) {
  on<WeatherEvent>(
  (event, emit) async {
  if (event is WeatherSearchButtonPressed) {
    emit(WeatherStateLoading());

    try {
      final result = await serverInteraction.getWeatherByCity(event.city);

      List temps = [
        result["list"][0]["main"]["temp"],
        result["list"][1]["main"]["temp"],
        result["list"][2]["main"]["temp"],
      ];
      // print(temps);
      List windSpeeds = [
        result["list"][0]["wind"]["speed"],
        result["list"][1]["wind"]["speed"],
        result["list"][2]["wind"]["speed"],
      ];
      print(windSpeeds);
      List humidities = [
        result["list"][0]["main"]["humidity"],
        result["list"][1]["main"]["humidity"],
        result["list"][2]["main"]["humidity"]
      ];

      emit(WeatherStateLoaded(temps:temps, windSpeeds:windSpeeds, humidities:humidities));
      // print(result["list"]);

      // if(temps.isNotEmpty && windSpeeds.isNotEmpty && humidities.isNotEmpty){
      //
      // } else{
      //   emit(WeatherStateError());
      // }

    } catch(e){
      emit(WeatherStateError());
    }
  }
  },
  );
  }
}