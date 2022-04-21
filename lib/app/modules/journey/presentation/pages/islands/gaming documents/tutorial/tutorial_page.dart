import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/tutorial_page_controller.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';
import 'page1_tutorial.dart';
import 'page2_tutorial.dart';
import 'page3_tutorial.dart';
import 'page4_tutorial.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState
    extends ModularState<TutorialPage, TutorialPageController> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    _launchURLCNJ() {
      try {
        controller.launchURLCNJ();
      } catch (e) {
        Scaffold.of(context).showBottomSheet((context) => Text(e.toString()));
        // TODO show error bottomsheet
      }
    }

    Future<void> tryToCompleteTutorial() async {
      try {
        await controller.completeTutorial();
      } finally {
        Modular.to.pushReplacementNamed('/journey/islands');
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 36, 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              borderRadius: BorderRadius.circular(220),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                controller.pageController.page!.toInt() > 0
                                    ? controller.pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        curve: Curves.easeIn,
                                      )
                                    : Modular.to.pop();
                              }),
                          const Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(220),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.description_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () =>
                                Modular.to.pushNamed('/journey/documents'),
                          ),
                        ],
                      ),
                      customSizedBox3(context),
                      Observer(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: const Color(0xFFD2D2CC),
                            value: controller.tutorialStore.current / 3,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFD03363)),
                          ),
                        );
                      }),
                      customSizedBox3(context),
                      SizedBox(
                        height: mediaQuery.height * .5,
                        child: Observer(builder: (_) {
                          return PageView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            controller: controller.pageController,
                            children: const [
                              Page1Tutorial(),
                              Page2Tutorial(),
                              Page3Tutorial(),
                              Page4Tutorial(),
                            ],
                            onPageChanged:
                                controller.tutorialStore.setCurrentIndex,
                          );
                        }),
                      ),
                      customSizedBox1(context),
                      Observer(builder: (_) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              controller.tutorialStore.current == 3
                                  ? tryToCompleteTutorial()
                                  : controller.pageController.animateToPage(
                                      controller.pageController.page!.toInt() +
                                          1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                            });
                          },
                          child: Text(
                            controller.tutorialStore.current == 3
                                ? 'Começar'
                                : 'Próximo',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(225, 44),
                            primary: const Color(0xFFD03363),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(31),
                              ),
                            ),
                          ),
                        );
                      }),
                      customSizedBox4(context),
                      Observer(builder: (_) {
                        return Visibility(
                          replacement: const SizedBox.expand(),
                          visible: controller.tutorialStore.current < 3
                              ? true
                              : false,
                          child: ElevatedButton(
                            onPressed: () {
                              tryToCompleteTutorial();
                            },
                            child: Text(
                              'Pular tutorial',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD03363),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(225, 44),
                                primary: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(31),
                                  ),
                                ),
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Color(0xFFD03363),
                                )),
                          ),
                        );
                      }),
                      customSizedBox2(context),
                      SizedBox(
                        width: 297,
                        height: 32,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'O cartório só poderá exigir os documentos indicados pelo CNJ no provimento ',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF171717),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'nº 73, de 2018.',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF171717),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchURLCNJ(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
