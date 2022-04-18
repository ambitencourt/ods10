import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

import 'document_item_widget.dart';

class DocumentsTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<DocumentEntity> items;
  const DocumentsTabBarView({
    Key? key,
    required this.tabController,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TabBarView(
          controller: tabController,
          children: <Widget>[
            ListView(
              children: [
                ...items.map((e) => DocumentItemWidget(item: e)),
              ],
            ),
            ListView(
              children: [
                ...items.map((e) {
                  return e.status == 'missing'
                      ? DocumentItemWidget(item: e)
                      : Container();
                }),
              ],
            ),
            ListView(
              children: [
                ...items.map((e) {
                  return e.status == 'requested'
                      ? DocumentItemWidget(item: e)
                      : Container();
                }),
              ],
            ),
            ListView(
              children: [
                ...items.map((e) {
                  return e.status == 'ready'
                      ? DocumentItemWidget(item: e)
                      : Container();
                }),
              ],
            ),
            ListView(
              children: [
                ...items.map((e) {
                  return e.price == 0
                      ? DocumentItemWidget(item: e)
                      : Container();
                }),
              ],
            ),
            ListView(
              children: [
                ...items.map((e) {
                  return e.price > 0
                      ? DocumentItemWidget(item: e)
                      : Container();
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
