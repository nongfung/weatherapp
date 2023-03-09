//import 'dart:convert'as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/model/weather_model.dart';


class WeatherService {
  Future <Weather> getWeatherData(String? location) async {
    var url = Uri.parse( "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=608e426b5e9a49810abbe6a910121472&units=metric");
    var resposne = await http.get(url);
    print(url.toString());
    var body =  jsonDecode(resposne.body)as Map<String, dynamic>;
    //Weather weather = Weather.fromJson(body);
    //print(resposne.statusCode.toString());
    return Weather.fromJson(body);
  }
}
