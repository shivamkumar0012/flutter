// import 'package:accidentregisterform/passangerform.dart';
// import 'package:accidentregisterform/pedestrainform.dart';
// import 'package:accidentregisterform/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutterpage1/pasangerform.dart';
import 'package:flutterpage1/pedestrainform.dart';
import 'package:flutterpage1/vehicle.dart';

/// This Widget is the main application widget.
// ignore: must_be_immutable
class AccidentMore extends StatelessWidget {
  const AccidentMore({Key? key}) : super(key: key);
  // int id = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Report No:'),
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
        child: Column(
      children: <Widget>[
        Container(
          width: 300,
          height: 200,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromARGB(255, 238, 232, 232),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  // leading: Icon(Icons.album, size: 60),
                  title: Text('Vehicle Form',
                      style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  // subtitle: Text('',
                  //     style: TextStyle(fontSize: 18.0)),
                ),
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('About'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VehiclePage()),
                        );
                      },
                    ),
                    RaisedButton(
                      child: const Text('View'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VehiclePage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 300,
          height: 200,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromARGB(255, 238, 232, 232),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  // leading: Icon(Icons.album, size: 60),
                  title: Text('Passanger Form',
                      style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  // subtitle: Text('',
                  //     style: TextStyle(fontSize: 18.0)),
                ),
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('About'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PassangerPage()),
                        );
                      },
                    ),
                    RaisedButton(
                      child: const Text('View'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PassangerPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 300,
          height: 200,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromARGB(255, 238, 232, 232),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  // leading: Icon(Icons.road, size: 60),
                  title: Text('Pedestrain Form',
                      style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  // subtitle: Text('',
                  //     style: TextStyle(fontSize: 18.0)),
                ),
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('About'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PedestrainPage()),
                        );
                      },
                    ),
                    RaisedButton(
                      child: const Text('View'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PedestrainPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
