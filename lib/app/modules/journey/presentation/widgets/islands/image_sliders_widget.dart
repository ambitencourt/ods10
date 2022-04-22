import 'package:flutter/material.dart';

final List<String> imgListIsland = [
  'assets/images/islands/arquipelago.png',
  'assets/images/islands/lin.png',
  'assets/images/islands/laerte.png',
  'assets/images/islands/nery.png',
  'assets/images/islands/luca.png',
  'assets/images/islands/xica.png',
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

final List<String> imgListTutorial = [
  'assets/images/tutorial/tutorial1.png',
  'assets/images/tutorial/tutorial2.png',
  'assets/images/tutorial/tutorial3.png',
  'assets/images/tutorial/tutorial4.png',
];
final List<Widget> imageSlidersTutorial = imgListTutorial
    .map((item) => Image.asset(
          item,
          // fit: BoxFit.fill,
          // width: 500.0,
        ))
    .toList();
