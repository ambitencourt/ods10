import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => SizedBox(
          child: Image.asset(
            item,
            //fit: BoxFit.fitWidth,
            //width: 1000.0,
          ),
        ))
    .toList();
