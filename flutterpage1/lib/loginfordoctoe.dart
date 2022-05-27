// // ignore_for_file: deprecated_member_use

// // import 'package:eventform/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterpage1/hospitaldep.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // import 'homepage.dart';
// import 'accidentstart.dart';
// import 'doctorsignup.dart';
// import 'signup.dart';

// class LoginPage1 extends StatefulWidget {
//   const LoginPage1({Key? key}) : super(key: key);

//   @override
//   _SigninState createState() => _SigninState();
// }

// class _SigninState extends State<LoginPage1> {
//   // For CircularProgressIndicator.
//   bool visible = false;

//   // Getting value from TextField widget.
//   final hidcontroller = TextEditingController();
//   final phoneController = TextEditingController();
//   // final hnameController = TextEditingController();
//   // final haddressController = TextEditingController();

//   Future userLogin() async {
//     // Showing CircularProgressIndicator.
//     setState(() {
//       visible = true;
//     });

//     // Getting value from Controller
//     String hid = hidcontroller.text;
//     String hphoneno = phoneController.text;
//     // String hname = hnameController.text;
//     // String haddress = haddressController.text;

//     // SERVER LOGIN API URL
//     // var url = 'http://192.236.160.238/api/auth/login';

//     // Store all data with Param Name.
//     // var data = ;

//     // Starting Web API Call.
//     final response = await http.post(
//       Uri.parse('http://192.168.68.100:3100/api/auth/logindoctor'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: json.encode(<String, String>{'hid': hid, 'hphoneno': hphoneno}),
//     );
//     print({'hid': hid, 'hphoneno': hphoneno});

//     // Getting Server response into variable.
//     var message = jsonDecode(response.body);
//     print(message);

//     // If the Response Message is Matched.
//     if (message['success']) {
//       // Hiding the CircularProgressIndicator.
//       setState(() {
//         visible = false;
//       });

//       // Navigate to Home & Sending Email to Next Screen.
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HospitalDepPage()),
//       );
//     } else {
//       // If Email or Password did not Matched.
//       // Hiding the CircularProgressIndicator.
//       setState(() {
//         visible = true;
//       });

//       // Showing Alert Dialog with Response JSON Message.
//       // showDialog(
//       //   context: context,
//       //   builder: (BuildContext context) {
//       //     return AlertDialog(
//       //       title: new Text(message),
//       //       actions: <Widget>[
//       //         FlatButton(
//       //           child: new Text("OK"),
//       //           onPressed: () {
//       //             Navigator.of(context).pop();
//       //           },
//       //         ),
//       //       ],
//       //     );
//       //   },
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: new IconButton(
//           icon: new Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Login Hospital'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/img1.jpg'),
//                 radius: 60.0,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             TextFormField(
//               controller: hidcontroller,
//               decoration: InputDecoration(labelText: 'Enter  Hospital Id'),
//             ),
//             SizedBox(height: 10.0),
//             TextFormField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: 'Enter Phoneno'),
//               autofocus: false,
//               // obscureText: true,
//             ),
//             SizedBox(height: 10.0),

//             // SizedBox(height: 20.0),
//             // FlatButton(
//             FlatButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18.0),
//                   side: BorderSide(color: Colors.green)),
//               onPressed: userLogin,
//               // onPressed: () {
//               //   Navigator.push(
//               //     context,
//               //     MaterialPageRoute(builder: (context) => HospitalDepPage()),
//               //   );
//               // },
//               child: Text('login'),
//               color: Colors.green,
//               minWidth: 300.0,
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don't have an account?"),
//                 new GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignupDoctor()),
//                     );
//                   },
//                   child: new Text(
//                     "Sign Up",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//         // ],
//       ),
//       // ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

// import 'package:eventform/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'homepage.dart';
// import 'accidentstart.dart';
import 'doctorsignup.dart';
import 'hospitaldep.dart';
// import 'signup.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<LoginPage1> {
  // For CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final hidcontroller = TextEditingController();
  final phoneController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String hid = hidcontroller.text;
    String hphoneno = phoneController.text;
    // String password = passwordController.text;

    // SERVER LOGIN API URL
    // var url = 'http://192.236.160.238/api/auth/login';

    // Store all data with Param Name.
    // var data = ;

    // Starting Web API Call.
    final response = await http.post(
      Uri.parse('http://192.168.68.1:3000/api/auth/logindoctor'),
      // print('yes');
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'hid': hid,
        'hphoneno': hphoneno
        // 'password': password
      }),
    );
    print({'hid': hid, 'hphoneno': hphoneno});

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
        MaterialPageRoute(builder: (context) => HospitalDepPage()),
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
              controller: hidcontroller,
              decoration: InputDecoration(labelText: 'Enter  Id'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Enter Phoneno'),
              autofocus: false,
              // obscureText: true,
            ),
            // SizedBox(height: 10.0),
            // TextFormField(
            //   controller: passwordController,
            //   decoration: InputDecoration(labelText: 'Enter Password'),
            //   autofocus: false,
            //   obscureText: true,
            // ),
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
                      MaterialPageRoute(builder: (context) => SignupDoctor()),
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
