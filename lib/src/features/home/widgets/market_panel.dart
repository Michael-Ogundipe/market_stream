import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

class MarketPanel extends StatelessWidget {
  const MarketPanel({
    super.key,
    required TabController tabController,
    required List<Tab> tabs,
    required List<Widget> tabBarViews,
    required double height,
  })  : _tabController = tabController,
        _tabs = tabs,
        _tabBarViews = tabBarViews,
        _height = height;

  final TabController _tabController;
  final List<Tab> _tabs;
  final List<Widget> _tabBarViews;
  final double _height;

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
                  borderRadius: BorderRadius.circular(8.0), color: whiteColor),
              labelColor: charcoalColor,
              unselectedLabelColor: Colors.black,
              tabs: _tabs,
            ),
          ),
          SizedBox(
            height: _height,
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
