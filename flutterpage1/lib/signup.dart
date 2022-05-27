import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

// import 'nextpage.dart';

Future<Album> createAlbum(
    String email, String phoneno, String password, String cpassword) async {
  final response = await http.post(
    Uri.parse('http://192.168.68.103:2400/api/auth/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      'email': email,
      'phoneno': phoneno,
      'password': password,
      'cpassword': cpassword
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
  final String email;
  final String phoneno;
  final String password;
  final String cpassword;

  const Album(
      {required this.email,
      required this.phoneno,
      required this.password,
      required this.cpassword});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        email: json['email'],
        phoneno: json['phoneno'],
        password: json['password'],
        cpassword: json['cpassword']

        // phoneno: json['phoneno']
        // phoneno: json['phoneno']
        );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<SignupPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

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
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller2,
          decoration: const InputDecoration(hintText: 'phoneno'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller3,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _controller4,
          decoration: const InputDecoration(hintText: 'Repeat password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller1.text, _controller2.text,
                  _controller3.text, _controller4.text);
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
