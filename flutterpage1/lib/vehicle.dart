import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'login.dart';

// import 'nextpage.dart';

Future<Album> createAlbum(
    String report_Id,
    String vehicle_category,
    String hit_run,
    String vehicle_number,
    String vehicle_type,
    String drink,
    String cell_phone,
    String vehicle_Speed,
    String license_No,
    String license_issue_date,
    String license_expiry_date) async {
  final response = await http.post(
    Uri.parse('http://192.168.68.101:2400/api/auth/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      'report_Id': report_Id,
      'vehicle_category': vehicle_category,
      'hit_run': hit_run,
      'vehicle_number': vehicle_number,
      'vehicle_type': vehicle_type,
      'drink': drink,
      'cell_phone': cell_phone,
      'vehicle_Speed': vehicle_Speed,
      'license_No': license_No,
      'license_issue_date': license_issue_date,
      'license_expiry_date': license_expiry_date
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print('result ' + '$Album.fromJson(jsonDecode(response.body))');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String report_Id;
  final String vehicle_category;
  final String hit_run;
  final String vehicle_number;
  final String vehicle_type;
  final String drink;
  final String cell_phone;
  final String vehicle_Speed;
  final String license_No;
  final String license_issue_date;
  final String license_expiry_date;

  const Album(
      {required this.report_Id,
      required this.vehicle_category,
      required this.hit_run,
      required this.vehicle_number,
      required this.vehicle_type,
      required this.drink,
      required this.cell_phone,
      required this.vehicle_Speed,
      required this.license_No,
      required this.license_issue_date,
      required this.license_expiry_date});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        report_Id: json['report_Id'],
        vehicle_category: json['vehicle_category'],
        hit_run: json['hit_run'],
        vehicle_number: json['vehicle_number'],
        vehicle_type: json['vehicle_type'],
        drink: json['drink'],
        cell_phone: json['cell_phone'],
        vehicle_Speed: json['vehicle_Speed'],
        license_No: json['license_No'],
        license_issue_date: json['license_issue_date'],
        license_expiry_date: json['license_expiry_date']

        // phoneno: json['phoneno']
        // phoneno: json['phoneno']
        );
  }
}

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<VehiclePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();

  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Vehicle Form'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  SingleChildScrollView buildColumn() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        // child: SingleChildScrollView(
        // children: <Widget>[],
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Report Id'),
        ),
        TextField(
          controller: _controller1,
          decoration: const InputDecoration(hintText: 'Vehicle category'),
        ),

        TextField(
          controller: _controller2,
          decoration: const InputDecoration(hintText: 'Hit & Run'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller3,
          decoration: const InputDecoration(hintText: 'Vehicle Number'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller4,
          decoration: const InputDecoration(hintText: 'Vehicle Type'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller5,
          decoration: const InputDecoration(
              hintText: 'Vehicle Damage Reason(Drunk/Non Drunk)'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller6,
          decoration: const InputDecoration(
              hintText: 'Cell Phone While Accident(Yes/No)'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller7,
          decoration: const InputDecoration(hintText: 'Vehicle Speed'),
        ),
        Column(
          children: <Widget>[
            // Text('Person Form..')
            TextField(
              controller: _controller8,
              decoration: const InputDecoration(hintText: 'License No..'),
            ),

            SizedBox(height: 20),
            TextField(
              controller: _controller9,
              decoration: const InputDecoration(hintText: 'License Issue Date'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller10,
              decoration:
                  const InputDecoration(hintText: 'License Expiry Date'),
            ),
            const SizedBox(height: 20),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(
                  _controller.text,
                  _controller1.text,
                  _controller2.text,
                  _controller3.text,
                  _controller4.text,
                  _controller5.text,
                  _controller6.text,
                  _controller7.text,
                  _controller8.text,
                  _controller9.text,
                  _controller10.text);
            });
          },
          child: const Text('Submit'),
        ),
        // ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Already have an account?"),
        //     new GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => ),
        //         );
        //       },
        //       child: new Text(
        //         "Login",
        //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        //       ),
        //     )
        //   ],
        // )
      ],
    ));
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        print('snapshot :=>' + '${snapshot}');
        if (snapshot.hasData) {
          return Text('Welcome');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
