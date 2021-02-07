import 'dart:io';

import 'package:fastread/screens/PdfOutput.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  static const routeName = '/AddBooks';

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  bool isEnterTextSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.cancel_outlined,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height:
              !isEnterTextSelected ? MediaQuery.of(context).size.height : null,
          child: Column(
            mainAxisAlignment: !isEnterTextSelected
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a book title ',
                  ),
                  maxLength: 20,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (!isEnterTextSelected)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          isEnterTextSelected = true;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.import_contacts,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          FittedBox(
                            child: Text(
                              'Enter Text',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.teal,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        File file = await FilePicker.getFile();
                        Navigator.of(context).pushReplacementNamed(
                            PdfOutput.routeName,
                            arguments: {
                              'file': file,
                            });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.upload_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          FittedBox(
                            child: Text(
                              'Import',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.amber[900],
                    ),
                  ],
                ),
              if (isEnterTextSelected)
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the text ',
                    ),
                    maxLines: null,
                    minLines: 10,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: isEnterTextSelected
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.navigate_next),
            )
          : null,
    );
  }
}

// http://www.africau.edu/images/default/sample.pdf
