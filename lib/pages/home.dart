import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts/assets.dart';
import '../consts/colors.dart';
import '../widgets/asset_overview.dart';
import '../widgets/custom_button.dart';
import '../widgets/empty_state.dart';
import '../widgets/market_panel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final TabController _tabController2;

  final List<Tab> _tabs = const [
    Tab(text: 'Charts'),
    Tab(text: 'Orderbook'),
    Tab(text: 'Recent trades'),
  ];

  final List<Tab> _tabs2 = const [
    Tab(text: 'Open Order'),
    Tab(text: 'Position'),
    Tab(text: 'Position'),
  ];

  final List<Widget> _tabBarViews = const [
    Center(child: Text('Charts')),
    Center(child: Text('Orderbook')),
    Center(child: Text('Recent Trade')),
  ];

  final List<Widget> _tabBarViews2 = const [
    EmptyState(),
    EmptyState(),
    EmptyState(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: borderColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: false,
        title: Image.asset(Assets.logo, width: 121, height: 34),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(Assets.avatar),
            radius: 16,
          ),
          SizedBox(width: 16),
          Icon(FontAwesomeIcons.globe),
          SizedBox(width: 16),
          Icon(FontAwesomeIcons.bars),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const AssetOverview(),
            const SizedBox(height: 8),
            MarketPanel(
              tabController: _tabController,
              tabs: _tabs,
              tabBarViews: _tabBarViews,
            ),
            const SizedBox(height: 8),
            MarketPanel(
              tabController: _tabController2,
              tabs: _tabs2,
              tabBarViews: _tabBarViews2,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: whiteColor,
        padding: EdgeInsets.only(bottom: MediaQuery
            .paddingOf(context)
            .bottom),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(title: 'Buy',backgroundColor: greenColor),
            SizedBox(width: 8),
            CustomButton(title: 'Sell',backgroundColor: redColor),
          ],
        ),
      ),
    );
  }
}

