
import 'package:flutter/material.dart';
import 'package:untitled1/model/weather_model.dart';
import 'package:untitled1/service/weatherdata.dart';
import 'package:untitled1/page/login.dart';


class HomeState extends StatefulWidget {
  final String valueFromHome;
  const HomeState({super.key, required this.valueFromHome});
  //
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<HomeState> {

  Weather weather =Weather();
  WeatherService client =WeatherService();

  late String city;
  late String lat;
  late String long;
  late String discription_1;
  late String discription_2;
  late String temp;
  late String wind;
  late String himid;
  late String location;


  @override
  void initState() {
    // TODO: implement initState
    location=widget.valueFromHome;
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async{
    weather =await client.getWeatherData(location);

    setState(() {
      city=weather.city.toString();
      lat =weather.lat.toString();
      long =weather.long.toString();
      discription_1 =weather.discription_1.toString();
      discription_2 =weather.discription_2.toString();
      temp =weather.temp.toString();
      wind =weather.wind.toString();
      himid =weather.himid.toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('weatherMap',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          actions: [IconButton(onPressed: () {
            Navigator.of(context).pop(MyHomePage);
          }, icon: Icon(Icons.search))],
          automaticallyImplyLeading: false,
        ),body:

          Container(
          height: double.infinity,
          width: double.infinity,

          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/login.jpg'), fit: BoxFit.cover),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.blueAccent,Colors.white])),
          child: Column(
            children: [
          displaybuil(),
            ],
          ),
        ));
  }


  Widget searchTap() {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Ex.กรุงเทพ',
              border: OutlineInputBorder(),
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
  Widget  displaybuil() {
      return Container(
         padding: EdgeInsets.all(10),
         margin: EdgeInsets.all(10),
         child: Center(
             child: Column(
               children: [
                 Text(
                   "${city}",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 50,
                       color: Colors.white70),
                 ),
                 SizedBox(height: 15),
                 Text(
                   '${temp}'+'°',
                   style: TextStyle(
                       fontWeight: FontWeight.bold, fontSize: 55, color: Colors.white),
                 ),
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                         child: Icon(
                              (double.parse(temp) >30
                               ? Icons.sunny
                               : double.parse(temp) > 15
                               ? Icons.cloud
                               : Icons.cloudy_snowing),
                         size: 120,
                           color: Colors.white,
                      ),
                     ),
                     Container(
                       width: 160,
                       child: Column(

                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             '${discription_1}',
                             style:
                             TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),
                           ),
                           Text(
                             '${discription_2}',
                             style: TextStyle(fontSize: 20 ,color: Colors.black87,fontWeight: FontWeight.bold,),
                           )
                         ],
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 50),
                 Container(
                   // margin: EdgeInsets.all(20),
                   color: Colors.white,

                   padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                   child: Column(
                     children: [
                       SizedBox(height: 10),
                       Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Humidity',
                                 style:
                                 TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                               ),
                               Text('${himid}', style: TextStyle(fontSize: 20)),
                             ],
                           ),
                           SizedBox(height: 10),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Wind',
                                 style:
                                 TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                               ),
                               Text('${wind}', style: TextStyle(fontSize: 20)),
                             ],
                           ),
                           SizedBox(height: 20),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Latiture',
                                 style:
                                 TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                               ),
                               Text('${lat}', style: TextStyle(fontSize: 20)),
                             ]

                           ),
                           SizedBox(height: 20),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   'Lontiture',
                                   style:
                                   TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                 ),
                                 Text('${long}', style: TextStyle(fontSize: 20)),
                               ]

                           )
                         ],
                       ),
                     ],
                   ),
                 )
               ],
             )),
       );
  }
}

