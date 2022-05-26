import 'package:flutter/material.dart';
import 'package:tracksu/src/pages/rankings_tab_page.dart';
import 'package:tracksu/src/pages/user_tab_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // add animated navigation bar

import '../utils/color_contrasts.dart' as my_colors;
import '../pages/last_news_page.dart';

// Home page is navigation bar(User page selected by default
// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int? _pageIndex;
  String? _username;
  HomePage({Key? key, int? pageIndex, String? username}) :
        _pageIndex = pageIndex,
        _username = username,
        super(key: key);
  @override
  State<HomePage> createState() => _HomePageState(_pageIndex, _username);
}

class _HomePageState extends State<HomePage> {
  int? _pageIndex;
  String? _username;
  _HomePageState(pageIndex, username) :
      _pageIndex = pageIndex,
      _username = username;
  GlobalKey bottomNavigationKey = GlobalKey();
  List<Widget> pageList = <Widget>[
    LastNewsPage(),
    UserTabPage(),
    RankingsTabPage(),
  ];
  @override
  Widget build(BuildContext context) {
    if (_pageIndex == null) _pageIndex = 1; // default pafe is User page
    if (_username != null) pageList[1] = UserTabPage(username: _username); // if username provided -> open that userpage
      return Scaffold(
        backgroundColor: my_colors.Palette.purple,
        body: pageList.elementAt(_pageIndex!),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [my_colors.Palette.brown, my_colors.Palette.purple])),
            child: CurvedNavigationBar(
              height: 50,
              key: bottomNavigationKey,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.brown.shade600,
              color: Colors.transparent,
              animationDuration: Duration(milliseconds: 450),
              animationCurve: Curves.linear,
              onTap: (value){
                 setState(() {
                   _pageIndex = value;});},
              index: _pageIndex!,
              items: [
                Image.asset("assets/icon_utils/news.png", scale: 15, color: Colors.white),
                Image.asset("assets/icon_utils/user.png", scale: 15, color: Colors.white),
                Image.asset("assets/icon_utils/ranking.png", scale: 15, color: Colors.white),
              ]
        ),
          )
      );
    }
  }
