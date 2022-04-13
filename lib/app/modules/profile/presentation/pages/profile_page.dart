import 'package:flutter/material.dart';
import 'package:ods10/app/common/widgets/bottom_navibar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      backgroundColor: Colors.red,
      bottomNavigationBar: const BottomNavibar(),
    );
  }
}
