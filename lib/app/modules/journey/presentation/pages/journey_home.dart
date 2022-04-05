import 'package:flutter/material.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/sizedbox_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/text_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class JourneyHome extends StatefulWidget {
  const JourneyHome({Key? key}) : super(key: key);

  @override
  State<JourneyHome> createState() => _JourneyHomeState();
}

class _JourneyHomeState extends State<JourneyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 35,
            right: 36,
            child: CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 12.0,
              percent: 0.25,
              center: const TextWidget(
                  data: '25%',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              backgroundColor: const Color(0xFFE4E4E4),
              progressColor: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 36, 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 30,
                          onPressed: () {},
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      customSizedBox2(context),
                      SizedBox(
                        width: 222,
                        height: 56,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: const [
                            TextWidget(
                              data: 'Bem vinda ao seu espaço',
                              fontSize: 32,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              height: 0.8,
                            ),
                          ],
                        ),
                      ),
                      customSizedBox2(context),
                      const SizedBox(
                        height: 66,
                        width: 357,
                        child: TextWidget(
                          data:
                              'Aqui você tem acesso a lista de documentos e um passo a passo para conseguir cada um deles. ',
                          fontSize: 17,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          align: TextAlign.start,
                        ),
                      ),
                      customSizedBox3(context),
                      const TextWidget(
                        data: 'DOCUMENTOS NECESSÁRIOS',
                        fontSize: 13,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        align: TextAlign.start,
                      ),
                      customSizedBox4(context),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const ExpansionTile(
                          children: [
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                          ],
                          title: TextWidget(
                            data: 'Documentos Pessoais (4/6)',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF22212E),
                            height: 1.1,
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 16.15,
                          ),
                        ),
                      ),
                      customSizedBox4(context),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const ExpansionTile(
                          children: [
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                          ],
                          title: TextWidget(
                            data: 'Certidões (1/7)',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF22212E),
                            height: 1.1,
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 16.15,
                          ),
                        ),
                      ),
                      customSizedBox4(context),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const ExpansionTile(
                          children: [
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                          ],
                          title: TextWidget(
                            data:
                                'Requerimento para alteração do registro civil',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF22212E),
                            height: 1.1,
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 16.15,
                          ),
                        ),
                      ),
                      customSizedBox1(context),
                      const TextWidget(
                        data: 'DOCUMENTOS EXTRAS',
                        fontSize: 13,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        align: TextAlign.start,
                      ),
                      customSizedBox4(context),
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const ExpansionTile(
                          children: [
                            Card(
                              child: Text('Certidão de Nascimento'),
                            ),
                          ],
                          title: TextWidget(
                            data: 'Gratuidade das custas do cartório',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF22212E),
                            height: 1.1,
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 16.15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  customSizedBox2(context),
                  const SizedBox(
                    width: 288,
                    height: 54,
                    child: TextWidget(
                      data:
                          'O cartório não poderá exigir qualquer outro documento além daqueles indicados pelo CNJ no provimento nº 73, de 2018.',
                      fontSize: 14,
                      color: Color(0xFF22212E),
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      align: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
