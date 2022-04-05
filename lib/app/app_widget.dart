// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/theme_manager.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getLightTheme(),
      initialRoute: '/',
    ).modular();
  }
}
