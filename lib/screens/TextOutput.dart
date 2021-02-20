import 'dart:io';
import 'dart:typed_data';
import 'package:fastread/models/rsvp.dart';
import 'package:flutter/material.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'dart:async';

import 'package:pdf_text/pdf_text.dart';
import 'package:provider/provider.dart';

class TextOutput extends StatefulWidget {
  static const routeName = "/TextOutput";
  @override
  _TextOutputState createState() => _TextOutputState();
}

class _TextOutputState extends State<TextOutput> {
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
    );
  }
}
