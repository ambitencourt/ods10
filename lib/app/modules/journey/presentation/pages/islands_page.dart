import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/sizedbox_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/image_sliders_widget.dart';
import '../widgets/islands_bottomsheet_widget.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {},
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
                                      size: 30,
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
                                      fontSize: 36,
                                      fontStyle: FontStyle.normal),
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
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CarouselSlider(
                                items: imageSliders,
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1,
                                  aspectRatio: 1.4,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                ),
                                carouselController: _controller,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () => _controller.previousPage(),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .05,
                                  ),
                                  InkWell(
                                      borderRadius: BorderRadius.circular(220),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF256380),
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          size: 30,
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
                        ],
                      ),
                      Row(
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
                      Column(
                        children: [
                          Slider(
                            value: _progressValue,
                            onChanged: (double _progressValue) {
                              setState(() {
                                _onChanged(_progressValue);
                              });
                            },
                            min: 0.0,
                            max: 30.0,
                          ),
                          Text('${_progressValue.round()}'),
                          customSizedBox1(context),
                          LinearProgressIndicator(
                            value: _progressValue / 30,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFD03363)),
                          ),
                          Text(
                            'Desbloquear Ilha Erika Hilton     ${_progressValue.round()}/30 documentos',
                            style: GoogleFonts.mulish(),
                          ),
                        ],
                      ),
                      // DraggableScrollableSheet(
                      //   builder: (context, scrollController) {
                      //     //return showModal(context);
                      //     return ListTile(
                      //       title: Text(
                      //         'Lista de ilhas',
                      //         style: GoogleFonts.mulish(
                      //           textStyle: const TextStyle(
                      //             fontSize: 14,
                      //             color: Color(0xFF256380),
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
