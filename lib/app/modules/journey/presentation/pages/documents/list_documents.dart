import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
<<<<<<< HEAD
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/common/widgets/bottom_navibar.dart';
=======
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
>>>>>>> 3765474ec2e8e4efd0c2cd0daa04b7d09e451375
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_status_tab.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_tab_bar_view.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';

import '../../controllers/docs_controller.dart';

class DocumentsList extends StatefulWidget {
  const DocumentsList({Key? key}) : super(key: key);

  @override
  State<DocumentsList> createState() => _DocumentsListState();
}

class _DocumentsListState extends ModularState<DocumentsList, DocsController>
    with SingleTickerProviderStateMixin {
  List<Widget> tabMenu = [
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
      text: "Gratuitos",
    ),
    const Tab(
      text: "Pagos",
    ),
  ];

  @override
  void initState() {
    controller.tabController =
        TabController(length: tabMenu.length, vsync: this);
    _getDocs();
    super.initState();
  }

  Future<void> _getDocs() async {
    await controller.getUserDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (controller.store.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.store.hasError) {
          return GeneralError(onTryAgain: _getDocs);
        }
        return RefreshIndicator(
          onRefresh: controller.getUserDocuments,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                      child: _buildTopInfo(context),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      backgroundColor: AppColors.background,
                      automaticallyImplyLeading: false,
                      collapsedHeight: 91,
                      elevation: 0,
                      centerTitle: false,
<<<<<<< HEAD
                      flexibleSpace: Column(
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
                                  style: getBoldStyleW900(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          PersonalTabs(
                            tabMenu: tabMenu,
                            onTabSelect: (index) {},
                            tabController: controller.tabController,
                          ),
                        ],
=======
                      flexibleSpace: DocumentsStatusTab(
                        tabController: controller.tabController,
>>>>>>> 3765474ec2e8e4efd0c2cd0daa04b7d09e451375
                      ),
                    ),
                  ];
                },
                body: DocumentsTabBarView(
                  items: controller.docsStore.docs,
                  tabController: controller.tabController,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTopInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: CircularButtom(
            child: const Icon(
              Icons.close,
            ),
            onPress: () {
              Modular.to.pop();
            },
          ),
        ),
      ],
    );
  }
}
