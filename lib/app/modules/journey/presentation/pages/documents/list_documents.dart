import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/widgets/circular_buttom_widget.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/home_controller.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_status_tab.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/documents_tab_bar_view.dart';
import 'package:ods10/app/modules/journey/presentation/widgets/general_error_widget.dart';

class DocumentsList extends StatefulWidget {
  final Map? islandId;
  const DocumentsList({
    Key? key,
    this.islandId,
  }) : super(key: key);

  @override
  State<DocumentsList> createState() => _DocumentsListState();
}

class _DocumentsListState extends ModularState<DocumentsList, HomeController>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller.tabController = TabController(length: 6, vsync: this);
    _getDocs();
    super.initState();
    when((_) => shouldNavigate(controller.islandsStore.islands), () {
      autoNavigation();
    });
  }

  Future<void> _getDocs() async {
    await controller.getUserDocuments();
  }

  bool shouldNavigate(List<IslandEntity> list) {
    // if (_init) return false;
    if (widget.islandId == null) false;
    final islandIndex = controller.islandsStore.islands
        .indexWhere((element) => element.id == widget.islandId?['islandId']);
    if (controller.islandsStore.percentDone[islandIndex] == 1) {
      return true;
    } else {
      return false;
    }
  }

  autoNavigation() {
    if (widget.islandId == null) return;
    final islandIndex = controller.islandsStore.islands
        .indexWhere((element) => element.id == widget.islandId?['islandId']);
    if (controller.islandsStore.percentDone[islandIndex] == 1) {
      switch (islandIndex) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          Navigator.of(context).pop();
          Modular.to.pushNamed('/journey/xica_manicongo_done');
          break;
        case 5:
          break;
        default:
          return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? id = widget.islandId?['islandId'];
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
          notificationPredicate: (notification) {
            if (notification is OverscrollNotification || Platform.isIOS) {
              return notification.depth == 2;
            }
            return notification.depth == 0;
          },
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
                      flexibleSpace: DocumentsStatusTab(
                        tabController: controller.tabController,
                      ),
                    ),
                  ];
                },
                body: DocumentsTabBarView(
                  items: id != null
                      ? controller.islandsStore.docs
                          .where((element) => element.island.id == id)
                          .toList()
                      : controller.islandsStore.docs,
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
