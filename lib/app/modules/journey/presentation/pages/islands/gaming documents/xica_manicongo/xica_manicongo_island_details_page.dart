import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../utils/links_util.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';
import 'page1_detail.dart';
import 'page2_detail.dart';
import 'page3_detail.dart';
import 'page4_detail.dart';
import 'page5_detail.dart';
import 'page6_detail.dart';

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
    pageController.page!.toInt() != 5
        ? Modular.to
            .pushReplacementNamed('/journey/documents', arguments: widget.data)
        : Modular.to.pushReplacementNamed('/journey/xica-go-to-list',
            arguments: widget.data);
  }

  void _firstButtonPressed() {
    setState(() {
      current == 5
          ? Modular.to.pushReplacementNamed('/journey/xica-go-to-download',
              arguments: widget.data)
          : pageController.animateToPage(pageController.page!.toInt() + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    void _launchURLCNJ() async {
      if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
    }

    nextButton() {
      if (current == 4) {
        return 'Baixar Modelo';
      } else if (current == 5) {
        return 'Voltar ao arquipélago';
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
                                  color: Color(0xFF256380),
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
                                color: Color(0xFF256380),
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
                        value: current.toDouble() / 5,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFD03363)),
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
                          Page6Detail(),
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
                        primary: const Color(0xFFD03363),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(31),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox4(context),
                    // Visibility(
                    //   replacement: const SizedBox.expand(),
                    //   visible: current == 5 ? true : false,
                    //   child: ElevatedButton(
                    //     onPressed: _secondButtonPressed,
                    //     child: Text(
                    //       jumpToState(),
                    //       textAlign: TextAlign.center,
                    //       style: GoogleFonts.mulish(
                    //         textStyle: const TextStyle(
                    //           fontSize: 16,
                    //           fontStyle: FontStyle.normal,
                    //           fontWeight: FontWeight.w700,
                    //           color: Color(0xFFD03363),
                    //         ),
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //         fixedSize: const Size(225, 44),
                    //         primary: Colors.white,
                    //         shape: const RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(31),
                    //           ),
                    //         ),
                    //         side: const BorderSide(
                    //           width: 1.0,
                    //           color: Color(0xFFD03363),
                    //         )),
                    //   ),
                    // ),
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
