import 'package:flutter/material.dart';
import 'package:flutterpage1/second.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
// import 'dart:async';

// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';

// pick image

// import 'package:http/http.dart' as http;

class Userform1 extends StatelessWidget {
  const Userform1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Form',
      home: UploadPage(),
    );
  }
}

// class StartPage extends StatelessWidget {
//   const StartPage({Key? key}) : super(key: key);

//   @override
//   Widget build(context) {
//     TextEditingController controller1 = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter File Upload Example')
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[

//             TextFormField(
//               controller: controller1,
//               decoration: const InputDecoration(
//                 labelText: 'Date',
//                 fillColor: Colors.white,
//                 filled: true
//               ),
//               autofocus: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text("Take me to the upload screen"),
//               onPressed: () => switchScreen(controller1.text, context),
//             )
//           ],
//         ),
//       )
//     );
//   }
//   void switchScreen(str, context) =>
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) => const UploadPage(url: 'http://192.168.43.134:3000/upload')
//     ));
// }

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  // final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String location = 'Null, Click photo';
  static String Address = 'searching...';
  bool valuefirst = false;
  bool valuesecond = false;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  String phno = '';
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  // Widget fillCards() {
  //   List<Widget> widgets = _simCard
  //       .map((SimCard sim) => Text(
  //           'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
  //       .toList();
  //   return Column(children: widgets);
  // }

  // Future<Album>? _futureAlbum;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[2];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // setState(() {
    return Address;
    // });
  }

  // Future<String?> uploadImage(position,category,filename, url,phoneno) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   // request.headers.addAll({'Position': position});
  //   request.fields["position"] = position;
  //   request.fields["category"] = category;
  //   request.fields["phoneno"] = phoneno;
  //   request.files.add(await http.MultipartFile.fromPath('picture', filename));
  //   var res = await request.send();
  //   return res.reasonPhrase;
  // }
  String state = "";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAppSecondPage()),
            ),
          ),
          title: Text('User Form'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: controller1,
                decoration: const InputDecoration(
                    labelText: 'Name', fillColor: Colors.white, filled: true),
                autofocus: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller2,
                decoration: const InputDecoration(
                    labelText: 'Phone No',
                    fillColor: Colors.white,
                    filled: true),
                autofocus: true,
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller3,
                decoration: const InputDecoration(
                    labelText: 'Address',
                    fillColor: Colors.white,
                    filled: true),
                autofocus: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller4,
                decoration: const InputDecoration(
                    labelText: 'Adhar No',
                    fillColor: Colors.white,
                    filled: true),
                autofocus: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller5,
                decoration: const InputDecoration(
                    labelText: 'Sale Item Image',
                    fillColor: Colors.white,
                    filled: true),
                autofocus: true,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              // child: Column(
              // children: <Widget>[
              // SizedBox(width: 10,),
              //     Text('Which type of problem you can solve',style: TextStyle(fontSize: 20.0), ),
              //     CheckboxListTile(
              //       secondary: const Icon(Icons.water),
              //       title: const Text('Water'),
              //       // subtitle: Text('Ringing after 12 hours'),
              //       value: this.valuefirst,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           valuefirst = value!;
              //         });
              //       },
              //     )])),
              //     SizedBox(width: 10,),
              //     // Text('Checkbox with Header and Subtitle',style: TextStyle(fontSize: 20.0), ),
              //     Container(
              // child: Column(
              // children: <Widget>[
              // SizedBox(width: 10,),
              //     // Text('Which type of problem you can solve',style: TextStyle(fontSize: 20.0), ),
              //     Container(
              // child: Column(
              // children: <Widget>[
              // SizedBox(width: 10,),
              //     // Text('Which type of problem you can solve',style: TextStyle(fontSize: 20.0), ),
              //     CheckboxListTile(
              //       secondary: const Icon(Icons.equalizer),
              //       title: const Text('Equipment'),
              //       // subtitle: Text('Ringing after 12 hours'),
              //       value: this.valuefirst,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           valuefirst = value!;
              //         });
              //       },
              //     )])),])),
              SizedBox(height: 10),
              ElevatedButton(
                // style: style,
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var file = await _picker.pickImage(source: ImageSource.camera);
            Position position = await _getGeoLocationPosition();
            location =
                'Lat: ${position.latitude} , Long: ${position.longitude}';
            // Widget fillCards() {
            List<Widget> widgets = _simCard
                .map((SimCard sim) => Text(
                    // 'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
                    phno =
                        'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}'))
                .toList();

            GetAddressFromLatLong(position);
            controller2.text = phno;
            controller3.text = Address + ' ' + location;
            controller5.text = file!.path;

            print('controller2.text ' + controller2.text);
            print('add ' + Address);
            print('phno ' + phno);
            // var res = await uploadImage(Address+' '+location,controller2.text,file?.path, widget.url,phno);
            // print('add '+Address);
            // print('phno '+phno);
            // setState(() {
            //   state = res!;
            //   print(res);
            // });
          },
          child: Icon(Icons.camera),
        ));
  }
}
