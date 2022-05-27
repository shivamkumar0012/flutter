// ignore_for_file: deprecated_member_use

// import 'package:eventform/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'homepage.dart';
import 'accidentstart.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<LoginPage> {
  // For CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailController.text;
    String phoneno = phoneController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    // var url = 'http://192.236.160.238/api/auth/login';

    // Store all data with Param Name.
    // var data = ;

    // Starting Web API Call.
    final response = await http.post(
      Uri.parse('http://192.168.68.103:2400/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'email': email,
        'phoneno': phoneno,
        'password': password
      }),
    );
    print({'email': email, 'phoneno': phoneno, 'password': password});

    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    print(message);

    // If the Response Message is Matched.
    if (message['success']) {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Home & Sending Email to Next Screen.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = true;
      });

      // Showing Alert Dialog with Response JSON Message.
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: new Text(message),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/img1.jpg'),
                radius: 60.0,
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter  Email'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Enter Phoneno'),
              autofocus: false,
              // obscureText: true,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Enter Password'),
              autofocus: false,
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green)),
              onPressed: userLogin,
              child: Text('login'),
              color: Colors.green,
              minWidth: 300.0,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: new Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
        // ],
      ),
      // ),
    );
  }
}
