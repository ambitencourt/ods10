import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';
import 'package:ods10/app/modules/journey/utils/links_util.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class FreeModel extends StatelessWidget {
  final Map data;
  const FreeModel({
    Key? key,
    required this.data,
  }) : super(key: key);

  void _launchURLCNJ() async {
    if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 20, 36, 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularButtom(
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.white,
                          ),
                          onPress: () {
                            Modular.to.pop();
                          }),
                      const Spacer(),
                      CircularButtom(
                        child: const Icon(
                          Icons.description_outlined,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPress: () =>
                            Modular.to.pushNamed('/journey/documents'),
                      ),
                    ],
                  ),
                  customSizedBox3(context),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: LinearProgressIndicator(
                      minHeight: 5,
                      backgroundColor: Color(0xFFD2D2CC),
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
                  Text(
                    'Modelo de gratuidade',
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
                  customSizedBox3(context),
                  Text(
                    'Vou disponibilizar um modelo para te ajudar. Basta baixar, editar e entregar no cartório que você deseja adquirir o documento de maneira gratuita.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  customSizedBox3(context),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Baixar modelo',
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
                    onPressed: () => Modular.to.pushReplacementNamed(
                        '/journey/documents',
                        arguments: data),
                    child: Text(
                      'Ver lista',
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
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Flexible(
      //       child: Image.asset(
      //         imgListDocDetails.elementAt(0).toString(),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 31,
      //       width: 213,
      //       child: Text(
      //         'Modelo de gratuidade',
      //         textAlign: TextAlign.center,
      //         style: GoogleFonts.mulish(
      //           textStyle: const TextStyle(
      //             fontSize: 20,
      //             fontStyle: FontStyle.italic,
      //             fontWeight: FontWeight.w700,
      //             color: Colors.black,
      //           ),
      //         ),
      //       ),
      //     ),
      //     customSizedBox4(context),
      //     Text(
      //       'Vou disponibilizar um modelo para te ajudar. Basta baixar, editar e entregar no cartório que você deseja adquirir o documento de maneira gratuita.',
      //       textAlign: TextAlign.center,
      //       style: GoogleFonts.mulish(
      //         textStyle: const TextStyle(
      //             fontSize: 16,
      //             fontStyle: FontStyle.normal,
      //             fontWeight: FontWeight.w500),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
