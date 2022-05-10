import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../pages/cubit/rankings_cubit.dart';
import '../../utils/color_contrasts.dart' as my_colors;

// ignore: must_be_immutable
class RankingsSearchByPageWidget extends StatefulWidget {

  final String _filter;
  final String? _mode;
  bool _filterFriendsValue;

  RankingsSearchByPageWidget(String filter, bool filterFriendsValue, String? mode)
      :
        _filter = filter,
        _filterFriendsValue = filterFriendsValue,
        _mode = mode;

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
        Text("friends LB", style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Exo 2',
            shadows: [
              Shadow(
                color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                offset: Offset(7, 5),
                blurRadius: 10,
              )
            ],
            color: Colors.white),),
        Switch.adaptive(value: widget._filterFriendsValue, onChanged:
            (value) {setState(() => widget._filterFriendsValue = value);
          context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterFriendsValue, "1", widget._mode);
        }, activeColor: my_colors.Palette.pink, inactiveThumbColor: my_colors.Palette.purple ), // friends filter
        Text("Select page", style:  TextStyle(
            fontSize: 14,
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
        SizedBox(width: 10,),
        Container(
            width: 50,
            height: 30,
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
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: my_colors.Palette.brown.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              style: TextStyle(
                  fontSize: 14,
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
              keyboardType: TextInputType.text,
              controller: _textController,
              onSubmitted: (_) => context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterFriendsValue, _textController.text, widget._mode), // filter by page
            )),
        SizedBox(width: 10,),
      ],
    );

  }
}