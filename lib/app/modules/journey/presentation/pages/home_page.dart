import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_images.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';
import 'package:ods10/app/common/widgets/bottom_navibar.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_status_tab.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_tab_bar_view.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';

import '../../../../common/widgets/circular_buttom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
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
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RefreshIndicator(
              notificationPredicate: (notification) {
                // with NestedScrollView local(depth == 2) OverscrollNotification are not sent
                if (notification is OverscrollNotification || Platform.isIOS) {
                  return notification.depth == 2;
                }
                return notification.depth == 0;
              },
              onRefresh: controller.getUserDocuments,
              child: NestedScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                body: DocumentsTabBarView(
                  items: controller.islandsStore.docs,
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
                    text: 'Ol??, ',
                    style: getRegularStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: controller.userStore.user?.name ?? '',
                    style: getBoldStyleW900(fontSize: 20),
                  ),
                  TextSpan(
                    text: ' ????',
                    style: getRegularStyle(fontSize: 20),
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
                style: getRegularStyle(fontSize: 30),
              ),
              TextSpan(
                text: 'retificar',
                style: getBoldStyleW900(fontSize: 30),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'nome e g??nero',
              style: getBoldStyleW900(fontSize: 30, color: AppColors.primary),
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
                style: getBoldStyleW900(fontSize: 18),
              ),
              TextSpan(
                text: 'da retifica????o',
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
        controller.navigateToIslands();
      },
      child: Stack(
        children: [
          Hero(
            tag: 'hero-island-page',
            child: Image.asset(
              AppImages.islands,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Acompanhe sua documenta????o',
                  style: getBoldStyle(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 39,
                  width: 299,
                  child: Text(
                    'Organize seus documentos e acompanhe o processo para a altera????o do prenome e g??nero com a ordem recomendada pelos nossos especialistas.',
                    textAlign: TextAlign.justify,
                    style: getRegularStyleW600(
                      fontSize: 12,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Observer(builder: (_) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: LinearProgressIndicator(
                      value: controller.islandsStore.totalPercentDone,
                      backgroundColor: AppColors.white.withOpacity(0.4),
                      color: AppColors.secondary,
                      minHeight: 7,
                    ),
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
