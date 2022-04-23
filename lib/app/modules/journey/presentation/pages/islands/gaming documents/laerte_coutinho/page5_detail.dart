import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/resources/journey_images.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page5Detail extends StatelessWidget {
  const Page5Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(JourneyImages.laerte05),
          ),
          SizedBox(
            height: 27,
            width: 213,
            child: Text(
              'Tem um porém',
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
            'Nem todos os cartórios respeitam essa previsão legal. Então, caso você tenha algum problema com o cartório, procure a Defensoria Pública do seu estado.',
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
