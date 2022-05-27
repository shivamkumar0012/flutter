// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterpage1/report.dart';
import 'package:flutterpage1/reviewaccident.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make people life easier, our goal'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('New Accident...'),
            // color: Colors.orangeAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportStart()),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Review Accident...'),
            // color: Colors.orangeAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewAccidentPage()),
              );
            },
          ),
        ],
      )),
    );
  }
}
