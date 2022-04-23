import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/islands/image_sliders_widget.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page4Tutorial extends StatelessWidget {
  const Page4Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Image.asset(
                imgListTutorial.elementAt(3).toString(),
              ),
            ),
            SizedBox(
              height: 31,
              width: 213,
              child: Text(
                'Vamos começar?',
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
              height: 102,
              child: Text(
                'Você deve selecionar uma das ilhas para iniciar. Nossa sugestão é que seja seguida a ordem, mas você pode explorar livremente na como preferir.',
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
      ),
    );
  }
}
