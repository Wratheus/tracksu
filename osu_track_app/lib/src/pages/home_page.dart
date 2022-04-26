import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/user_tab_page.dart';

import '../utils/color_contrasts.dart' as my_colors;
import '../utils/icon_pack.dart' as my_icons;
import '../pages/last_news_page.dart';
import '../pages/rankings_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    LastNewsPage(),
    UserTabPage(),
    RankingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: my_colors.Palette.brown.shade100,
        body: pageList[pageIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: my_colors.Palette.yellow,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor: my_colors.Palette.purple,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value){
                 setState(() {
                   pageIndex = value;
              });

            },
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(my_icons.MyFlutterApp.rss), label: "News"),
              BottomNavigationBarItem(icon: Icon(my_icons.MyFlutterApp.user), label: "Users"),
              BottomNavigationBarItem(icon: Icon(my_icons.MyFlutterApp.star), label: "Leaderboard")
          ]
        )
      );
    }
  }
