import 'package:flutter/material.dart';
import '../../pages/user_tab_page.dart';
import '../../utils/color_contrasts.dart' as my_colors;

class UserSearchWidget extends StatelessWidget {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: width/23),
          alignment: Alignment.center,
          width: width/2.15,
          height: height/20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [my_colors.Palette.brown.withOpacity(1), my_colors.Palette.brown.shade200.withOpacity(1)]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(7, 5),
              spreadRadius: 24,
              blurRadius: 23,
            )
          ],
        ),
          child: TextField(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: my_colors.Palette.brown.withOpacity(1)),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: my_colors.Palette.brown.withOpacity(1)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: my_colors.Palette.brown.withOpacity(1)),
              ),
              labelText: "Username",
              labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Exo 2',
                  color: Colors.white),
              prefixIcon: Image.asset('assets/utils/search.png', scale: 4,),
              hintText: "Enter username",
              hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Exo 2',
                  color: Colors.white54),
            ),
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo 2',
                color: Colors.white),
            keyboardType: TextInputType.text,
            controller: textController,
            // onSubmitted: (_) => context.read<UserCubit>().loadUser(textController.text, 'osu'),
            onSubmitted: (_) => Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabPage(username: textController.text.trim()))),
          )
      )
    ]
    );
  }
}