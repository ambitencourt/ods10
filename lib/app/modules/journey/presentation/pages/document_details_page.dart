import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/pages/Document%20Details/page1_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/links_util.dart';
import '../widgets/image_sliders_widget.dart';
import '../widgets/sizedbox_widget.dart';
import 'Document Details/page2_detail.dart';
import 'Document Details/page3_detail.dart';
import 'Document Details/page4_detail.dart';
import 'Document Details/page5_detail.dart';
import 'Document Details/page6_detail.dart';
import 'Document Details/page7_detail.dart';

class DocumentDetaills extends StatefulWidget {
  const DocumentDetaills({Key? key}) : super(key: key);

  @override
  State<DocumentDetaills> createState() => _DocumentDetaillsState();
}

class _DocumentDetaillsState extends State<DocumentDetaills> {
  int current = 0;
  final CarouselController _controller = CarouselController();
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: current,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    double _progressValue = 0.0;
    void _launchURLCNJ() async {
      if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
    }

    nextButton() {
      if (current == 5) {
        return 'Pedir Gratuidade ';
      } else if (current == 6) {
        return 'Baixar Modelo';
      } else {
        return 'Próximo';
      }
    }

    jumpToState() {
      if (current == 5) {
        return 'Não pedir Gratuidade ';
      } else if (current == 6) {
        return 'Atualizar estado';
      } else {
        return 'Pular explicação';
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                  color: Color(0xFF256380),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => Modular.to.pop(),
                          ),
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
                            onTap: () {},
                          ),
                        ],
                      ),
                      customSizedBox3(context),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: LinearProgressIndicator(
                          minHeight: 5,
                          backgroundColor: const Color(0xFFD2D2CC),
                          value: current.toDouble() / 6,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFD03363)),
                        ),
                      ),
                      customSizedBox3(context),
                      SizedBox(
                        height: mediaQuery.height * .5,
                        child: PageView(
                          controller: pageController,
                          children: const [
                            Page1Detail(),
                            Page2Detail(),
                            Page3Detail(),
                            Page4Detail(),
                            Page5Detail(),
                            Page6Detail(),
                            Page7Detail(),
                          ],
                          onPageChanged: (page) =>
                              setState(() => current = page),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            current == 5
                                ? pageController.jumpToPage(6)
                                : pageController.animateToPage(current + 1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                          });
                        },
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
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          jumpToState(),
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
                      customSizedBox3(context),
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
