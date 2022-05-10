import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/user_page.dart';

import '../utils/color_contrasts.dart' as my_colors;

class UserTabPage extends StatelessWidget {
  final username;
  const UserTabPage({Key? key, this.username})
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
            UserPage(username: username, mode: 'osu'),
            UserPage(username: username, mode: 'taiko'),
            UserPage(username: username, mode: 'fruits'),
            UserPage(username: username, mode: 'mania')
          ],
        ),
      )
    );
  }
}