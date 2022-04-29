import 'package:flutter/material.dart';
import '../pages/rankings_page.dart';

import '../utils/color_contrasts.dart' as my_colors;

class RankingsTabPage extends StatelessWidget {
  const RankingsTabPage({Key? key})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontFamily: 'Exo 2',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                    offset: Offset(7, 5),
                    blurRadius: 10,
                  )
                ],
              ),
              indicatorColor: my_colors.Palette.hotPink.shade100,
              tabs: [Tab(text: "osu!",), Tab(text: "taiko"), Tab(text: "catch",), Tab(text: "mania", )],
            ),
            backgroundColor: my_colors.Palette.purple,
            title: Text("Leaderboard",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontFamily: 'Exo 2',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                    offset: Offset(7, 5),
                    blurRadius: 10,
                  )
                ],
              ),),
            leading: Image.asset('assets/utils/cloud_logo.png')
        ),
        backgroundColor: my_colors.Palette.brown.shade100,
        body: TabBarView(
          children: [
            RankingsPage(mode: 'osu'),
            RankingsPage(mode: 'taiko'),
            RankingsPage(mode: 'fruits'),
            RankingsPage(mode: 'mania')
          ],
        ),
      ),
    );
  }
}
