import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/sizedbox_widget.dart';

class IslandsBottomSheet extends StatefulWidget {
  const IslandsBottomSheet({Key? key}) : super(key: key);

  @override
  _IslandsBottomSheetState createState() => _IslandsBottomSheetState();
}

class _IslandsBottomSheetState extends State<IslandsBottomSheet> {
  // final Controller() controller;
  // @override
  // void initState() {
  //   controller =
  //   //CreateController(      repository: CreateRepositoryImpl(database: AppDatabase.instance),
  //  // );
  //   controller.addListener(() {
  //     controller.state.when(
  //         success: (_) {
  //           Navigator.pop(context);
  //         },
  //         orElse: () {});
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
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
        customSizedBox1(context),
        //Linha1
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: ExactAssetImage(
                      'assets/images/island.png',
                    ),
                    radius: 50,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Pedido de Gratuidade',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF256380),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //Linha2
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: ExactAssetImage(
                      'assets/images/island.png',
                    ),
                    radius: 50,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Pedido de Gratuidade',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF256380),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //Linha3
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: ExactAssetImage(
                      'assets/images/island.png',
                    ),
                    radius: 50,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Pedido de Gratuidade',
                    style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF256380),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
