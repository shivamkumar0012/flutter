// import 'package:check/widgets/bigtext.dart';
import 'package:flutter/material.dart';
// import 'package:hamilton2/widgets/BigText.dart';
// import 'package:hamilton2/widgets/appicon.dart';

class MyHelpPage extends StatelessWidget {
  const MyHelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help"),),
        backgroundColor: Colors.greenAccent,
        // appBar: AppBar(
        //   title: BigText(text: "Contact Us"),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/police.jpg")
              ),
              Text(
                "Project Manager",
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
                  title: Text("hdhghdbd@gmail.com")
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 32,
                    color: Colors.purple,
                  ),
                  title: Text("78676762534")
                ),
              ),
            ],
          ),
        ));
  }
}
