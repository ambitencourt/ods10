import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/auth/presentation/controllers/splash_controller.dart';
import 'package:ods10/app/modules/auth/presentation/widgets/personal_error_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    try {
      setState(() {
        hasError = false;
      });
      await controller.getUser();
      Future.delayed(
        const Duration(
          seconds: 2,
        ),
        () {
          Modular.to.navigate('/journey/');
        },
      );
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasError
          ? PersonalError(onTryAgain: getUser)
          : Container(
              color: AppColors.primary,
              child: Center(
                child: Text(
                  'Re.tifica',
                  style: getBoldStyle(fontSize: 50, color: AppColors.secondary),
                ),
              ),
            ),
    );
  }
}
