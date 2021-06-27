import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pdf2/widget2/pdf.dart';

import 'Modal.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String img =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNICBfe_1tgmsn15zY-RMDsXLvPnICn0E6UQ&usqp=CAU';
  List<Modal> itemList = List();
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pdf with Firebase"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPdfAndUpload();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: itemList.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      String passData = itemList[index].link;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPdf(),
                              settings: RouteSettings(arguments: passData)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.teal,
                        ),
                        Center(
                          child: Container(
                              height: 140,
                              child: Card(
                                margin: EdgeInsets.all(18),
                                elevation: 7,
                                child: Center(
                                  child: Text(
                                      itemList[index].name +
                                          " " +
                                          {index + 1}.toString(),
                                      style: TextStyle()),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  Future getPdfAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }

    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '${randomName}.pdf';
    savePdf(file.readAsBytesSync(), fileName);
  }

  savePdf(List<int> asset, String name) async {
    StorageReference refernece = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = refernece.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url);
  }

  String CreateCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String str) {
    var data = {
      "PDF": str,
      "FileName": "My new Book",
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("Store Successfully");
    });
  }

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap) {
      var data = snap.value;
      print(snap);
      itemList.clear();
      data.forEach((key, value) {
        Modal m = new Modal(value['PDF'], value['FileName']);
        itemList.add(m);
      });
      setState(() {});
    });
  }
}
