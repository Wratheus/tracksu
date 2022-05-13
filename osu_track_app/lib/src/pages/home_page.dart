import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/rankings_tab_page.dart';
import 'package:osu_track_app/src/pages/user_tab_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // add animated navigation bar

import '../utils/color_contrasts.dart' as my_colors;
import '../utils/icon_pack.dart' as my_icons;
import '../pages/last_news_page.dart';

// Home page is navigation bar(News tab selected by default
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int pageIndex = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  List<Widget> pageList = <Widget>[
    LastNewsPage(),
    UserTabPage(),
    RankingsTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: my_colors.Palette.brown.shade100,
        body: pageList.elementAt(pageIndex),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            key: bottomNavigationKey,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: my_colors.Palette.hotPink,
            color: my_colors.Palette.purple,
            animationDuration: Duration(milliseconds: 450),
            animationCurve: Curves.linear,
            onTap: (value){
               setState(() {
                 pageIndex = value;});},
            index: pageIndex,
            items: [
              Icon((my_icons.MyFlutterApp.rss), semanticLabel: "News", color: Colors.white, size: 25,),
              Icon((my_icons.MyFlutterApp.user), semanticLabel: "Users", color: Colors.white, size: 25,),
              Icon((my_icons.MyFlutterApp.star), semanticLabel: "Leaderboard", color: Colors.white, size: 25,)          ]
        )
      );
    }
  }
