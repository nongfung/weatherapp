
class Weather {
  late var city;
  late var lat;
  late var long;
  // late var icon;
  late var discription_1;
  late var discription_2;
  late var temp;
  late var wind;
  late var himid;

  Weather(
      {this.city = '-' ,
        this.lat = '-',
        this.long = '-',
        // this.icon = '-',
        this.discription_1 = '-',
        this.discription_2 = '-',
        this.temp ='',
        this.wind = '-',
        this.himid = '-' });


  // Weather.fromJson(Map<String, dynamic> json) {
  //    city = json["name"];
  //    lat = json["coorc"]["lat"];
  //    long = json["coorc"]["lon"];
  //    icon = json["weather"]["icon"] ;
  //    discription_1 = json["weather"]["main"];
  //    discription_2 = json["weather"]["description"] ;
  //    temp = json["main"]["temp"];
  //    wind = json["wind"]["speed"];
  //    himid = json["main"]["humidity"];
  //  }


  factory Weather.fromJson(Map<String, dynamic> json) =>Weather(
      city : json['name'] ?? '-',
       lat : json['coord']['lat'] .toString(),
       long : json['coord']['lon'].toString(),
       discription_1 : json['weather'][0]['main'].toString(),
       discription_2 : json['weather'][0]['description']?? '-',
       temp : json['main']['temp'] .toString(),
       wind : json['wind']['speed']  .toString(),
       himid : json['main']['humidity'] .toString(),
  );

}
