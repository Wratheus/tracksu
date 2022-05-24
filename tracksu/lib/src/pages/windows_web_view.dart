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
    await UserSecureStorage.setTokenInStorage('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NzI1IiwianRpIjoiMzU1NGM1Y2M2YTUzMTFmYTU1Zjc5M2U0ZDliY2RhZDZlOTY4ODFkMTQ4YTllOTFlMTc3ZjU0NGVmYTM3MzM4ZTNhOWQ4YTVmMTQ1MThmMGQiLCJpYXQiOjE2NTMzMTk5NjIuMjc3MzA5LCJuYmYiOjE2NTMzMTk5NjIuMjc3MzExLCJleHAiOjE2NTM0MDYzNTAuMjcwMjA3LCJzdWIiOiIiLCJzY29wZXMiOlsicHVibGljIl19.UmzB0I6VGIPvNqawbehwdEZSOcDGl36SpE6o7kvI0XytsjGsqrAV8VwXfiFFJPy0ijf6HxJmAwSK3Lb2KJlfA-JdJHPxG332qfH-zPObzIo4_W_UbkC4HJorGJ73xFEGo99k3BTtl9v1Tci4qBwlxReU7tqUAtlINJQNr5ExFC-xNki_kMJfbaQq3tIGvLx3vursp8_yottc14iCM0CYorq_Hv91-YMm2NRoKxwZBx9U08S-Ut7D9hLdpvGpKerH4M2KyW4sx8Pl-zWV0zaAzEZNDi_ntMNBCEfL38xFefi5OD7EhtA8NtnFDxDvbVtSbrLpbmInlOfhSHJMMAEZc0yI0V1BJweSVWRSOCj0Ki9wJ4r9hecwpjrWLriIlw1kz9_SsKgpKMNxzVb7xiX8AIv133PuLIzBy5IMvR_bgF2p8eKsqazeWxaP-e6kMJgslj-TsHIbgE_QgDcx9TOt7YnSp9W2v8OEwwGmPoP-ELGOEvdUc2cwLqS-CaZcNGWQlceM87DxN7JUuUoDZndQa5r7SjE8VlnkaIOmnNN_DAfkWAX_R-KaLIMDrGLNqnR8FhGJ0FONY8AYStJvxz2Tq4vDeRJT7YYDl7xBZ4OU23gCMxI6GmVZXhGZug4bmJOQziYAkccbVfpZ7OqTxBx-62-grzvFqJpY6XQnrfa0EKU');

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
