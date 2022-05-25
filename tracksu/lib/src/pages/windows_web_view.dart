import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_windows/webview_windows.dart';

import '../../main.dart';
import '../requests/requests.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../utils/secure_storage.dart';
import 'home_page.dart';

class LoginScreenWindowsWebView extends StatefulWidget {
  @override
  State<LoginScreenWindowsWebView> createState() => _LoginScreenWindowsWebView();
}

class _LoginScreenWindowsWebView extends State<LoginScreenWindowsWebView> {
  final _controller = WebviewController();
  final _textController = TextEditingController();
  final loginUrl = "https://osu.ppy.sh/oauth/authorize?client_id=9725&redirect_uri=https://wratheus.github.io/tracksu&response_type=code&scope=public";
  String? code;
  bool _isWebviewSuspended = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  void requestToken([String? code]) async {
    await getTokenAsAuthorize(code);
  }
  void loginWithClientCredential() async {
    await UserSecureStorage.setTokenInStorage('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NzI1IiwianRpIjoiMTAzMjcwYmM2ZjBkOGU0ZjExODg0YmYzYmQzMGQ5ZmVjNTQ4NDcwZDlkY2MyMGQ1YmE4YjE4NmJiZDIwNjc4ZmY5YWMzMGVkNzdhMGZhMDkiLCJpYXQiOjE2NTM0OTIyMTguMjMwODM5LCJuYmYiOjE2NTM0OTIyMTguMjMwODQsImV4cCI6MTY1MzU3ODU4MC4xNTM4MjIsInN1YiI6IiIsInNjb3BlcyI6WyJwdWJsaWMiXX0.J7kOShEtgMOWYFXg-Vi887Khu8f0-Kq9ry3NSrNaBMNnPt1h-hQWw4qfV1awOeV1-o-UlF6l7nRiqzLlgtJoJInJozq9LAP3xKg1E9TwAw3Nga38NNA4oHdKHGDMlQnKDwuRta-VWl36H8-EQmb2s1PzuUJcgeFo7ne0wYdv1uTolik8yCfr7zHDeQbjgEjx-sE_EVHPmNPbISA95SRY3Lfko5ufZ_RmY-TM_BOPxgF881ONtyeDnRxOIDz1PNL0dZAhqrUoFeq0oCBHSFDDk5F9ajDH6eoRkn4-2kPV_hAS2fxu9sf0BZCzmp7ZqSHc5uw-YUGBVIQ79MEjpLSV7eME7eRSxN3MKtBfZUwbGtQEB7453jGtCpsXGwrraA7fO3xUA6JJgGdDdm797LnoaEvKZahDndbu8Ovb-Uci1H5O995UHbqEFcnvbvksxOeQbNnPkagf13ufKtjeGqecQG3In6Wj8voJlHhAdJCA-0zVWBCuL3aqnXPddhhxeBYwf2-mihijU2xb6-D2oWgW5c0AqOLfITiTcooq_2JszBoj7gBNO3SJTavY2pdGEbdaqAcqbjGJIFeC3glSy1jCkyfDqXkBPxjhoR2Rqk2KmzTKRrH3d2qKdyCUODBv83KRggsq0En1WwvmbFUNqrwutYoTl9a7oIG-EHO_ZKJj1gE');

  }
  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory
    // and/or a custom browser executable directory
    // and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    try {
      await _controller.initialize();
      _controller.url.listen((url) {
        _textController.text = url;
      });

      await _controller.setBackgroundColor(Colors.transparent);
      await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      await _controller.loadUrl(loginUrl);

      if (!mounted) return;
      if (mounted) {
        setState(() {
          loginWithClientCredential();
          Navigator.pop(context, LoginScreenWindowsWebView());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage()));
/*          // error redirect if, restart login url
          if (_textController.text.startsWith(
              'https://wratheus.github.io/tracksu')) {
            RegExp regExpError = RegExp("error=(.*)");
            if (regExpError.hasMatch(_textController.text) == true) {
              setState(() {
                Navigator.pop(context, LoginScreenWindowsWebView());
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreenWindowsWebView()));
              });
            }
          }
          // success login redirect
          if (_textController.text.startsWith(
              'https://wratheus.github.io/tracksu/?code=')) {
            RegExp regExp = RegExp("code=(.*)");
            code = regExp.firstMatch(_textController.text)?.group(1);
            if (code != null) {
              print("requesting new token");
              requestToken();
              setState(() {
                Navigator.pop(context, LoginScreenWindowsWebView());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            };
          }*/
        });
      }
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Error'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Code: ${e.code}'),
                  Text('Message: ${e.message}'),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Continue'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
      });
    }
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Row(children: [

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'URL',
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    controller: _textController,
                    onSubmitted: (val) {
                      _controller.loadUrl(val);
                    },
                  ),
                ),
/*                IconButton(
                  icon: Icon(Icons.refresh),
                  splashRadius: 20,
                  onPressed: () {
                    _controller.reload();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.developer_mode),
                  tooltip: 'Open DevTools',
                  splashRadius: 20,
                  onPressed: () {
                    _controller.openDevTools();
                  },
                )*/
              ]),
            ),
            Expanded(
                child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Webview(
                          _controller,
                          permissionRequested: _onPermissionRequested,
                        ),
                        StreamBuilder<LoadingState>(
                            stream: _controller.loadingState,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data == LoadingState.loading) {
                                return LinearProgressIndicator();
                              } else {
                                return SizedBox();
                              }
                            }),
                      ],
                    ))),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      floatingActionButton: FloatingActionButton(
        tooltip: _isWebviewSuspended ? 'Resume webview' : 'Suspend webview',
        onPressed: () async {
          if (_isWebviewSuspended) {
            await _controller.resume();
          } else {
            await _controller.suspend();
          }
          setState(() {
            _isWebviewSuspended = !_isWebviewSuspended;
          });
        },
        child: Icon(_isWebviewSuspended ? Icons.play_arrow : Icons.pause),
      ),*/
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
      body: Center(
        child: compositeView(),
      ),
    );
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }
}
