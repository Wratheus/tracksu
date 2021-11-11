import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:osu_track_app/src/pages/home_page.dart';

import '../utils/color_contrasts.dart' as my_colors;

class ErrorPage extends StatelessWidget {
  final Widget _exceptionPageName;
  final String _errorMessage;
  const ErrorPage({Key? key, required Widget exceptionPageName, required String errorMessage}):
        _exceptionPageName = exceptionPageName,
        _errorMessage = errorMessage,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: my_colors.Palette.pink,
        title: Text("Exception in ${_exceptionPageName}!"), leading: Image.asset('assets/utils/cloud_logo.png')),
      backgroundColor:my_colors.Palette.brown,
      body: Center(
        child: Column(
        children: [
          Container(
            child: Image.asset('assets/utils/error.jpg')),
            SizedBox(height: 100),
            Expanded(child: Text("Oops! \n Something went wrong with \n ${_exceptionPageName} \n ${_errorMessage}",
                textAlign: TextAlign.center ,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',)),),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () => toMainScreen(context),
                child: const Text("Return",
                                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',))),
        ]
      ),
      )
    );
  }
}

Future<void> toMainScreen(context) async {
  Navigator.pop(context, ErrorPage(exceptionPageName: Container(), errorMessage: " "));
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));
}