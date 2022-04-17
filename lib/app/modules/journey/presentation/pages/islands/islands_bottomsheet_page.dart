import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/islands/sizedbox_widget.dart';

class IslandsBottomSheet extends StatefulWidget {
  const IslandsBottomSheet({Key? key}) : super(key: key);

  @override
  _IslandsBottomSheetState createState() => _IslandsBottomSheetState();
}

class _IslandsBottomSheetState extends State<IslandsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
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
                color: Colors.black,
              ),
            ],
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
                      'Pedido de gratuidade',
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
      ),
    );
  }
}
