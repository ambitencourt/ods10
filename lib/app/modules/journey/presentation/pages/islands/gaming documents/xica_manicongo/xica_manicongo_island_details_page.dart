import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../utils/links_util.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';
import 'page1_detail.dart';
import 'page2_detail.dart';
import 'page3_detail.dart';
import 'page4_detail.dart';
import 'page5_detail.dart';

class XicaManicongoIslandDetaills extends StatefulWidget {
  final Map? data;
  const XicaManicongoIslandDetaills({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<XicaManicongoIslandDetaills> createState() =>
      _XicaManicongoIslandDetaillsState();
}

class _XicaManicongoIslandDetaillsState
    extends State<XicaManicongoIslandDetaills> {
  int current = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: current,
    );
    super.initState();
  }

  void _secondButtonPressed() {
    Modular.to
        .pushReplacementNamed('/journey/documents', arguments: widget.data);
  }

  void _firstButtonPressed() {
    setState(() {
      current == 4
          ? _launchURLCNJ()
          : pageController.animateToPage(pageController.page!.toInt() + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
    });
  }

  void _launchURLCNJ() async {
    if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    nextButton() {
      if (current == 4) {
        return 'Baixar Modelo';
      } else {
        return 'Próximo';
      }
    }

    jumpToState() {
      if (current == 4) {
        return 'Ver lista';
      } else {
        return 'Pular explicação';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                              pageController.page!.toInt() > 0
                                  ? pageController.previousPage(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: const Color(0xFFD2D2CC),
                        value: current.toDouble() / 4,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.secondary),
                      ),
                    ),
                    customSizedBox3(context),
                    SizedBox(
                      height: mediaQuery.height * .5,
                      child: PageView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: pageController,
                        children: const [
                          Page1Detail(),
                          Page2Detail(),
                          Page3Detail(),
                          Page4Detail(),
                          Page5Detail(),
                          // Page6Detail(),
                          // FreeModel(),
                        ],
                        onPageChanged: (page) => setState(() => current = page),
                      ),
                    ),
                    customSizedBox1(context),
                    ElevatedButton(
                      onPressed: _firstButtonPressed,
                      child: Text(
                        nextButton(),
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
                        primary: AppColors.secondary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(31),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox4(context),
                    ElevatedButton(
                      onPressed: _secondButtonPressed,
                      child: Text(
                        jumpToState(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary,
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
                            color: AppColors.secondary,
                          )),
                    ),
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
      ),
    );
  }
}
