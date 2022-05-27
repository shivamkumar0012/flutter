import 'package:flutter/material.dart';
import 'package:flutterpage1/abouthosp.dart';
import 'package:flutterpage1/accidentfeedback.dart';
import 'package:flutterpage1/accidentsetting.dart';
import 'package:flutterpage1/help.dart';
import 'package:flutterpage1/newpatient.dart';
import 'package:flutterpage1/reviewpatient.dart';
// import 'package:hospitaldep/newpatient.dart';
// import 'package:hospitaldep/reviewPatDet.dart';

class HospitalDepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageRoutes;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hospital Department '),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/ashok.png'),
                    // fit: BoxFit.fill,
                  ),
                  // shape: BoxShape.circle,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                //  onTap: () =>
                //        Navigator.pushReplacementNamed(context, pageRoutes.home),
              ),
              //  ListTile(
              //   leading: Icon(Icons.dashboard),
              //   title: Text('Dashboard'),
              //   onTap: (){
              //     Navigator.pushNamed(context, '/dashboard');
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySettingPage()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Feedback'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFeedbackPage()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('About'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAboutPage1()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Help'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyContactPage()),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            // body: SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            // child:Column(
            //   children: <Widget>[
            //     Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 123", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Kantha S/O Mahesh, Age(21)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     ),
            //      Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 426", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Sohan S/O Rajesh, Age(28)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     ),
            //      Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 453", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Abdul Kamil S/O Faizan Kamil, Age(35)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     ),
            //      Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 56", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Suresh S/O Mahesh, Age(19)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     ),
            //      Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 123", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Kantha S/O Mahesh, Age(21)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     ),
            //      Container(
            //       width: 500,
            //       height: 150,
            //       padding: new EdgeInsets.all(10.0),
            //       child: Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15.0),
            //         ),
            //         color: Color.fromARGB(255, 238, 232, 232),
            //         elevation: 10,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const ListTile(
            //               title: Text("MLC - OP ID - 123", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold,)),
            //               subtitle: Text("Mr. Kantha S/O Mahesh, Age(21)", style: TextStyle(fontSize: 15,),),
            //              ),
            //              RaisedButton(
            //                child: const Text("View"),
            //                onPressed: (){

            //                },
            //              )
            //           ],
            //         ),
            //       ),
            //     )

            // SizedBox(height: 10,),
            // Container(
            //   height: 100,
            //   width: 1800,
            //   color: Colors.red,
            // ),
            // Expanded(child: Container(
            //   height: 20,
            //   width: 1800,
            //   color: Colors.white,
            // )),
            // SizedBox(height: 10,),
            // Container(
            //   height: 100,
            //   width: 1800,
            //   color: Colors.blue,
            //           // ),

            //         ]
            //       ),

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
                              "Hospital Department!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Integrated Road Accident Database",
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
                                      builder: (context) => MyNewPatientPage()),
                                );
                              },

                              color: Colors.indigoAccent[400],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "New Patient",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white70),
                              ),

                              // MaterialButton(
                              //   minWidth: double.infinity,
                              //   height:60,
                              //   onPressed: (){

                              //   },
                              //   color: Colors.indigoAccent[400],
                              //   shape: RoundedRectangleBorder(
                              //     side: BorderSide(
                              //       color: Colors.black,
                              //     ),
                              //     borderRadius: BorderRadius.circular(40)
                              //   ),
                              //   child: Text("Login",style: TextStyle(
                              //     fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70

                              //   ),),
                              // ),
                              // MaterialButton(
                              //     minWidth: double.infinity,
                              //     height:60,
                              //     onPressed: (){

                              //     },
                              //     color: Colors.redAccent,
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(40)
                              //     ),
                              //     child: Text("Sign UP",style: TextStyle(
                              //       fontWeight: FontWeight.w600,fontSize: 16,

                              //     ),),
                              //   ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15)),
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
                          ]),
                    ]))));
  }
}
