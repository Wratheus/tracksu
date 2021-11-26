import 'package:flutter/material.dart';
import 'package:osu_track_app/src/utils/color_contrasts.dart';
import 'package:provider/src/provider.dart';
import '../../pages/cubit/rankings_cubit.dart';

class RankingsSearchByPageWidget extends StatelessWidget {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Select page", style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Exo 2',
            color: Colors.white),),
        SizedBox(width: 10,),
        Container(
            width: 55,
            height: 30,
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                filled: true,
                fillColor: Palette.brown,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Exo 2',
                  color: Colors.white),
              keyboardType: TextInputType.text,
              controller: textController,
              onSubmitted: (_) => context.read<RankingsCubit>().loadRankings(textController.text),
            )),
        SizedBox(width: 10,),
      ],
    );

  }
}