import 'package:flutter/material.dart';
import 'tab_model.dart';
import '../../pages/last_news_page.dart';
import '../../pages/authorizationpage.dart';

class TabController extends StatelessWidget {
  TabController({required this.controllerKey, required this.tabItem});
  final GlobalKey<NavigatorState> controllerKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controllerKey,
      onGenerateRoute: (routeSettings) {
        Widget selectedPage;
        if (tabItem == TabItem.News) { selectedPage = const LastNewsPage();}
        else if (tabItem == TabItem.OsuTrack) { selectedPage = LoginScreen();}
        else  { selectedPage = const LastNewsPage();}

        return MaterialPageRoute(
          builder: (context) => selectedPage,
        );
      },
    );
  }
}