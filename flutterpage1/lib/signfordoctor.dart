import 'package:flutterpage1/login.dart';
import 'package:flutterpage1/loginfordoctoe.dart';
import 'package:flutterpage1/reviewpatient.dart';
import 'package:flutterpage1/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.137.1:2400/api/auth/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String email;
  final String password;

  const Album({
    required this.email,
    required this.password,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      email: json['email'],
      password: json['password'],
    );
  }
}

class Signfordoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(
                //         image:DecorationImage(image: AssetImage('assets/images/img1.png'))
                //       ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hello There!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Automatic identity verification which enable you to verify your identity",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/hospital1.png'))),
                            ),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage1()),
                                );
                              },
                              color: Colors.indigoAccent[400],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white70),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15)),
                            // Padding(padding: EdgeInsets.only(top: 15)),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReviewPatientPage()),
                                );
                              },
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "Review Patient Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // MaterialButton(
                            //   minWidth: double.infinity,
                            //   height: 60,
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const SignupPage()),
                            //     );
                            //   },
                            //   color: Colors.redAccent,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(40)),
                            //   child: Text(
                            //     "Sign UP",
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 16,
                            //     ),
                            //   ),
                            // ),
                          ]),
                    ]))));
  }
}
