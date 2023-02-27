import 'package:flutter/material.dart';
import 'package:untitled1/page/home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var texteditController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Text(
                'Weather',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Card(
                    margin: EdgeInsets.all(30),
                    // color: Colors.white,
                    child: Column(
                      children: [
                        //TextFieldSearch(initialList: dummyList, label: label  , controller: myController,),
                        frombuilt()
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  Widget frombuilt() {
    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: texteditController,
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'location name'),
            ),
            // Padding(padding: EdgeInsets.all(5))
            // ,TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //       hintText: 'Password'
            //   ),
            // ),
            // Padding(padding: EdgeInsets.all(5)),
            // TextButton(onPressed: (){}, child: Container(color: Colors.orangeAccent,child: Text('Login'),))
            Center(
              child: TextButton(
                  onPressed: () {
                    var homeRounte=new MaterialPageRoute(builder:
                    (BuildContext context)=>HomeState(
                      valueFromHome: texteditController.text,
                    ),);
                    Navigator.of(context).push(homeRounte);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //   return HomeState();
                    // }));
                  },
                  child: Container(
                    color: Colors.orange,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'search',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )),
            )
          ],
        ));
  }
}
