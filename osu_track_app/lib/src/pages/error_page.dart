import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/home_page.dart';

import '../utils/color_contrasts.dart' as my_colors;

// ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  final Widget _exceptionPageName;
  String _errorMessage;
  ErrorPage({Key? key, required Widget exceptionPageName, required String errorMessage}):
        _exceptionPageName = exceptionPageName,
        _errorMessage = errorMessage,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if ("${_errorMessage}".contains("NoSuchMethodError: The method '[]' was called on null")) {_errorMessage = "No such data was found";};
    if ("${_errorMessage}".contains("Failed User Load Exception: Failed to get USER")) {_errorMessage = "Wrong username or requested user is restricted/unfound";};
    return Scaffold(
      appBar: AppBar(backgroundColor: my_colors.Palette.pink,
        title: Text("Exception in ${_exceptionPageName}!"), leading: Image.asset('assets/utils/cloud_logo.png')),
      backgroundColor:my_colors.Palette.brown,
      body: Column(
      children: [
        Container(
          child: Image.asset('assets/utils/error.jpg')),
          SizedBox(height: 50),
          Expanded(child: Text("Oops! \n ${_errorMessage}",
              textAlign: TextAlign.center ,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',)),),
          ElevatedButton(onPressed: () => toMainScreen(context),
              child: const Text("Return",
                                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',))),
      ]
      )
    );
  }
}

Future<void> toMainScreen(context) async {
  Navigator.pop(context, ErrorPage(exceptionPageName: Container(), errorMessage: " "));
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));
}