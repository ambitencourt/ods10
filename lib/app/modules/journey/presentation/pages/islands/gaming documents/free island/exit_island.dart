import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/links_util.dart';
import '../../../../widgets/sizedbox_widget.dart';

class Exitisland extends StatefulWidget {
  const Exitisland({Key? key}) : super(key: key);

  @override
  State<Exitisland> createState() => _ExitislandState();
}

class _ExitislandState extends State<Exitisland> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    void _launchURLCNJ() async {
      if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
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
                              onTap: () {
                                Modular.to.pop();
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
                            onTap: () {},
                          ),
                        ],
                      ),
                      customSizedBox3(context),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: LinearProgressIndicator(
                          minHeight: 5,
                          backgroundColor: const Color(0xFFD2D2CC),
                          value: 6,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFD03363)),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * .4,
                        child: Image.asset(
                          'assets/images/cuate.png',
                        ),
                      ),
                      SizedBox(
                        height: 27,
                        width: 157,
                        child: Text(
                          'Tudo bem',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      customSizedBox3(context),
                      SizedBox(
                        width: 257,
                        height: 108,
                        child: Text(
                          'Você sempre pode voltar aqui se mudar de ideia. Estou à disposição. Até a próxima e boa sorte na sua retificação.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Modular.to.pushNamed('/journey');
                          });
                        },
                        child: Text(
                          'Sair',
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
                      customSizedBox1(context),
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
