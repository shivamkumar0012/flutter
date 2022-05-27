import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'login.dart';

// import 'nextpage.dart';

Future<Album> createAlbum(
    String report_Id,
    String pedestrain_name,
    String pedestrain_gender,
    String pedestrain_age,
    String injury_type,
    String mobile_number,
    String nationality,
    String address,
    String nomanee,
    String accident_reason) async {
  final response = await http.post(
    Uri.parse('http://192.168.68.101:2400/api/auth/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      'report_Id': report_Id,
      'pedestrain_name': pedestrain_name,
      'pedestrain_gender': pedestrain_gender,
      'pedestrain_age': pedestrain_age,
      'injury_type': injury_type,
      'mobile_number': mobile_number,
      'naionality': nationality,
      'address': address,
      'nomanee': nomanee,
      'accident_reason': accident_reason,
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
  final String pedestrain_name;
  final String pedestrain_gender;
  final String pedestrain_age;
  final String injury_type;
  final String mobile_number;
  final String nationality;
  final String address;
  final String nomanee;
  final String accident_reason;

  const Album({
    required this.report_Id,
    required this.pedestrain_name,
    required this.pedestrain_gender,
    required this.pedestrain_age,
    required this.injury_type,
    required this.mobile_number,
    required this.nationality,
    required this.address,
    required this.nomanee,
    required this.accident_reason,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        report_Id: json['report_Id'],
        pedestrain_name: json['pedestrain_name'],
        pedestrain_gender: json['pedestrain_gender'],
        pedestrain_age: json['pedestrain_age'],
        injury_type: json['injury_type'],
        mobile_number: json['mobile_number'],
        nationality: json['nationality'],
        address: json['address'],
        nomanee: json['nomanee'],
        accident_reason: json['accident_reason']

        // phoneno: json['phoneno']
        // phoneno: json['phoneno']
        );
  }
}

class PedestrainPage extends StatefulWidget {
  const PedestrainPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<PedestrainPage> {
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
  // final TextEditingController _controller10 = TextEditingController();

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
          title: Text('Pedestrain Form'),
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
          decoration: const InputDecoration(hintText: 'pedestrain Name'),
        ),

        TextField(
          controller: _controller2,
          decoration: const InputDecoration(hintText: 'pedestrain Gender'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller3,
          decoration: const InputDecoration(hintText: 'pedestrain Age'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller4,
          decoration: const InputDecoration(
              hintText: 'Injury Type(Fatal/Serious/Non Serious)'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller5,
          decoration: const InputDecoration(hintText: 'Mobile Number'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller6,
          decoration: const InputDecoration(hintText: 'Nationality'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller7,
          decoration: const InputDecoration(hintText: 'Address'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller8,
          decoration: const InputDecoration(hintText: 'Nomanee'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller9,
          decoration: const InputDecoration(hintText: 'Accident Reason'),
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
                  _controller9.text);
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
