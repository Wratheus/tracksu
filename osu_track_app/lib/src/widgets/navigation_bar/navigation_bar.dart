import 'package:flutter/material.dart';
import 'tab_model.dart';
import '../../utils/color_contrasts.dart' as myColors;

const Map<TabItem, TabModel> tabs = {
  TabItem.News: TabModel(name: "News", icon: Icons.assignment_rounded),
  TabItem.OsuTrack: TabModel(name: "Osu!", icon: Icons.circle),
  TabItem.LeaderBoard: TabModel(name: "LB", icon: Icons.article_rounded)
};

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: myColors.Palette.pink,
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
