import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';
import 'loginfordoctoe.dart';

// import 'nextpage.dart';

Future<Album> createAlbum(String hid, String hname, String hphoneno,
    String haddress, String hcapacity, String htype) async {
  final response = await http.post(
    Uri.parse('http://192.168.68.100:3100/api/auth/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      'hid': hid,
      'hname': hname,
      'hphoneno': hphoneno,
      'haddress': haddress,
      'hcapacity': hcapacity,
      'htype': htype
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
  final String hid;
  final String hname;
  final String hphoneno;
  final String haddress;
  final String hcapacity;
  final String htype;

  const Album(
      {required this.hid,
      required this.hname,
      required this.hphoneno,
      required this.haddress,
      required this.hcapacity,
      required this.htype});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        hid: json['hid'],
        hname: json['hname'],
        hphoneno: json['hphoneno'],
        haddress: json['haddress'],
        hcapacity: json['hcapacity'],
        htype: json['htype']

        // phoneno: json['phoneno']
        // phoneno: json['phoneno']
        );
  }
}

class SignupDoctor extends StatefulWidget {
  const SignupDoctor({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<SignupDoctor> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Signup'),
        ),
        body: SingleChildScrollView(
          // alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller1,
          decoration: const InputDecoration(hintText: 'Hospital Id'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller2,
          decoration: const InputDecoration(hintText: 'Hospital Name'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller3,
          decoration: const InputDecoration(hintText: 'Hospital phoneno'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller4,
          decoration: const InputDecoration(hintText: 'Hospital Address'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller5,
          decoration: const InputDecoration(hintText: 'Hospital Capacity'),
        ),
        SizedBox(height: 20),
        SizedBox(height: 20),
        TextField(
          controller: _controller6,
          decoration: const InputDecoration(hintText: 'Hospital Type'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(
                  _controller1.text,
                  _controller2.text,
                  _controller3.text,
                  _controller4.text,
                  _controller5.text,
                  _controller6.text);
              // Navigator.pushNamed(context, 'nextpage');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SecondScreen()),
              // );
            });
          },
          child: const Text('Create Data'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage1()),
                );
              },
              child: new Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            )
          ],
        )
      ],
    );
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
