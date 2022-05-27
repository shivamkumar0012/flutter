// import 'package:check/widgets/bigtext.dart';
import 'package:flutter/material.dart';
// import 'package:hamilton2/widgets/BigText.dart';
// import 'package:hamilton2/widgets/appicon.dart';

class MyContactPage extends StatelessWidget {
  const MyContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text("Contact Us"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/hospital2.jpg")
              ),
              Text(
                "Senior Dr",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 32,
                    color: Colors.purple,
                  ),
                  // leading: MyAppIconPage(icon: Icons.email),
                  title: Text( "kailashospital@gmail.com"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 32,
                    color: Colors.purple,
                  ),
                  title: Text("Helpline number :- 132"),
                ),
              ),
            ],
          ),
        ));
  }
}
