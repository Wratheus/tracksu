import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../pages/home_page.dart';
import '../requests/requests.dart';
import '../utils/color_contrasts.dart' as my_colors;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginUrl = "https://osu.ppy.sh/oauth/authorize?client_id=9725&redirect_uri=https://wratheus.github.io/osu-Track&response_type=code&scope=public";
  late WebViewController _webViewController;
  String? token = '0';

  @override
    initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  Future<void> currentUrlCheck()  async {
    print(_webViewController.currentUrl());
    String currentUrl = (await(_webViewController.currentUrl()))!;
    print(currentUrl);
    if (currentUrl != loginUrl){
      if (mounted) {
        // error redirect if, restart login url
        if (currentUrl.startsWith('https://wratheus.github.io/osu-Track')) {
          RegExp regExpError = RegExp("error=(.*)");
          if (regExpError.hasMatch(currentUrl) == true) {
            setState(() {
              Navigator.pop(context, LoginScreen());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            });
          }
        }
        // success login redirect
        if (currentUrl.startsWith('https://wratheus.github.io/osu-Track')) {
          RegExp regExp = RegExp("code=(.*)");
          this.token = regExp.firstMatch(currentUrl)?.group(1);
          await getToken(token);
          if (this.token != '0') {
            setState(() {
              Navigator.pop(context, LoginScreen());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
              });
            }
          }
        }
      }
    }
  @override
  Widget build(BuildContext context) {
    String loginUrl = "https://osu.ppy.sh/oauth/authorize?client_id=9725&redirect_uri=https://wratheus.github.io/osu-Track&response_type=code&scope=public";
   return Scaffold(
       backgroundColor: my_colors.Palette.brown.shade200,
      appBar: AppBar(
        title: Text("Login to osu!...",style: TextStyle(
          fontSize: 22.0,
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
        leading: Image.asset('assets/utils/cloud_logo.png'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: loginUrl,
        onWebViewCreated: (controller){_webViewController = controller;},
        onPageFinished: (_){currentUrlCheck();},
        backgroundColor: my_colors.Palette.brown.shade200,
      )
    );
  }
}
