import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => Image.asset(
          item,
          fit: BoxFit.fill,
          width: 500.0,
        ))
    .toList();
