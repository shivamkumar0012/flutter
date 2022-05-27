// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({Key? key}) : super(key: key);

  @override
  State<MyAboutPage> createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xFF363f93),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    height: 380,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 20,
                  child: Text(
                    "About Us",
                    style: TextStyle(fontSize: 28, color: Color(0xFF363f93)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              height: 230,
              child: Stack(children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30.0,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/police.jpg")),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 60,
                    left: 200,
                    child: Container(
                      height: 150,
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF363f93),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Goal",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "It's Larger than life",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ])),
          Expanded(
              // child: MediaQuery.removePadding(context: context, removeTop: true,
              child: ListView(children: [
            new GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/annual');
                },
                //          physics: AlwaysScrollableScrollPhysics(),
                //  shrinkWrap: true,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    top: 25,
                  ),
                  height: 200,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFf363f93),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.only(
                      left: 32,
                      bottom: 50,
                      top: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "The Best",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "The bad news is time flies. ...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ))
          ])),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(children: [
                    new GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/halfyearly');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            top: 25,
                          ),
                          height: 200,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFf363f93),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80.0),
                              ),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: const Offset(-10.0, 10.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.only(
                              left: 32,
                              bottom: 50,
                              top: 50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "The Best",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Nothing is impossible. ...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ))
                  ])))
        ],
      ),
    );
  }
}
