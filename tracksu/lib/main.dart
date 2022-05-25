import 'package:flutter/material.dart';
import 'package:tracksu/src/pages/authorization_page.dart';
import 'package:tracksu/src/pages/windows_web_view.dart';
import 'src/utils/color_contrasts.dart' as my_colors;
import 'package:flutter/services.dart';
final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracksu',
      theme: ThemeData(
        primarySwatch:  my_colors.Palette.pink,
        backgroundColor: my_colors.Palette.brown,
      ),
      home: LoginScreen()
    );
  }
}