import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/resources/journey_images.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page1Detail extends StatelessWidget {
  const Page1Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(JourneyImages.xica01),
        ),
        SizedBox(
          height: 31,
          width: 213,
          child: Text(
            'Você está bem perto',
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
          'Você já conseguiu reunir todos os documentos necessários para a retificação de nome e/ou gênero. Agora, na Ilha Xica Manicongo, você vai ter acesso ao último documento necessário.',
          textAlign: TextAlign.center,
          style: GoogleFonts.mulish(
            textStyle: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
