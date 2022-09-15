import 'dart:convert';

import "package:http/http.dart" as http;

class Links {
  static  baseUrl(String city){
    return "https://api.openweathermap.org/data/2.5/forecast?q=$city&exclude=current,hourly,minutely,alerts&units=metric&appid=e026b73a10a8fe8deaa00fcdb9eb14a8";
  }
}

class ServerInteraction {
  Future<dynamic> getWeatherByCity(String city) async{
    Uri url = Uri.parse(Links.baseUrl(city));
    try{
      final result = await http.get(url);

      final weatherResult = jsonDecode(result.body);
      return weatherResult as Map<String, dynamic>;
    }catch(e){
      return 'error';
    }
  }
}