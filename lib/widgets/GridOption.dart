import 'package:fastread/screens/speedFind.dart';
import 'package:fastread/screens/about.dart';
import 'package:flutter/material.dart';

class GridOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          //   child: Text(
          //     'Select',
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Box(
                img: "",
                text: "Books",
              ),
              Box(
                img: "",
                text: "Your Speed",
                page: SpeedFind.routeName,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Box(
                img: "",
                text: "Training",
              ),
              Box(
                img: "",
                text: "Planner",
                page: AppInfo.routeName,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  String img, text, page;

  Box({this.img, this.text, this.page});
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    var w = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(page);
        },
        child: Container(
          height: w * 0.4,
          padding: EdgeInsets.all(8),
          width: w * 0.4 - 10,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: (w * 0.4) * 0.6,
                width: (w * 0.4) * 0.6,
                color: Colors.red,
              ),
              FittedBox(
                child: Text(
                  '$text',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
