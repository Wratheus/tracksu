import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/authorizationpage.dart';
import 'src/pages/last_news_page.dart';
import 'src/pages/home_page.dart';
import 'src/utils/color_contrasts.dart' as my_colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OsuTrackApp',
      theme: ThemeData(
        primarySwatch: my_colors.Palette.pink,
        backgroundColor: my_colors.Palette.brown,
      ),
      home: LoginScreen(),);
  }
}