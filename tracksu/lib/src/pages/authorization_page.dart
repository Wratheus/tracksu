import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tracksu/src/requests/requests.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../pages/home_page.dart';
import '../utils/color_contrasts.dart' as my_colors;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginUrl = "https://osu.ppy.sh/oauth/authorize?client_id=9725&redirect_uri=https://wratheus.github.io/tracksu&response_type=code&scope=public";
  late WebViewController _webViewController;
  String? code = '0';

  @override
  initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  Future<void> currentUrlCheck() async {
    String currentUrl = (await(_webViewController.currentUrl()))!;
    print(currentUrl);
    if (currentUrl != loginUrl) {
      if (mounted) {
        // error redirect if, restart login url
        if (currentUrl.startsWith('https://wratheus.github.io/tracksu')) {
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
        if (currentUrl.startsWith('https://wratheus.github.io/tracksu/?code=')) {
          RegExp regExp = RegExp("code=(.*)");
          this.code = regExp.firstMatch(currentUrl)?.group(1);
          if (this.code != null) {
            print("requesting new token");
            await getTokenAsAuthorize(this.code);
            setState(() {
              Navigator.pop(context, LoginScreen());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            });
          };
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: my_colors.Palette.brown.shade200,
        appBar: AppBar(
          title: Text("Login to osu!...", style: TextStyle(
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
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [my_colors.Palette.brown, my_colors.Palette.purple])),
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: loginUrl,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onPageFinished: (_) {
              currentUrlCheck();
            },
            backgroundColor: my_colors.Palette.brown.shade200,
          ),
        )
    );
  }
}
