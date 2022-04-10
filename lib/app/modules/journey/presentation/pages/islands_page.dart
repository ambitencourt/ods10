import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/sizedbox_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/image_sliders_widget.dart';
import '../widgets/islands_bottomsheet_widget.dart';
import 'islands_bottomsheet_page.dart';

class IslandsPage extends StatefulWidget {
  const IslandsPage({Key? key}) : super(key: key);

  @override
  State<IslandsPage> createState() => _IslandsPageState();
}

class _IslandsPageState extends State<IslandsPage> {
  int current = 0;
  double _progressValue = 0.0;

  void _onChanged(double progressValue) {
    _progressValue = progressValue;
  }

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
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
                                Icons.help_outline,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      customSizedBox4(context),
                      SizedBox(
                        height: 27,
                        width: 157,
                        child: Text(
                          'Boas vindas ao',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSerifDisplay(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF256380)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 335,
                        height: 49,
                        child: Text(
                          'Oceanótico',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSerifDisplay(
                            textStyle: const TextStyle(
                                fontSize: 36, fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      customSizedBox3(context),
                      SizedBox(
                        width: 335,
                        height: 36,
                        child: Text(
                          'Arraste para o lado ou veja a lista completa de ilhas. Selecione uma das ilhas e inicie o processo.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                fontSize: 14, fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CarouselSlider(
                      items: imageSliders,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(220),
                          child: Container(
                            width: 41,
                            height: 41,
                            decoration: const BoxDecoration(
                                color: Color(0xFF256380),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () => _controller.previousPage(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(220),
                            child: Container(
                              width: 41,
                              height: 41,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF256380),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              _controller.nextPage();
                            }),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
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
                Center(
                  child: Column(
                    children: [
                      // Slider(
                      //   value: _progressValue,
                      //   onChanged: (double _progressValue) {
                      //     setState(() {
                      //       _onChanged(_progressValue);
                      //     });
                      //   },
                      //   min: 0.0,
                      //   max: 30.0,
                      // ),
                      // Text('${_progressValue.round()}'),
                      customSizedBox2(context),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: LinearProgressIndicator(
                          minHeight: 5,
                          backgroundColor: const Color(0xFFD2D2CC),
                          value: _progressValue / 30,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFD03363)),
                        ),
                      ),
                      customSizedBox4(context),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        Text(
                          'Desbloquear Ilha Erika Hilton',
                          style: GoogleFonts.mulish(
                              textStyle: const TextStyle(fontSize: 10),
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        Text(
                          '${_progressValue.round()}/30 documentos',
                          style: GoogleFonts.mulish(
                              textStyle: const TextStyle(fontSize: 10),
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // maxWidth: MediaQuery.of(context).size.width * 1,
          //   maxHeight: MediaQuery.of(context).size.height * .2,
          DraggableScrollableSheet(
            minChildSize: 0.1,
            maxChildSize: 0.65,
            initialChildSize: 0.1,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: const Card(
                  elevation: 15,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  color: Colors.white,
                  child: IslandsBottomSheet(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
