import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/islands/image_sliders_widget.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page2Tutorial extends StatelessWidget {
  const Page2Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Image.asset(
              imgListTutorial.elementAt(1).toString(),
            ),
          ),
          SizedBox(
            height: 31,
            width: 213,
            child: Text(
              'Vou te explicar',
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
            height: 124,
            child: Text(
              'Os documentos estão divididos em ilhas e, à medida que você receber cada documento e atualizar o status para "recebido", conseguirá avançar no seu processo de retificação.',
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
