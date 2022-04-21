import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RouterOutlet(),
    );
  }
}
