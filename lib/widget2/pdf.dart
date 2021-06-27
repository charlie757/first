import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ViewPdf extends StatefulWidget {
  const ViewPdf({Key key}) : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument doc;
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context).settings.arguments;
    ViewNow() async {
      doc = await PDFDocument.fromURL(data);
      setState(() {});
    }

    Widget Loading() {
      ViewNow();
      if (doc == null) ;
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("PDF File"),
        ),
        body: doc == null ? Loading() : PDFViewer(document: doc));
  }
}
