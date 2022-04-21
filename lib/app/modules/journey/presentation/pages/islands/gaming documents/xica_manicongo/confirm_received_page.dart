import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/sizedbox_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/links_util.dart';

class ConfirmReceivedPage extends StatefulWidget {
  const ConfirmReceivedPage({Key? key}) : super(key: key);

  @override
  _ConfirmReceivedPageState createState() => _ConfirmReceivedPageState();
}

class _ConfirmReceivedPageState extends State<ConfirmReceivedPage> {
  @override
  Widget build(BuildContext context) {
    void _launchURLFAQ() async {
      if (!await launch(urlFAQ)) throw 'Tente novamente mais tarde $urlFAQ';
    }

    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 31,
                child: Text(
                  'Recebeu seu documento?',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2B2B2B),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          customSizedBox4(context),
          SizedBox(
            width: 257,
            height: 123,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text:
                      'Que maravilha. Isso significa que você já está em posse do documento que garante a gratuidade de todo o processo. ',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextSpan(
                  text: 'Você confirma o recebimento desse documento?',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          customSizedBox3(context),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text(
              'Confirmar',
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
              'Não recebi ainda',
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
          customSizedBox4(context),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tive um problema com esse documento',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFD03363),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _launchURLFAQ(),
                ),
              ],
            ),
          ),
          customSizedBox4(context),
        ],
      ),
    );
  }
}
