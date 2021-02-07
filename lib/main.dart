import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/rsvp.dart';
import 'screens/AddBookScreen.dart';
import 'screens/HomePage.dart';
import 'screens/PdfOutput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RSVP()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue[900],
        ),
        home: HomePage(),
        routes: {
          AddBookScreen.routeName: (ctx) => AddBookScreen(),
          PdfOutput.routeName: (ctx) => PdfOutput(),
        },
      ),
    );
  }
}
