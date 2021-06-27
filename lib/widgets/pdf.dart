// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:flutter/material.dart';

// class pdf extends StatefulWidget {
//   const pdf({Key key}) : super(key: key);

//   @override
//   _pdfState createState() => _pdfState();
// }

// class _pdfState extends State<pdf> {
//   bool _isLoading = true;
//   PDFDocument document;

//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }

//   loadDocument() async {
//     document = await PDFDocument.fromAsset('assets/sample.pdf');

//     setState(() => _isLoading = false);
//   }

//   changePDF(value) async {
//     setState(() => _isLoading = true);
//     if (value == 1) {
//       document = await PDFDocument.fromAsset('assets/sample2.pdf');
//     } else if (value == 2) {
//       document = await PDFDocument.fromURL(
//         "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
//       );
//     } else {
//       document = await PDFDocument.fromAsset('assets/sample.pdf');
//     }
//     setState(() => _isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Welcome")),
//       drawer: Drawer(
//           child: Container(
//         color: Colors.purple,
//         child: ListView(
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(color: Colors.purple),
//               accountName: Text('Ravi'),
//               accountEmail: Text("rraviggupta@gmail.com"),
//               currentAccountPicture: CircleAvatar(),
//               onDetailsPressed: () {},
//             ),
//             ListTile(
//               title: Text('Load from Assets',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 changePDF(1);
//               },
//             ),
//             ListTile(
//               title:
//                   Text('Load from URL', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 changePDF(2);
//               },
//             ),
//             ListTile(
//               title: Text('Restore default',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 changePDF(3);
//               },
//             ),
//           ],
//         ),
//       )),
//       body: Center(
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : PDFViewer(
//                 document: document,
//                 zoomSteps: 1,
//                 lazyLoad: false,
//                 scrollDirection: Axis.vertical,

//                 //uncomment below code to replace bottom navigation with your own
//                 navigationBuilder:
//                     (context, page, totalPages, jumpToPage, animateToPage) {
//                   return ButtonBar(
//                     alignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(Icons.first_page),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.arrow_back),
//                         onPressed: () {
//                           animateToPage(page: page - 2);
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.arrow_forward),
//                         onPressed: () {
//                           animateToPage(page: page);
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.last_page),
//                         onPressed: () {
//                           jumpToPage(page: totalPages - 1);
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
