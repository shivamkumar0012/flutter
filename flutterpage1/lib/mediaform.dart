import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MediaForm extends StatelessWidget {
  const MediaForm({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppSaler(),
    );
  }
}

class MyAppSaler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media',
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  final String url = 'http://192.168.68.101:2800/upload';

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool valuefirst = false;
  bool valuesecond = false;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  // TextEditingController controller5 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<String?> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  String state = "";
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Form'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Click Images',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      onTap: () async {
                        var file1 =
                            await _picker.pickImage(source: ImageSource.camera);
                        var res = await uploadImage(file1?.path, widget.url);

                        setState(() {
                          state = res!;
                          print(res);
                        });
                        // controller1.text = file1!.path;
                      },
                      leading: Icon(Icons.camera),
                      title: Text('Main resting place'),
                    ),
                    ListTile(
                      onTap: () async {
                        var file2 =
                            await _picker.pickImage(source: ImageSource.camera);
                        // controller2.text = file2!.path;
                        var res = await uploadImage(file2?.path, widget.url);

                        setState(() {
                          state = res!;
                          print(res);
                        });
                      },
                      leading: Icon(Icons.camera),
                      title: Text('Damage vehicle'),
                    ),
                    ListTile(
                      onTap: () async {
                        var file3 =
                            await _picker.pickImage(source: ImageSource.camera);
                        // controller3.text = file3!.path;

                        var res = await uploadImage(file3?.path, widget.url);

                        setState(() {
                          state = res!;
                          print(res);
                        });
                      },
                      leading: Icon(Icons.camera),
                      title: Text(' Damage Property'),
                    ),
                    ListTile(
                      onTap: () async {
                        var file4 =
                            await _picker.pickImage(source: ImageSource.camera);
                        controller4.text = file4!.path;

                        var res = await uploadImage(file4.path, widget.url);

                        setState(() {
                          state = res!;
                          print(res);
                        });
                      },
                      leading: Icon(Icons.camera),
                      title: Text('Obstraction of Objects on road'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 300),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}
