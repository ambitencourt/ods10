// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //flag para utilizar Material 3(paleta de cores dinâmicas)
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 13, 190)),
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 104, 44, 243),
      ),
      initialRoute: 'home',
    ).modular();
  }
}
