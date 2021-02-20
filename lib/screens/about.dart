import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  static const routeName = '/app-info';
  var calci = [
    "1.Basic Calculator - ",
    "2.Scientific Calculator - ",
    "3.Conversion Calculator - ",
    "4.Take Change Calculator -  ",
    "5.Stock Return Calculator - ",
    "6.BMI Calculator - ",
    "7.Give Change - ",
    "8.Birth Day Calculator - ",
    "9.Word Count Calculator - ",
    "10.Your Value of Current Time - ",
  ];
  var des = [
    'A normal calculator which performs additions, subtraction etc.',
    'This performs vast calculation inclucing trignometry, factorial, log etc.',
    "This converts values from one unit to other. Contains conversion for Area, temperature, volume, Length, Time and Weight. Contains more than 60 units all together.",
    "Calculates the amount of money to get back at the billing counter after paying money for the goods you have bought.",
    "Calculates the returns you get from your investment.",
    "Calculates BMI.",
    "This is for shopkeeper to calculate the amount of money to give back to the customer.",
    "Calculates the DAY you were born based on your birthdate month and year.",
    "Calculated the number of words, letters, empty space and special characters in the Text.",
    "Calculate the how much is your hourly rate / Value of your current time.",
  ];
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('App info'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/icon2.png',
                  width: _width * 0.75,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Version 1.0.9',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                '\n\n\nAll in one calculator which helps with the daily life calculations. Replace your in-built calculator with this pro calculator as it contains different types of calculator in a single app which you can add, delete and reorder based on your likes.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '\n\nSome of the Calculator that this app contains are :-',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              for (int i = 0; i < 10; i++)
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: <TextSpan>[
                      ///////////
                      TextSpan(
                        text: '\n${calci[i]}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '${des[i]}',
                      ),
                      ///////////
                    ],
                  ),
                ),

              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       children: [
              //         Image.asset(
              //           'assets/logo.png',
              //           width: _width * 0.3,
              //         ),
              //         Text('Version 1.0.8'),
              //       ],
              //     ),
              //     Image.asset(
              //       'assets/icon2.png',
              //       width: _width * 0.3,
              //     ),
              //     SizedBox(
              //       width: _width * 0.1,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
