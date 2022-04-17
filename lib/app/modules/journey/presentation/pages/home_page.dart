import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_images.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/common/widgets/bottom_navibar.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/document_item_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_status_tab.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/personal_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
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
                      collapsedHeight: 91,
                      elevation: 0,
                      centerTitle: false,
                      flexibleSpace: DocumentsStatusTab(
                        tabController: controller.tabController,
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
      bottomNavigationBar: const BottomNavibar(),
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
          alignment: Alignment.centerRight,
          child: CircularButtom(
            child: const Icon(
              Icons.description_outlined,
            ),
            onPress: () {
              Modular.to.pushNamed('/journey/details');
            },
          ),
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Olá, ',
                    style: getRegularStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: controller.userStore.user?.name ?? '',
                    style: getBoldStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Entenda como ',
                style: getRegularStyle(fontSize: 32),
              ),
              TextSpan(
                text: 'retificar',
                style: getBoldStyle(fontSize: 32),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'prenome e gênero',
              style: getBoldStyle(fontSize: 32, color: AppColors.white),
            ),
          ),
        ),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'O ',
                style: getRegularStyle(fontSize: 18),
              ),
              TextSpan(
                text: 'passo a passo ',
                style: getBoldStyle(fontSize: 18),
              ),
              TextSpan(
                text: 'da retificação',
                style: getRegularStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildCentralImage(context),
      ],
    );
  }

  Widget _buildCentralImage(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/journey/islands');
      },
      child: Stack(
        children: [
          Hero(
            tag: 'hero-island-page',
            child: Image.asset(
              AppImages.rectangle1816,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Acompanhe sua documentação',
                  style: getBoldStyle(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Organize seus documentos e acompanhe o processo para a alteração do prenome e gênero com a ordem recomendada pelos nossos especialistas.',
                  style: getBoldStyle(
                    fontSize: 12,
                    color: AppColors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: AppColors.white.withOpacity(0.4),
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
