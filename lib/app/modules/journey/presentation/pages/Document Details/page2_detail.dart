import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/image_sliders_widget.dart';
import '../../widgets/sizedbox_widget.dart';

class Page2Detail extends StatelessWidget {
  const Page2Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Image.asset(
              imgListDocDetails.elementAt(0).toString(),
            ),
          ),
          SizedBox(
            height: 27,
            width: 157,
            child: Text(
              'Explicando melhor',
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
          SizedBox(
            width: 257,
            height: 122,
            child: Text(
              'Segundo a Lei de Registros Públicos (Lei nº 6.015/1973) é garantida a gratuidade da segunda via das certidões para pessoas que se declararem carentes financeiramente.',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
