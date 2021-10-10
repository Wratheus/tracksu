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


  // void _incrementCounter() async {
  //   final token = await getToken();
  //   print(token['access_token']);
  //   final player = await getUser(token['access_token'], 'Repentance');
  //   print(player.id);
  //   List<dynamic> userScore = await getUserScore(token['access_token'], 'Sgooll', '100');
  //   print(userScore);
  //   news.News firstNew = await getNews(token['access_token']);
  //   print(firstNew.id);
  //   beatmap.Beatmap beatmapReq = await getBeatmap(token['access_token'], '2530810');
  //   print(beatmapReq);
  //   List<dynamic> beatmapScores = await getBeatmapScores(token['access_token'], '2530810');
  //   print(beatmapScores);
  //   int count = 0;
  //   List<String> mods = ['HD', 'DT'];
  //   List<dynamic> beatmapScoresWithMods = await getBeatmapScores(token['access_token'], '738063');
  //   print(beatmapScoresWithMods);
  // }


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
          title: const Text('osu News'),
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