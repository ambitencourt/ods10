import 'package:flutter/material.dart';

final List<String> imgListIsland = [
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
  'assets/images/island.png',
];
final List<Widget> imageSlidersIsland = imgListIsland
    .map((item) => Image.asset(
          item,
          fit: BoxFit.fill,
          width: 500.0,
        ))
    .toList();

final List<String> imgListDocDetails = [
  'assets/images/cuate.png',
  'assets/images/island.png',
  'assets/images/cuate.png',
  'assets/images/cuate.png',
  'assets/images/cuate.png',
];
final List<Widget> imageSlidersDocDetails = imgListDocDetails
    .map((item) => Image.asset(
          item,
          // fit: BoxFit.fill,
          // width: 500.0,
        ))
    .toList();
