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
        child: NestedScrollView(
          headerSliverBuilder: (context, value){
            return [
              SliverAppBar(
                floating: true,
                pinned: false,
                leading: Image.asset('assets/utils/cloud_logo.png'),
                title: Text("User page",
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
                  ),
                ),
                backgroundColor: my_colors.Palette.purple,
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
              )
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              RankingsPage(mode: 'osu'),
              RankingsPage(mode: 'taiko'),
              RankingsPage(mode: 'fruits'),
              RankingsPage(mode: 'mania')
            ],
          ),
        )
    );
  }
}
