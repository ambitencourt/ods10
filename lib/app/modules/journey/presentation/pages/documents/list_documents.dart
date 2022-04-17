import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/document_item_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/personal_tabs.dart';

class DocumentsList extends StatefulWidget {
  const DocumentsList({Key? key}) : super(key: key);

  @override
  State<DocumentsList> createState() => _DocumentsListState();
}

class _DocumentsListState extends ModularState<DocumentsList, HomeController>
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
      text: "gratuitos",
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
                      pinned: true,
                      backgroundColor: AppColors.background,
                      automaticallyImplyLeading: false,
                      collapsedHeight: 91,
                      elevation: 0,
                      centerTitle: false,
                      flexibleSpace: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
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
                            tabController: controller.tabController,
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: Observer(
                  builder: (_) {
                    return TabBarView(
                      controller: controller.tabController,
                      children: <Widget>[
                        ListView(
                          children: [
                            ...controller.docsStore.docs
                                .map((e) => DocumentItemWidget(item: e)),
                          ],
                        ),
                        ListView(
                          children: [
                            ...controller.docsStore.docs.map((e) {
                              return e.status == 'missing'
                                  ? DocumentItemWidget(item: e)
                                  : Container();
                            }),
                          ],
                        ),
                        ListView(
                          children: [
                            ...controller.docsStore.docs.map((e) {
                              return e.status == 'requested'
                                  ? DocumentItemWidget(item: e)
                                  : Container();
                            }),
                          ],
                        ),
                        ListView(
                          children: [
                            ...controller.docsStore.docs.map((e) {
                              return e.status == 'ready'
                                  ? DocumentItemWidget(item: e)
                                  : Container();
                            }),
                          ],
                        ),
                        ListView(
                          children: [
                            ...controller.docsStore.docs.map((e) {
                              return e.price == 0
                                  ? DocumentItemWidget(item: e)
                                  : Container();
                            }),
                          ],
                        ),
                        ListView(
                          children: [
                            ...controller.docsStore.docs.map((e) {
                              return e.price > 0
                                  ? DocumentItemWidget(item: e)
                                  : Container();
                            }),
                          ],
                        ),
                      ],
                    );
                  },
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
