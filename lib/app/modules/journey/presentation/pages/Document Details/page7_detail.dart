import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/image_sliders_widget.dart';
import '../../widgets/sizedbox_widget.dart';

class Page7Detail extends StatelessWidget {
  const Page7Detail({Key? key}) : super(key: key);

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
            height: 31,
            width: 213,
            child: Text(
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
          ),
          customSizedBox4(context),
          SizedBox(
            width: 257,
            height: 101,
            child: Text(
              'Vou disponibilizar um modelo para te ajudar. Basta baixar, editar e entregar no cartório que você deseja adquirir o documento de maneira gratuita.',
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
