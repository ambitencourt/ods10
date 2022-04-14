import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/text_widget.dart';

import '../../../../common/resources/app_text_styles.dart';
import '../widgets/image_sliders_widget.dart';
import '../widgets/sizedbox_widget.dart';

class DocumentDetaills extends StatefulWidget {
  const DocumentDetaills({Key? key}) : super(key: key);

  @override
  State<DocumentDetaills> createState() => _DocumentDetaillsState();
}

class _DocumentDetaillsState extends State<DocumentDetaills> {
  int current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 36, 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(220),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF256380),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => Modular.to.pop(),
                          ),
                          const Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(220),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF256380),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.description_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      customSizedBox2(context),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              imgListDocDetails.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: current == entry.key
                                      ? const Color(0xFFD03363)
                                      : const Color(0xFFB8B8B8),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      customSizedBox2(context),
                      CarouselSlider(
                        items: imageSlidersDocDetails,
                        options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          aspectRatio: 96 / 65,
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          },
                        ),
                        carouselController: _controller,
                      ),
                      customSizedBox2(context),
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
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Próximo',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(225, 44),
                          primary: const Color(0xFFD03363),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(31),
                            ),
                          ),
                        ),
                      ),
                      customSizedBox4(context),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Pular Explicação',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFD03363),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(225, 44),
                            primary: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(31),
                              ),
                            ),
                            side: const BorderSide(
                              width: 1.0,
                              color: Color(0xFFD03363),
                            )),
                      ),
                      customSizedBox3(context),
                      SizedBox(
                        width: 297,
                        height: 32,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'O cartório só poderá exigir os documentos indicados pelo CNJ no provimento ',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF171717),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'nº 73, de 2018.',
                                style: GoogleFonts.mulish(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF171717),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   'O cartório só poderá exigir os documentos indicados pelo CNJ no provimento nº 73, de 2018.',
                        //   textAlign: TextAlign.center,
                        //   style: GoogleFonts.mulish(
                        //     textStyle: const TextStyle(
                        //         fontSize: 12, fontStyle: FontStyle.normal),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
