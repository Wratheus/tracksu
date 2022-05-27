import 'package:flutter/material.dart';
import 'home_page_desktop.dart';

import '../models/user.dart';
import '../requests/requests.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../utils/secure_storage.dart';

// only login as guest supported now
class LoginScreenWindowsWebView extends StatefulWidget {
  @override
  State<LoginScreenWindowsWebView> createState() => _LoginScreenWindowsWebView();
}

class _LoginScreenWindowsWebView extends State<LoginScreenWindowsWebView> {
  bool userPeppyLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  void initLogin() async {
    await getTokenAsGuestWithClientCredential();
    final User userMeInstance = await getUser(
        (await UserSecureStorage.getTokenFromStorage())!, "Peppy");
    await UserSecureStorage.setUserMeAvatarFromStorage(userMeInstance.avatarURL);
    await UserSecureStorage.setUserMeUsernameFromStorage(userMeInstance.username);
    setState((){
      userPeppyLoaded = true;
    });
    print("$userPeppyLoaded");
    if (await userPeppyLoaded == true) navigateToHomePage();
  }

  void navigateToHomePage() {
    Navigator.pop(context, LoginScreenWindowsWebView());
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePageDesktop()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login to osu!..", style: TextStyle(
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
                colors: [
                  my_colors.Palette.brown,
                  my_colors.Palette.brown.shade200
                ])),
        child: Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(6.0),
                    backgroundColor: MaterialStateProperty.all(my_colors.Palette.purple)
                ),
                onPressed: initLogin,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo 2',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                        offset: Offset(7, 5),
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
