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
import 'package:ods10/app/modules/journey/presentation/widgets/documents_tab_bar_view.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/personal_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
<<<<<<< HEAD
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

=======
>>>>>>> 3765474ec2e8e4efd0c2cd0daa04b7d09e451375
  @override
  void initState() {
    controller.tabController = TabController(length: 6, vsync: this);
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
>>>>>>> de79ec1a23b4b9873f62a77216bccbc11674196c
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
              Modular.to.pushNamed('/journey/documents');
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
        Modular.to.pushNamed('/journey/tutorial');
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
                Observer(builder: (_) {
                  return LinearProgressIndicator(
                    value: controller.docsStore.percentDone,
                    backgroundColor: AppColors.white.withOpacity(0.4),
                    color: AppColors.secondary,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
