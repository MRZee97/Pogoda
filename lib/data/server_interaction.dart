import 'dart:convert';

import "package:http/http.dart" as http;

// константная ссылка
class Links {
  static  baseUrl(String city){
    return "https://api.openweathermap.org/data/2.5/forecast?q=$city&exclude=current,hourly,minutely,alerts&units=metric&appid=e026b73a10a8fe8deaa00fcdb9eb14a8";
  }
}

class ServerInteraction {
  Future<dynamic> getWeatherByCity(String city) async{
    Uri url = Uri.parse(Links.baseUrl(city));
 // сетевая обраокта ошибок
    try{
      // запрос на сервер
      final result = await http.get(url);
      // сериализация
      final weatherResult = jsonDecode(result.body);
      // каст в map
      return weatherResult as Map<String, dynamic>;
    }catch(e){
      return 'error';
    }
  }
}