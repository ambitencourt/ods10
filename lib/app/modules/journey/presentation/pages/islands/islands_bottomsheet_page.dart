import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/islands_page_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/sizedbox_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/islands/image_sliders_widget.dart';

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
                  _buildIslandCircle(
                    context,
                    percent: controller.islandsStore.percentDone[0],
                    island: controller.islandsStore.islands[0],
                    image: AssetImage(
                      imgListIsland.elementAt(1).toString(),
                    ),
                  ),
                  _buildIslandCircle(
                    context,
                    percent: controller.islandsStore.percentDone[1],
                    island: controller.islandsStore.islands[1],
                    image: AssetImage(
                      imgListIsland.elementAt(2).toString(),
                    ),
                  ),
                  _buildIslandCircle(
                    context,
                    percent: controller.islandsStore.percentDone[2],
                    island: controller.islandsStore.islands[2],
                    image: AssetImage(
                      imgListIsland.elementAt(3).toString(),
                    ),
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
                  _buildIslandCircle(
                    context,
                    percent: controller.islandsStore.percentDone[3],
                    island: controller.islandsStore.islands[3],
                    image: AssetImage(
                      imgListIsland.elementAt(4).toString(),
                    ),
                  ),
                  controller.islandsStore.totalDocsDone >=
                          controller.islandsStore.docs.length - 1
                      ? _buildIslandCircle(
                          context,
                          percent: controller.islandsStore.percentDone[4],
                          island: controller.islandsStore.islands[4],
                          image: AssetImage(
                            imgListIsland.elementAt(5).toString(),
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              height: mediaQuery.width * .23,
                              width: mediaQuery.width * .23,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF7C7C7C),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    imgListIsland.elementAt(5).toString(),
                                  ),
                                  const Icon(
                                    Icons.lock,
                                    size: 35,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                            customSizedBox4(context),
                            Text(
                              controller.islandsStore.islands[4].name,
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                  fontSize: mediaQuery.width * .03,
                                  color: AppColors.primary,
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

  Widget _buildIslandCircle(
    BuildContext context, {
    required double percent,
    required IslandEntity island,
    required ImageProvider<Object>? image,
  }) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _onIslandPress(island);
      },
      child: CircularPercentIndicator(
        percent: percent,
        lineWidth: 6,
        animation: true,
        animationDuration: 500,
        center: CircleAvatar(
          backgroundImage: image,
          radius: mediaQuery.width * .105,
        ),
        radius: mediaQuery.width * .12,
        footer: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            island.name,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                fontSize: mediaQuery.width * .03,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFE0E0E0),
        progressColor: AppColors.secondary,
      ),
    );
  }

  void _onIslandPress(IslandEntity island) {
    controller.navigateToIsland(island);
  }
}
