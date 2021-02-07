import 'package:flutter/material.dart';

class RSVP with ChangeNotifier {
  String _text = "", _singleText = "";
  bool running = false;
  int count = 0;
  int pageNumber = -1, prevPagenumber = -1;
  RichText txt = RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black),
          children: <TextSpan>[
        TextSpan(text: ''),
        TextSpan(
          text: '',
          style: TextStyle(backgroundColor: Colors.red),
        ),
        TextSpan(text: ''),
      ]));
  void start(String t, int pg) {
    print('prev $prevPagenumber');
    print('ppage $pageNumber');
    if (prevPagenumber != pg) count = 0;
    pageNumber = pg;
    _text = t;

    running = true;
    calculate();
  }

  void stop() {
    running = false;
    prevPagenumber = pageNumber;
  }

  void setText(String t) {
    _text = t;
  }

  bool status() {
    return running;
  }

  void calculate() {
    if (running == true) {
      Future.delayed(const Duration(milliseconds: 200), () {
        var list = _text.split(' ');

        String txt1 = "", txt2 = "", txt3 = "";
        for (var i = 0; i < count; i++) {
          txt1 = txt1 + list[i] + " ";
        }
        txt2 = list[count] + " ";
        _singleText = txt2;
        for (var i = count + 1; i < list.length; i++) {
          txt3 = txt3 + list[i] + " ";
        }

        txt = RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: <TextSpan>[
              TextSpan(text: '$txt1'),
              TextSpan(
                text: '$txt2',
                style: TextStyle(backgroundColor: Colors.red),
              ),
              TextSpan(text: '$txt3'),
            ]));
        count = count + 1;
        print(count);
        if (count >= list.length) stop();

        notifyListeners();
        calculate();
      });
    }
  }

  String getSingleText() {
    return _singleText;
  }

  Widget getTextt() {
    return txt;
  }
}
