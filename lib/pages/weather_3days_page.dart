import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../data/server_interaction.dart';

class Weather3DaysPage extends StatefulWidget {
  Weather3DaysPage({Key? key, required this.state}) : super(key: key);
  WeatherStateLoaded state;

  @override
  State<Weather3DaysPage> createState() => _Weather3DaysPageState();
}

class _Weather3DaysPageState extends State<Weather3DaysPage> {
  late List<WeatherDay> sortDays = [];
  late List sortTemp = [];



  @override
  void initState() {
    super.initState();
  //из состояния достаем данных о погоде
    final day1 = WeatherDay(temp: widget.state.temps[0], humadity:widget.state.humidities[0],  windSpeed:widget.state.windSpeeds[0], );
    final day2 =  WeatherDay(temp: widget.state.temps[1], humadity:widget.state.humidities[1],  windSpeed:widget.state.windSpeeds[1], );
    final day3 = WeatherDay(temp: widget.state.temps[2], humadity:widget.state.humidities[2],  windSpeed:widget.state.windSpeeds[2], );


    // сортировка от меньшего к большему по температруе
    sortDays = [day1, day2, day3];
    sortDays.sort((a, b) => (a as WeatherDay).temp.compareTo((b as WeatherDay).temp) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:   AppBar(
        ),
        body: Column(
                children: [
                  Text('Temperature:'),
                  Text((sortDays[0]).temp.toString()),
                  Text('Humidity:'),
                  Text((sortDays[0]).humadity.toString()),
                  Text('Wind speed:'),
                  Text((sortDays[0]).windSpeed.toString()),
                  SizedBox(height: 20),
                  Text('second day'),
                  Text((sortDays[1]).temp.toString()),
                  Text((sortDays[1]).humadity.toString()),
                  Text((sortDays[1]).windSpeed.toString()),
                  SizedBox(height: 20),
                  Text('third day'),
                  Text((sortDays[2]).temp.toString()),
                  Text((sortDays[2]).humadity.toString()),
                  Text((sortDays[2]).windSpeed.toString()),
                ],
              ));

  }
}

//класс для описания каждого дня
class WeatherDay {
  WeatherDay({required this.temp, required this.humadity, required this.windSpeed});
 final temp;
 final humadity;
 final windSpeed;
}
