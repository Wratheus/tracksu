import 'package:flutter/material.dart';
import 'package:osu_track_app/src/utils/color_contrasts.dart';
import 'package:provider/src/provider.dart';

import '../../pages/cubit/rankings_cubit.dart';
import '../../utils/color_contrasts.dart' as my_colors;

class RankingsSearchByPageWidget extends StatefulWidget {

  final String _filter;
  bool _filterFriendsValue;

  RankingsSearchByPageWidget(String filter, bool filterFriendsValue)
      :
        _filter = filter,
        _filterFriendsValue = filterFriendsValue;

  @override
  State<RankingsSearchByPageWidget> createState() => _RankingsSearchByPageWidgetState();
}

class _RankingsSearchByPageWidgetState extends State<RankingsSearchByPageWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("friends LB", style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Exo 2',
            color: Colors.white),),
        Switch.adaptive(value: widget._filterFriendsValue, onChanged:
            (value) {setState(() => widget._filterFriendsValue = value);
          context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterFriendsValue, "1");
        }, activeColor: my_colors.Palette.pink, inactiveThumbColor: my_colors.Palette.purple ), // friends filter
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
              controller: _textController,
              onSubmitted: (_) => context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterFriendsValue, _textController.text), // filter by page
            )),
        SizedBox(width: 10,),
      ],
    );

  }
}