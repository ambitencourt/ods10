import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/modules/auth/presentation/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    try {
      await controller.getUser();
    } catch (e) {
      print(e);
      //TODO navigate user to erro page or login
    } finally {
      Future.delayed(
        const Duration(
          seconds: 1,
        ),
        () {
          Modular.to.navigate('/journey');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: const Center(
        child: Text(
          'ODS SPLASH',
        ),
      ),
    );
  }
}
