import 'package:flutter/material.dart';
import 'src/pages/last_news_page.dart';
import 'src/pages/home_page.dart';

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
        primarySwatch: Colors.pink,
        backgroundColor: const Color.fromRGBO(48,36,36, 0.96),
      ),
      home: const HomePage(),);
  }
}