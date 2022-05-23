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

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
            offset: Offset(7, 5),
            spreadRadius: 5,
            blurRadius: 10,
          )
        ],
      ),
        width: 225,
        height: 35,
        child: TextField(
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: "Username",
            labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo 2',
                color: Colors.white),
            prefixIcon: Image.asset('assets/utils/search.png', scale: 4,),
            hintText: "Enter username",
            hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo 2',
                color: Colors.white54),
          ),
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Exo 2',
              color: Colors.white),
          keyboardType: TextInputType.text,
          controller: textController,
          // onSubmitted: (_) => context.read<UserCubit>().loadUser(textController.text, 'osu'),
          onSubmitted: (_) => Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabPage(username: textController.text.trim()))),
        ));

  }
}