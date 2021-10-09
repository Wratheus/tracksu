import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../requests/requests.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  late StreamSubscription onDestroy;
  late StreamSubscription<String> _onUrlChanged;
  late StreamSubscription<WebViewStateChanged> _onStateChanged;

  late var token;

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    // Add a listener to on destroy WebView, so you can make came actions.
    onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      print("destroy");
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
          print("onStateChanged: ${state.type} ${state.url}");
        });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      if (mounted) {
        print("URL changed: $url");
        if (url.startsWith('https://github.com/Wratheus/OsuTrack')) {
          RegExp regExp = RegExp("code=(.*)");
          this.token = regExp.firstMatch(url)?.group(1);
          print(token);
          var myToken = await getToken(token);
          print(myToken['access_token']);
        };
        setState(() {
            //Navigator.of(context).pushNamedAndRemoveUntil(
            //    "/home", (Route<dynamic> route) => false);
            //flutterWebviewPlugin.close();

        });
      }
    });
  }

  Future<void> authorizeUser() async{

  }

  @override
  Widget build(BuildContext context) {
    String loginUrl = "https://osu.ppy.sh/oauth/authorize?client_id=9725&redirect_uri=https://github.com/Wratheus/OsuTrack&response_type=code";

    return new WebviewScaffold(
        url: loginUrl,
        appBar: new AppBar(
          title: new Text("Login to osu OAuth..."),
        ));
  }
}