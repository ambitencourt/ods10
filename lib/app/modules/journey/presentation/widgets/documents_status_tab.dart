// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/personal_tabs.dart';

class DocumentsStatusTab extends StatelessWidget {
  late TabController _tabController;
  DocumentsStatusTab({
    Key? key,
    required tabController,
  }) : super(key: key) {
    _tabController = tabController;
  }

  final List<Widget> tabMenu = [
    const Tab(
      text: "Todos",
    ),
    const Tab(
      text: "Pendentes",
    ),
    const Tab(
      text: "Solicitados",
    ),
    const Tab(
      text: "Recebidos",
    ),
    const Tab(
      text: "gratuitos",
    ),
    const Tab(
      text: "Pagos",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Lista de ',
                style: getRegularStyle(fontSize: 18),
              ),
              TextSpan(
                text: 'Documentos',
                style: getBoldStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        PersonalTabs(
          tabMenu: tabMenu,
          onTabSelect: (index) {},
          tabController: _tabController,
        ),
      ],
    );
  }
}
