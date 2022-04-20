import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/islands/image_sliders_widget.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page3Tutorial extends StatelessWidget {
  const Page3Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Image.asset(
              imgListTutorial.elementAt(2).toString(),
            ),
          ),
          SizedBox(
            height: 31,
            width: 239,
            child: Text(
              'Desbloqueando uma ilha',
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
              'Depois que você mudar o estado de todos os documentos para “recebido” você vai desbloquear a última ilha que guarda o documento final para o processo.',
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
