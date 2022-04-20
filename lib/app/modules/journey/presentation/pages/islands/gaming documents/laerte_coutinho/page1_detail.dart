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
          child: Image.asset(JourneyImages.laerte01),
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
        Text(
          'Essa é a Ilha Laerte Coutinho. Laerte é uma cartunista e chargista brasileira de 70 anos bastante representativa nas causas LGBTQIA+. Nessa ilha vou te auxiliar no processo de gratuidade das custas do cartório.',
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
