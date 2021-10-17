
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:osu_track_app/src/pages/home_page.dart';

import '../utils/color_contrasts.dart' as my_colors;

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:my_colors.Palette.brown,
      body: Center(
        child: Column(
        children: [
          Image.asset('assets/error.jpg', height: 400,),
          const Text("Oops!", style: TextStyle(color: Colors.white,
              fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Exo 2', )),
          const Text("Something went wrong!", style: TextStyle(color: Colors.white,
            fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Exo 2', )),
          const Spacer(flex: 3),
          ElevatedButton(onPressed: () => toMainScreen(context), child: const Text("To home page", style: TextStyle(color: Colors.white,
            fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'Exo 2', ))),
          const Spacer(flex: 2),

        ]
      ),
      )
    );
  }
}

Future<void> toMainScreen(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));
}