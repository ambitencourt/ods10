import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/resources/journey_images.dart';
import '../../../../widgets/islands/sizedbox_widget.dart';

class Page3Detail extends StatelessWidget {
  const Page3Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(JourneyImages.laerte03),
          ),
          SizedBox(
            height: 27,
            width: 157,
            child: Text(
              'Ou seja',
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
            'Isso significa que você pode conseguir os documentos do cartório de maneira gratuita. Legal, né?',
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
