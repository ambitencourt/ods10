import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/islands_page_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/open_modal_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/sizedbox_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../widgets/islands/image_sliders_widget.dart';

class IslandsPage extends StatefulWidget {
  const IslandsPage({Key? key}) : super(key: key);

  @override
  State<IslandsPage> createState() => _IslandsPageState();
}

class _IslandsPageState
    extends ModularState<IslandsPage, IslandsPageController> {
  @override
  void initState() {
    super.initState();
    _getIslands();
  }

  Future<void> _getIslands() async {
    await controller.getIslands();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (controller.islandsPageStore.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.islandsPageStore.hasError) {
            return GeneralError(onTryAgain: _getIslands);
          }
          return SingleChildScrollView(
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
                            onTap: () =>
                                Modular.to.pushNamed('/journey/documents'),
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
                          controller
                              .islandsStore
                              .islands[controller.islandsPageStore.current]
                              .name,
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
                          controller
                              .islandsStore
                              .islands[controller.islandsPageStore.current]
                              .description,
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
                  alignment: const Alignment(0, -0.35),
                  children: [
                    //Aqui foi utilizado o Package carousel_slider, podendo fazer manualmente no futuro
                    Hero(
                      tag: 'hero-island-page',
                      child: CarouselSlider(
                        items: imageSlidersIsland,
                        options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          aspectRatio: 96 / 65,
                          onPageChanged: (index, reason) {
                            controller.islandsPageStore.setCurrentIndex(index);
                          },
                        ),
                        carouselController: controller.carouselController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(220),
                          child: controller.islandsPageStore.current == 0
                              ? Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(20, 255, 255, 255),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                )
                              : Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    color: const Color(0xFF256380),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                          onTap: () =>
                              controller.carouselController.previousPage(),
                        ),
                        SizedBox(
                          width: mediaQuery.width * .5,
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(220),
                            child: controller.islandsPageStore.current == 4
                                ? Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(20, 255, 255, 255),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  )
                                : Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      color: const Color(0xFF256380),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                            onTap: () {
                              controller.carouselController.nextPage();
                            }),
                      ],
                    ),
                    //TODO Criar lógica para as ilhas
                    Positioned(
                      top: 150,
                      child: Visibility(
                        visible: controller.islandsPageStore.current > 0,
                        child: controller.islandsPageStore.current != 4
                            ? Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(38),
                                  ),
                                ),
                                height: 62,
                                width: 187,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        percent: 0.5,
                                        lineWidth: 5,
                                        animation: true,
                                        animationDuration: 500,
                                        center: const Icon(
                                          Icons.play_arrow,
                                          size: 30,
                                          color: Color(0xFFD03363),
                                        ),
                                        radius: mediaQuery.width * .07,
                                        backgroundColor:
                                            const Color(0xFFE0E0E0),
                                        progressColor: const Color(0xFFD03363),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Entrar na ilha',
                                            style: GoogleFonts.mulish(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'João Nery',
                                            style: GoogleFonts.dmSerifDisplay(
                                              textStyle: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(38),
                                  ),
                                ),
                                height: 62,
                                width: 187,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        percent: 0,
                                        lineWidth: 5,
                                        animation: true,
                                        animationDuration: 500,
                                        center: const Icon(
                                          Icons.lock,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        radius: mediaQuery.width * .07,
                                        backgroundColor:
                                            const Color(0xFFC8C8C8),
                                        progressColor: const Color(0xFFD03363),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Entrar na ilha',
                                            style: GoogleFonts.mulish(
                                              textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Requerimento',
                                            style: GoogleFonts.dmSerifDisplay(
                                              textStyle: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        //TODO Aqui finaliza a lógica provisória
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgListIsland.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                controller.islandsPageStore.current == entry.key
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
                      customSizedBox1(context),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: LinearProgressIndicator(
                          minHeight: 5,
                          backgroundColor: const Color(0xFFD2D2CC),
                          value: controller.islandsPageStore.progressValue / 22,
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
                          '${controller.islandsPageStore.progressValue.round()}/22 documentos',
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
          );
        },
      ),
      bottomSheet: Observer(builder: (_) {
        if (controller.islandsPageStore.loading) {
          return const SizedBox(height: 1);
        }
        return SizedBox(
          height: 70,
          child: InkWell(
            onTap: () => openModal(context),
            child: Card(
              elevation: 15,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lista de ilhas',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF256380),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.expand_less,
                    color: Color(0xFF256380),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
