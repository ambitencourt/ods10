import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/image_sliders_widget.dart';
import '../../widgets/sizedbox_widget.dart';

class Page1Detail extends StatelessWidget {
  const Page1Detail({Key? key}) : super(key: key);

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
              'Boas vindas',
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
            height: 108,
            child: Text(
              'Eu sou a Pam, sou travesti e vou te auxiliar no processo de gratuidade das custas do cartório, mas antes vou te explicar um pouco sobre isso.',
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
