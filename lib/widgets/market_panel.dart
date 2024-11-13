import 'package:flutter/material.dart';

import '../consts/colors.dart';

class MarketPanel extends StatelessWidget {
  const MarketPanel({
    super.key,
    required TabController tabController,
    required List<Tab> tabs,
    required List<Widget> tabBarViews,
  }) : _tabController = tabController, _tabs = tabs, _tabBarViews = tabBarViews;

  final TabController _tabController;
  final List<Tab> _tabs;
  final List<Widget> _tabBarViews;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: kToolbarHeight - 8.0,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: whiteColor),
              labelColor: charcoalColor,
              unselectedLabelColor: Colors.black,
              tabs: _tabs,
            ),
          ),
          SizedBox(
            height: 360,
            child: TabBarView(
              controller: _tabController,
              children: _tabBarViews,
            ),
          )
        ],
      ),
    );
  }
}
