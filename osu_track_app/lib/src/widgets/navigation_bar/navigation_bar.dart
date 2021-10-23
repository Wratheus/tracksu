import 'package:flutter/material.dart';
import 'tab_model.dart';
import '../../utils/color_contrasts.dart' as my_colors;
import '../../utils/icon_pack.dart' as my_icons;

const Map<TabItem, TabModel> tabs = {
  TabItem.News: TabModel(name: "News", icon: my_icons.MyFlutterApp.rss_square),
  TabItem.OsuTrack: TabModel(name: "User", icon: my_icons.MyFlutterApp.user_circle),
  TabItem.LeaderBoard: TabModel(name: "Rankings", icon: my_icons.MyFlutterApp.dice_d6)
};

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: my_colors.Palette.pink,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentTab.index,
        iconSize: 30,
        items: [
          _buildItem(TabItem.News),
          _buildItem(TabItem.OsuTrack),
          _buildItem(TabItem.LeaderBoard),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconTabMatching(item),
      ),
      label: tabs[item]!.name,
    );
  }

  IconData _iconTabMatching(TabItem item) => tabs[item]!.icon;
}
