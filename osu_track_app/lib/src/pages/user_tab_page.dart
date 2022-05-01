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
            leading: Image.asset('assets/utils/cloud_logo.png')
        ),
          backgroundColor: my_colors.Palette.brown.shade100,
        body: TabBarView(
          children: [
            UserPage(username: username, mode: 'osu'),
            UserPage(username: username, mode: 'taiko'),
            UserPage(username: username, mode: 'fruits'),
            UserPage(username: username, mode: 'mania')
          ],
        ),
          ),
      );
  }
}
