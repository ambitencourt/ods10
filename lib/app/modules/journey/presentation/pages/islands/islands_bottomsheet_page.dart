import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/sizedbox_widget.dart';

class IslandsBottomSheet extends StatefulWidget {
  const IslandsBottomSheet({Key? key}) : super(key: key);

  @override
  _IslandsBottomSheetState createState() => _IslandsBottomSheetState();
}

class _IslandsBottomSheetState extends State<IslandsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        InkWell(
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
            ],
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        customSizedBox3(context),
        //Linha1
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/island.png',
                    ),
                    radius: mediaQuery.width * .11,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Pedido de Gratuidade',
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        fontSize: mediaQuery.width * .025,
                        color: const Color(0xFF256380),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/island.png',
                    ),
                    radius: mediaQuery.width * .11,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Ilha João Nery',
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
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/island.png',
                    ),
                    radius: mediaQuery.width * .11,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Ilha João Nery',
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

        //Linha2
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/island.png',
                    ),
                    radius: mediaQuery.width * .11,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Ilha João Nery',
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
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/island.png',
                    ),
                    radius: mediaQuery.width * .11,
                  ),
                  customSizedBox4(context),
                  Text(
                    'Ilha João Nery',
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
        //Linha3
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  // CircleAvatar(
                  //   backgroundImage: const AssetImage(
                  //     'assets/images/lock.png',
                  //   ),
                  //   radius: mediaQuery.width * .11,
                  // ),
                  Container(
                    height: mediaQuery.width * .25,
                    width: mediaQuery.width * .25,
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
                    'Ilha João Nery',
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
      ],
    );
  }
}
