import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/resources/journey_images.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page6Detail extends StatelessWidget {
  const Page6Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(JourneyImages.laerte06),
          ),
          SizedBox(
            height: 31,
            width: 245,
            child: Text(
              'Eaí, entendeu tudo?',
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
          customSizedBox4(context),
          Text(
            'Você pode voltar para as páginas anteriores, basta arrastar da esquerda para a direita. Mas me conta, você vai pedir a gratuidade do processo?',
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
