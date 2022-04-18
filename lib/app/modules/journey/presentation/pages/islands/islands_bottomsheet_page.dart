import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/islands_page_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/sizedbox_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class IslandsBottomSheet extends StatefulWidget {
  const IslandsBottomSheet({Key? key}) : super(key: key);

  @override
  _IslandsBottomSheetState createState() => _IslandsBottomSheetState();
}

class _IslandsBottomSheetState
    extends ModularState<IslandsBottomSheet, IslandsPageController> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            const SizedBox(height: 30),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lista de ilhas',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2B2B2B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.expand_more,
                    size: 24,
                    color: Color(0xFF2B2B2B),
                  ),
                ],
              ),
            ),
            customSizedBox1(context),
            //Linha1
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    percent: controller.islandsStore.percentDone[0],
                    lineWidth: 6,
                    animation: true,
                    animationDuration: 500,
                    center: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/island.png',
                      ),
                      radius: mediaQuery.width * .105,
                    ),
                    radius: mediaQuery.width * .12,
                    footer: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        controller.islandsStore.islands[0].name,
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            fontSize: mediaQuery.width * .027,
                            color: const Color(0xFF256380),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: const Color(0xFFE0E0E0),
                    progressColor: const Color(0xFFD03363),
                  ),
                  CircularPercentIndicator(
                    percent: controller.islandsStore.percentDone[1],
                    lineWidth: 6,
                    animation: true,
                    animationDuration: 500,
                    center: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/island.png',
                      ),
                      radius: mediaQuery.width * .105,
                    ),
                    radius: mediaQuery.width * .12,
                    footer: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        controller.islandsStore.islands[1].name,
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            fontSize: mediaQuery.width * .027,
                            color: const Color(0xFF256380),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: const Color(0xFFE0E0E0),
                    progressColor: const Color(0xFFD03363),
                  ),
                  CircularPercentIndicator(
                    percent: controller.islandsStore.percentDone[2],
                    lineWidth: 6,
                    animation: true,
                    animationDuration: 500,
                    center: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/island.png',
                      ),
                      radius: mediaQuery.width * .105,
                    ),
                    radius: mediaQuery.width * .12,
                    footer: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        controller.islandsStore.islands[2].name,
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            fontSize: mediaQuery.width * .027,
                            color: const Color(0xFF256380),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: const Color(0xFFE0E0E0),
                    progressColor: const Color(0xFFD03363),
                  ),
                ],
              ),
            ),
            customSizedBox2(context),
            //Linha2
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    percent: controller.islandsStore.percentDone[3],
                    lineWidth: 6,
                    animation: true,
                    animationDuration: 500,
                    center: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/island.png',
                      ),
                      radius: mediaQuery.width * .105,
                    ),
                    radius: mediaQuery.width * .12,
                    footer: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        controller.islandsStore.islands[3].name,
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            fontSize: mediaQuery.width * .027,
                            color: const Color(0xFF256380),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: const Color(0xFFE0E0E0),
                    progressColor: const Color(0xFFD03363),
                  ),
                  // CircularPercentIndicator(
                  //   percent: 0.75,
                  //   lineWidth: 6,
                  //   animation: true,
                  //   animationDuration: 500,
                  //   center: CircleAvatar(
                  //     backgroundImage: const AssetImage(
                  //       'assets/images/island.png',
                  //     ),
                  //     radius: mediaQuery.width * .105,
                  //   ),
                  //   radius: mediaQuery.width * .12,
                  //   footer: Padding(
                  //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  //     child: Text(
                  //       'Requerimento',
                  //       style: GoogleFonts.mulish(
                  //         textStyle: TextStyle(
                  //           fontSize: mediaQuery.width * .03,
                  //           color: const Color(0xFF256380),
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   backgroundColor: const Color(0xFFE0E0E0),
                  //   progressColor: const Color(0xFFD03363),
                  // ),
                  Column(
                    children: [
                      Container(
                        height: mediaQuery.width * .23,
                        width: mediaQuery.width * .22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF7C7C7C),
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: mediaQuery.width * .16,
                        ),
                        alignment: Alignment.center,
                      ),
                      customSizedBox4(context),
                      Text(
                        'Requerimento',
                        style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                            fontSize: mediaQuery.width * .03,
                            color: const Color(0xFF256380),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
