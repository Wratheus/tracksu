import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/navigation_bar/navigation_bar.dart' as navigationBar;
import '../widgets/navigation_bar/tab_controller.dart' as controller;
import '../widgets/navigation_bar/tab_model.dart';
import '../utils/color_contrasts.dart' as myColors;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final _navigatorKeys = {
    TabItem.News: GlobalKey<NavigatorState>(),
    TabItem.OsuTrack: GlobalKey<NavigatorState>(),
    TabItem.LeaderBoard: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.News;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: controller.TabController(
        controllerKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.News) { _selectTab(TabItem.OsuTrack); }
        else if (_currentTab == TabItem.OsuTrack) { _selectTab(TabItem.News); }
        else { _selectTab(TabItem.LeaderBoard); }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myColors.Palette.pink,
          title: const Text("Osu News!"),
        ),
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.News),
          _buildOffstageNavigator(TabItem.OsuTrack),
          _buildOffstageNavigator(TabItem.LeaderBoard),
        ]),
            bottomNavigationBar: navigationBar.NavigationBar(
              currentTab: _currentTab,
              onSelectTab: _selectTab,
        ),
      ),
    );
  }
}