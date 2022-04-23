import 'package:flutter/material.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/resources/app_text_styles.dart';

class PersonalTabs extends StatefulWidget {
  final List<Widget> tabMenu;
  final Function(int) onTabSelect;
  final TabController tabController;
  const PersonalTabs(
      {Key? key,
      required this.tabMenu,
      required this.onTabSelect,
      required this.tabController})
      : super(key: key);

  @override
  _PersonalTabsState createState() => _PersonalTabsState();
}

class _PersonalTabsState extends State<PersonalTabs>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.ligthGrey.withOpacity(0.5),
              ),
            ),
          ),
        ),
        TabBar(
          onTap: widget.onTabSelect,
          tabs: widget.tabMenu,
          isScrollable: true,
          controller: widget.tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 20),
          unselectedLabelStyle:
              getRegularStyle(color: AppColors.black, fontSize: 18),
          labelStyle: getBoldStyle(color: AppColors.black, fontSize: 18),
          labelColor: AppColors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          indicatorColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
