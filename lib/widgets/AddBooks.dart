import 'package:fastread/screens/AddBookScreen.dart';
import 'package:flutter/material.dart';

class AddBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(
        top: 35,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add a book',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AddBookScreen.routeName),
                  child: Container(
                    width: _height * 0.18,
                    // height: _height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _height * 0.18,
                          height: _height * 0.20,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[350],
                          ),
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                        FittedBox(
                            child: Text(
                          '..........',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: _height * 0.18,
                  // height: _height * 0.2,

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, bottom: 3),
                        width: _height * 0.18,
                        height: _height * 0.20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          width: _height * 0.15,
                          child: FittedBox(
                            child: Text(
                              'Lean Startup', //15 words limit
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: _height * 0.18,
                  // height: _height * 0.2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, bottom: 3),
                        width: _height * 0.18,
                        height: _height * 0.20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: _height * 0.15,
                        child: FittedBox(
                            child: Text(
                          'Zero to One',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: _height * 0.18,
                  // height: _height * 0.2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, bottom: 3),
                        width: _height * 0.18,
                        height: _height * 0.20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: _height * 0.15,
                        child: FittedBox(
                            child: Text(
                          'Data Structures..',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
