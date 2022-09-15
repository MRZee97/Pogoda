import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pogoda/bloc/weather_bloc.dart';
import 'package:pogoda/data/server_interaction.dart';
import 'package:pogoda/pages/weather_3days_page.dart';

class CityWeatherPage extends StatefulWidget {
   CityWeatherPage({Key? key, required this.city}) : super(key: key);
  String city;

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        serverInteraction: ServerInteraction()
      )..add(WeatherSearchButtonPressed(city: widget.city)),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state){
      if(state is WeatherStateLoading){
        return Center(child: CircularProgressIndicator(),);
        } else if(state is WeatherStateLoaded){
        return Scaffold(
          appBar: AppBar(
            title: Text('Click next to see the\n weather for 3 days'),
            actions: [IconButton(
                icon: const Icon(Icons.arrow_forward_rounded),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Weather3DaysPage(state:state as WeatherStateLoaded ),));
                }
            ),
            ],
          ),
          body: Column(
            children: [
              Text('Temperature:'),
              Text(state.temps[0].toString()),
              Text('Humidity:'),
              Text(state.humidities[0].toString()),
              Text('Wind speed'),
              Text(state.windSpeeds[0].toString()),
            ],
          ),
        );
      } else if(state is WeatherStateError){
        return Center(
            child: Text('Error'));
      }
      return Container();
        },

      ),
    );
  }
}

