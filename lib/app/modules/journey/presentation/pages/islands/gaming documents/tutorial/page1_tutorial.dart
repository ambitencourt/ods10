import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/islands/image_sliders_widget.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page1Tutorial extends StatelessWidget {
  const Page1Tutorial({Key? key}) : super(key: key);

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
              'Oi, eu me chamo Alex',
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
              'Sou uma pessoa não binária e vou te guiar por todo o processo de retificação da sua documentação. E como funciona esse processo? ',
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
