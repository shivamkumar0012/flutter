// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterpage1/signfordoctor.dart';
import 'package:flutterpage1/userform1.dart';
import 'package:flutterpage1/userform2.dart';
import 'package:flutterpage1/weather.dart';

import 'loginsignin.dart';

/// This Widget is the main application widget.
class MyAppSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Irad..'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                // borderSide: BorderSide(width: 4.0),
                child: Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: MyCardWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        width: 400,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 247, 247, 246),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.add_road_sharp, size: 40),
                title: Text('Accident', style: TextStyle(fontSize: 25.0)),
                subtitle: Text('For Capture Accident ',
                    style: TextStyle(fontSize: 18.0)),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Form'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Userform1()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: const Text('Video Call..'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 400,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 247, 247, 246),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.health_and_safety, size: 40),
                title: Text('Health', style: TextStyle(fontSize: 25.0)),
                subtitle: Text('For Capture Health ',
                    style: TextStyle(fontSize: 18.0)),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('Form'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Userform2()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: const Text('Video Call..'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 400,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 247, 247, 246),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cloud, size: 40),
                title: Text('Weather', style: TextStyle(fontSize: 25.0)),
                subtitle:
                    Text('live forecast.. ', style: TextStyle(fontSize: 18.0)),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('see weather'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeatherApp()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 400,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 247, 247, 246),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.coronavirus, size: 40),
                title: Text('Covid-19', style: TextStyle(fontSize: 25.0)),
                subtitle:
                    Text('live forecast.. ', style: TextStyle(fontSize: 18.0)),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: const Text('See Information...'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    // ElevatedButton.styleFrom(backgroundColor: Colors.white,textStyle: const TextStyle(fontSize: 20));
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/img1.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(50.0)),
          ElevatedButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromARGB(162, 29, 27, 27)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginSignin()),
              );
            },
            child: const Text('Sigin for Police'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromARGB(162, 29, 27, 27)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signfordoctor()),
              );
            },
            child: const Text('Sigin for Doctor'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromARGB(162, 29, 27, 27)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppSecondPage()),
              );
            },
            child: const Text('Sigin for User'),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Second Route'),

    //   ),
    //   body: Center(

    //   ),
    // );
  }
}
