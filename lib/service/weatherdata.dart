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

// Future<List<Weather>> WeatherData() async {
//   List<Weather> WeatherMap = [];
//   var url = Uri.http('https://api.openweathermap.org/data/2.5/weather?q=bangkok&appid=608e426b5e9a49810abbe6a910121472');
//   print(url.toString());
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     try {
//       var jsonResponse =
//       convert.jsonDecode(response.body) as Map<String, dynamic>;
//       List list = jsonResponse['result'];
//       print(list);
//       WeatherMap = list.map((json) => Weather.fromJson(json)).toList();
//     } catch (ex) {
//       print(ex.toString());
//       throw ex.toString();
//     }
//     // print(jsonResponse.values);
//   } else {
//     throw ("เชื่อมต่อServer ล้มเหลว");
//   }
//   return WeatherMap;
// }

// class WeatherService {
//   Future<Weather> getWeatherData(String location) async {
//     var url = Uri.parse( "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=608e426b5e9a49810abbe6a910121472&units=metric");
//     var response =await http.get (url);
//     print(url.toString());
//     if(response.statusCode==200){
//       return Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>) ;
//     }else{
//       throw Exception("Can not get weather");
//     }
//   }
// }