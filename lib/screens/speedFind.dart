import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SpeedFind extends StatefulWidget {
  static const routeName = '/Speed-find';

  @override
  _SpeedFindState createState() => _SpeedFindState();
}

class _SpeedFindState extends State<SpeedFind> {
  var txt = [
    '''
    My three-year-old daughter was trying to roast a marshmallow for the first time. Her first and second attempts ended in flames. Both times, I took the scorched marshmallow off of the roasting stick and threw it into the fire. The third time, I helped her a lot more and, together, we achieved a perfectly toasty golden brown. Once it was cool, I handed her the marshmallow which she promptly threw into the fire. No one had told her she was supposed to eat it.
    ''',
    '''
    Varun called his friend over to his house. When he arrived, he told him he had to speak to him about a problem. They both went up to Varun's room."What is it?" asked the friend. "I think I am having an identity crisis," said Varun."What do you mean?" asked his friend."MOOOOOO!" he bellowed like a cow.His friend stood frozen, in stunned silence. Varun burst out laughing, "I was just kidding!""Are you sure? Because we just ran out of milk," came the reply. --Aditi Ashok, Chennai
    ''',
    '''
    It was 9 a.m., 26 January. The politician's car, on the way to the flag-hoisting ceremony, stopped at a red light. A 10-year-old street vendor came running to the car and waved the tricolour, hoping that selling one more flag will help him buy some vada pav. With no intention of buying, the politician rolled down the window and smirked, "Today you are selling the national flag. On other days, I have seen you sell toys, umbrellas and kites. Is there anything you have not sold so far?""Our country," the boy retorted at once. --Kalpesh Sheth, Mumbai
    ''',
  ];
  var pos = 0;

  var start = 1;
  var count = 4;
  var before = DateTime.now(), after = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var _width = MediaQuery.of(context).size.width;
    void delay() {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          start = 2;
          count = count - 1;
        });

        if (count >= 1)
          delay();
        else {
          start = 0;
          before = DateTime.now();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Reading Speed'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.green[100],
                child: Text(
                  'Find your reading speed.Click on the start button -->A 100 word passage will be displayed -->Read it and click on END button',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (start == 2)
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: _height * 0.02,
                    right: _height * 0.02,
                    top: _height * 0.02),
                padding: EdgeInsets.only(
                    left: _height * 0.02,
                    right: _height * 0.02,
                    top: _height * 0.02),
                child: start == 0
                    ? Text(
                        '${txt[pos]}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    : start == 1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlatButton(
                                color: Colors.green[200],
                                onPressed: () {
                                  delay();
                                },
                                child: Text('Start'),
                              ),
                            ],
                          )
                        : start == 4
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Reading speed is ${(txt[pos].split(' ').length / ((after.difference(before).inSeconds) / 60)).round()} wpm',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  FlatButton(
                                    color: Colors.green[200],
                                    onPressed: () {
                                      setState(() {
                                        if (pos >= 2)
                                          pos = 0;
                                        else
                                          pos = pos + 1;

                                        start = 2;
                                        count = 4;
                                      });

                                      delay();
                                    },
                                    child: Text('Start Again'),
                                  ),
                                  Divider(),
                                  Text(
                                    '''
*If your reading speed is less that 100 wpm, you are very slow.
*If your reading speed is between 100 and 200 wpm, you are weak and slow.
*If your reading speed is between 200 and 300 wpm, you are at a moderate level.
*If your reading speed is between 300 and 400 wpm, you are a good speed reader.
*If your reading speed is between 400 and 700 wpm, you are at a great level.
*If your reading speed is more than 700 wpm, congratulations! you are a professional!
                                  ''',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
              ),
              if (start == 0)
                FlatButton(
                  color: Colors.red[200],
                  onPressed: () {
                    setState(() {
                      after = DateTime.now();
                      start = 4;
                    });
                  },
                  child: Text('Stop'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
