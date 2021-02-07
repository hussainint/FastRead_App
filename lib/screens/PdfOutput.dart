import 'dart:io';
import 'dart:typed_data';
import 'package:fastread/models/rsvp.dart';
import 'package:flutter/material.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'dart:async';

import 'package:pdf_text/pdf_text.dart';
import 'package:provider/provider.dart';

class PdfOutput extends StatefulWidget {
  static const routeName = "/PdfOutput";
  @override
  _PdfOutputState createState() => _PdfOutputState();
}

class _PdfOutputState extends State<PdfOutput> {
  PDFDoc _pdfDoc;
  String _text = "";
  Uint8List image;
  File file;
  int firstTime = 0;
  var pdf;
  bool imgPrevPressed = false, rsvpStarted = false;

  bool _buttonsEnabled = true;
  int pageNumber = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dt = ModalRoute.of(context).settings.arguments as Map;
    file = dt['file'];
    if (firstTime == 0) {
      _readRandomPage(true);
      ++firstTime;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Page No. $pageNumber'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _text == '\n'
                ? Container(
                    child: Image(image: MemoryImage(image)),
                  )
                : Consumer<RSVP>(
                    builder: (context, rsvp, child) => !rsvpStarted
                        ? Text(
                            '$_text',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )
                        : rsvp.getTextt(),
                  ),
          ),
        ),
        bottomNavigationBar: Consumer<RSVP>(builder: (context, rsvp, child) {
          return Container(
            height: 50,
            color: Colors.black87,
            child: !rsvpStarted
                ? FlatButton(
                    onPressed: () {
                      setState(() {
                        rsvpStarted = true;
                      });
                      rsvp.start(_text, pageNumber);
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Center(
                            child: FittedBox(
                          child: Text(
                            rsvp.getSingleText(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        )),
                      ),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              rsvpStarted = false;
                            });
                            rsvp.stop();
                          },
                          child: Text(
                            'Stop',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
          );
        }),
        floatingActionButton: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: image != null && imgPrevPressed
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          imgPrevPressed = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                        )),
                        width: 100,
                        child: Image(image: MemoryImage(image)),
                      ),
                    )
                  : FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        setState(() {
                          imgPrevPressed = true;
                        });
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.image),
                    ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.indigo,
                onPressed: () {
                  _readRandomPage(true);
                },
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    _readRandomPage(false);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

//  PDF.file(
//           file,
//           height: MediaQuery.of(context).size.height -
//               kToolbarHeight -
//               MediaQuery.of(context).padding.top,
//           width: MediaQuery.of(context).size.width * 0.90,
//         ),

  Future _readRandomPage(bool add) async {
    print('enterddd');
    var size;

    if (pageNumber == 0) {
      _pdfDoc = await PDFDoc.fromFile(file);
    }
    if (_pdfDoc == null) {
      return;
    }
    // get the render size after the page is loaded

    // get the actual image of the page
    pdf = PdfImageRendererPdf(path: file.path);
    int pg;
    if (add == true)
      pg = pageNumber + 1;
    else
      pg = pageNumber - 1;

    if (pg < 1) pg = 1;
    await pdf.open();

    await pdf.openPage(pageIndex: pg - 1);
    size = await pdf.getPageSize(pageIndex: pg - 1);
    final img = await pdf.renderPage(
      pageIndex: pg - 1,
      x: 0,
      y: 0,
      width: size.width, // you can pass a custom size here to crop the image
      height: size.height, // you can pass a custom size here to crop the image
      scale: 1.0, // increase the scale for better quality (e.g. for zooming)
      background: Colors.white,
    );

    String text = await _pdfDoc.pageAt(pg).text;

    setState(() {
      _text = text;
      _buttonsEnabled = true;
      image = img;
      pageNumber = pg;
    });
  }

  /// Reads the whole document
  Future _readWholeDoc() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text = await _pdfDoc.text;

    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });
  }
}
