import 'dart:ui';

import 'package:flutter/material.dart';
import '../../pages/home_page.dart';
import '../../utils/color_contrasts.dart' as my_colors;
import '../../utils/secure_storage.dart';
// ignore: must_be_immutable
class NavigationDrawer extends StatefulWidget {
  String? _userMeAvatar;
  String? _userMeUsername;
  NavigationDrawer({Key? key}) :
        super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool userMeFromStorageLoaded = false;

  void getUserFromSecureStorage() async {
    String? userMeAvatarInstance = await UserSecureStorage.getUserMeAvatarFromStorage();
    String? userMeUsernameInstance = await UserSecureStorage.getUserMeUsernameFromStorage();
    setState((){
      widget._userMeAvatar = userMeAvatarInstance;
      widget._userMeUsername = userMeUsernameInstance;
      userMeFromStorageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserFromSecureStorage();
    return userMeFromStorageLoaded == true ? Drawer(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    ) : Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: my_colors.Palette.brown.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
              offset: Offset(7, 5),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
        ),
        child: Center(child: CircularProgressIndicator()));
  }
    Widget buildHeader(BuildContext context) =>
        InkWell(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  HomePage(pageIndex: 1, username: widget._userMeUsername))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [my_colors.Palette.purple.withOpacity(0.15), my_colors.Palette.purple.shade200.withOpacity(0.15)]
                    )
                ),
                padding: EdgeInsets.only(
                    top: 16 + MediaQuery
                        .of(context)
                        .padding
                        .top,
                    bottom: 16+ MediaQuery
                        .of(context)
                        .padding
                        .bottom,
                ),
                child: Column(
                    children: [
                      CircleAvatar(
                        radius: 44,
                        backgroundImage: NetworkImage(widget._userMeAvatar!),
                      ),
                      SizedBox(height: 12,),
                      Text(widget._userMeUsername!,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: my_colors.Palette.hotPink.shade900
                                    .withOpacity(0.25),
                                offset: Offset(7, 5),
                                blurRadius: 10,
                              )
                            ]
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          );

    Widget buildMenuItems(BuildContext context) =>
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [my_colors.Palette.purple.withOpacity(0.15), my_colors.Palette.purple.shade200.withOpacity(0.15)]
                  )
              ),
              padding: EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 2,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white,),
                    title: Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(pageIndex: 1))),
                  ),
                  Divider(color: Colors.transparent),
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.white,),
                    title: Text(
                        "Favourites (later updates)",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(color: Colors.transparent),
                  ListTile(
                    leading: const Icon(Icons.chat, color: Colors.white,),
                    title: Text(
                        "Chat (later updates)",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.forum, color: Colors.white,),
                    title: Text(
                        "Forum (later updates)",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(color: Colors.transparent),
                  ListTile(
                    leading: const Icon(Icons.newspaper, color: Colors.white,),
                    title: Text(
                      "News",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(pageIndex: 0))),
                  ),
                  ListTile(
                    leading: const Icon(Icons.update, color: Colors.white,),
                    title: Text(
                        "Updates",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ]
                      ),
                    ),
                    onTap: () {},
                  ),

                ],
              ),
            ),
          ),
        );
  }

