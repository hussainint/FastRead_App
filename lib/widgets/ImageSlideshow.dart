import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ImageSlideShow extends StatelessWidget {
  final listimg = [
    'assets/images/poster1.png',
    'assets/images/poster2.png',
    'assets/images/poster3.png',
  ];
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return Container(
        margin: EdgeInsets.all(10),
        height: _height * 0.25,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, i, realIdx) {
            return Container(
              child: Center(child: Image.asset(listimg[i], fit: BoxFit.cover)),
            );
          },
        ));
  }
}
