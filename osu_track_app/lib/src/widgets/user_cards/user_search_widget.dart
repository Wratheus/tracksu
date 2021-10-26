import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../pages/cubit/user_cubit.dart';

class UserSearchWidget extends StatelessWidget {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: "Username",
            labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo 2',
                color: Colors.white),
            prefixIcon: Icon(Icons.search, size: 35, color: Colors.white),
            hintText: "Enter username",
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Exo 2',
                color: Colors.white54),
          ),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Exo 2',
              color: Colors.white),
          keyboardType: TextInputType.text,
          controller: textController,
          onSubmitted: (_) => context.read<UserCubit>().loadUser(textController.text),
        ));

  }
}