import 'package:fastread/widgets/AddBooks.dart';
import 'package:fastread/widgets/GridOption.dart';
import 'package:fastread/widgets/ImageSlideshow.dart';
import 'package:fastread/widgets/info.dart';
import 'package:flutter/material.dart';

import 'help.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'REAP',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Navigator.push(context, SlideRightRoute(page: Help()));
            },
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideShow(),
            Divider(
              color: Colors.grey[200],
              height: 50,
              thickness: 20,
            ),
            AddBooks(),
            ReadInstantlyButton(),
            Divider(
              color: Colors.grey[200],
              height: 50,
              thickness: 20,
            ),
            GridOption(),
            Divider(
              color: Colors.grey[200],
              height: 50,
              thickness: 20,
            ),
            Info(),
          ],
        ),
      ),
    );
  }
}

class ReadInstantlyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {},
        color: Theme.of(context).primaryColor,
        height: 50,
        child: Center(
          child: FittedBox(
            child: Text(
              'Capture Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
