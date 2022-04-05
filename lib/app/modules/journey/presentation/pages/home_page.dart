import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_images.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Olá, ',
                            style: getRegularStyle(fontSize: 20),
                          ),
                          TextSpan(
                            text: 'Clarice Linspector',
                            style: getBoldStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Entenda como ',
                        style: getRegularStyle(fontSize: 34),
                      ),
                      TextSpan(
                        text: 'retificar',
                        style: getBoldStyle(fontSize: 34),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'prenome e gênero',
                      style: getBoldStyle(fontSize: 34, color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'O ',
                        style: getRegularStyle(fontSize: 18),
                      ),
                      TextSpan(
                        text: 'passo a passo ',
                        style: getBoldStyle(fontSize: 18),
                      ),
                      TextSpan(
                        text: 'da retificação',
                        style: getRegularStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildCentralImage(context),
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lista de ',
                        style: getRegularStyle(fontSize: 18),
                      ),
                      TextSpan(
                        text: 'Documentos',
                        style: getBoldStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCentralImage(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.rectangle1816,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Acompanhe sua documentação',
                style: getBoldStyle(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Organize seus documentos e acompanhe o processo para a alteração do prenome e gênero com a ordem recomendada pelos nossos especialistas.',
                style: getBoldStyle(
                  fontSize: 12,
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: AppColors.white.withOpacity(0.4),
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
