import 'package:flutter/material.dart';
import 'package:pdf2/widgets/pdf.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF File"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => pdf()));
              },
              child: Container(
                height: 100,
                width: width,
                child: Card(
                    color: Colors.red,
                    elevation: 30,
                    child: Center(
                      child: Text(
                        "First PDF",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => pdf()));
              },
              child: Container(
                height: 100,
                width: width,
                child: Card(
                    color: Colors.purple,
                    elevation: 30,
                    child: Center(
                      child: Text(
                        "Second PDF",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pdf()));
            },
            child: Container(
              width: width,
              height: 100,
              child: Card(
                color: Colors.blueGrey,
                elevation: 30,
                child: Center(
                    child: Text(
                  "Third PDF",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pdf()));
            },
            child: Container(
                height: 100,
                width: width,
                child: Card(
                    color: Colors.cyan,
                    elevation: 30,
                    child: Center(
                      child: Text(
                        "Fourth PDF",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ))),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pdf()));
            },
            child: Container(
                height: 100,
                width: width,
                child: Card(
                    color: Colors.brown,
                    elevation: 30,
                    child: Center(
                      child: Text(
                        "Fifth PDF",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
