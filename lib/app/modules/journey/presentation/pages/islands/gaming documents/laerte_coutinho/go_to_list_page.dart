import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/modules/journey/presentation/resources/journey_images.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';

import '../../../../../utils/links_util.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class GoToListPage extends StatefulWidget {
  final Map data;
  const GoToListPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<GoToListPage> createState() => _GoToListPageState();
}

class _GoToListPageState extends State<GoToListPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    void _launchURLCNJ() async {
      if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
    }

    return Scaffold(
      body: SingleChildScrollView(
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
                          AlwaysStoppedAnimation<Color>(AppColors.secondary),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * .4,
                    child: Image.asset(
                      JourneyImages.laerte07,
                    ),
                  ),
                  Text(
                    'Eba! Que ótimo.',
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
                    'Vou apresentar o documento necessário em uma lista para você visualizar e também vou disponibilizar um modelo para download. Não esquece de mudar o estado para recebido quando tiver a documentação.',
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
                    onPressed: () {
                      setState(() {
                        Modular.to.pushReplacementNamed('/journey/documents',
                            arguments: widget.data);
                      });
                    },
                    child: Text(
                      'Ok',
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
    );
  }
}
