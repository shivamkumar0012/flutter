// import 'package:flutter/material.dart';
// import 'package:flutterpage1/second.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class WeatherApp extends StatefulWidget {
//   const WeatherApp({Key? key}) : super(key: key);
//   @override
//   State<WeatherApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<WeatherApp> {
//   @override
//   Widget build(BuildContext cntext) {
//     return MaterialApp(
//       title: 'Gilman weather data..',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           leading: new IconButton(
//             icon: new Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyAppSecondPage()),
//             ),
//           ),
//           title: Text('Gilman Weather Data'),
//         ),
//         body: BodyWidget(),
//       ),
//     );
//   }
// }

// class BodyWidget extends StatefulWidget {
//   @override
//   BodyWidgetState createState() {
//     return new BodyWidgetState();
//   }
// }

// class BodyWidgetState extends State<BodyWidget> {
//   final TextEditingController _controller1 = TextEditingController();
//   String serverResponse = 'Server Response';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: SizedBox(
//           width: 200,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: _controller1,
//                 decoration: const InputDecoration(hintText: 'Enter Country'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 child: Text('send request to server'),
//                 onPressed: () {
//                   _makeGetRequest(_controller1.text);
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(serverResponse),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _makeGetRequest(String country) async {
//     final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=' +
//         country +
//         '&units=metric&APPID=2fef41d71a80d0b3d49cd2fb39b95aa6');
//     Response response = await http.get(url);
//     setState(() {
//       serverResponse = response.body;
//     });
//   }
// }

// class Weather {
//   Weather({required this.name, required this.desc, required this.temp});
//   final String name; // non-nullable
//   final String desc; // non-nullable
//   final String temp; // nullable

//   factory Weather.fromJson(Map<String, dynamic> data) {
//     final name = data['name'] as String; // cast as non-nullable String
//     final desc = data['desce'] as String; // cast as non-nullable String
//     final temp = data['temp'] as String; // cast as nullable int
//     return Weather(name: name, desc: desc, temp: temp);
//   }
// }

import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterpage1/second.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  State<WeatherApp> createState() => _MyAppState();
}

class _MyAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext cntext) {
    return MaterialApp(
      title: 'Gilman weather data..',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAppSecondPage()),
            ),
          ),
          title: Text('Gilman Weather Data'),
        ),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  BodyWidgetState createState() {
    return new BodyWidgetState();
  }
}

class BodyWidgetState extends State<BodyWidget> {
  final TextEditingController _controller1 = TextEditingController();
  String serverResponse1 = '';
  String serverResponse2 = '';
  String serverResponse3 = '';
  String serverResponse4 = '';
  String serverResponse5 = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          // alignment: Alignment.topCenter,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(hintText: 'Enter Country'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('send request to server'),
                  onPressed: () {
                    _makeGetRequest(_controller1.text);
                  },
                ),
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '\n\n' +
                          '<b>Position : </b>' +
                          serverResponse1 +
                          '\n\n' +
                          'Description : ' +
                          serverResponse2 +
                          '\n\n' +
                          'Wind: ' +
                          serverResponse3 +
                          '\n\n' +
                          'Temprature: ' +
                          serverResponse4 +
                          '\n\n' +
                          'Place: ' +
                          serverResponse5,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ));
  }

  _makeGetRequest(String country) async {
    // List<Weather> list;
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=' +
        country +
        '&units=metric&APPID=2fef41d71a80d0b3d49cd2fb39b95aa6');
    Response response = await http.get(url);
    setState(() {
      // if (response.statusCode == 200) {
      var data = json.decode(response.body);
      serverResponse1 = data["coord"].toString();
      serverResponse2 = data["weather"].toString();
      serverResponse3 = data["wind"].toString();
      serverResponse4 = data["main"].toString();
      serverResponse5 = data["name"].toString();
      // print(serverResponse1);
      // serverResponse1 =
      //     rest.map<Weather>((json) => Weather.fromJson(json)).toString();
      // return list;
      // }
      // print("List Size: ${list.length}");

      // var data = response.body;
      // var rest = data["coord"] as List;
    });
  }
}

class Weather {
  Weather({required this.coord});
  final String coord; // non-nullable
  // final String desc; // non-nullable
  // final String temp; // nullable

  factory Weather.fromJson(Map<String, dynamic> data) {
    final coord = data['coord']; // cast as non-nullable String
    // final desc = data['desc'] as dynamic; // cast as non-nullable String
    // final temp = data['temp'] as dynamic; // cast as nullable int
    return Weather(coord: coord);
  }
}
