import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../pages/cubit/rankings_cubit.dart';
import '../../utils/color_contrasts.dart' as my_colors;

// ignore: must_be_immutable
class RankingsSearchByPageWidget extends StatefulWidget {

  final String _filter;
  final String? _mode;
  String _filterValue;
  Object? _dropdownValue;

  RankingsSearchByPageWidget(String filter, String filterValue, String? mode)
      :
        _filter = filter,
        _filterValue = filterValue,
        _mode = mode;

  @override
  State<RankingsSearchByPageWidget> createState() => _RankingsSearchByPageWidgetState();
}

class _RankingsSearchByPageWidgetState extends State<RankingsSearchByPageWidget> {
  @override
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget._dropdownValue = widget._filterValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Filter: ", style: TextStyle(
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
        SizedBox(width: 10,),
        DropdownButton(
          dropdownColor: my_colors.Palette.brown,
            value: widget._dropdownValue,
            items: [
              DropdownMenuItem(child: Text("Default", style: TextStyle(
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
                  color: Colors.white)), value: "default",),
              DropdownMenuItem(child: Text("Friends", style: TextStyle(
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
                  color: Colors.white)), value: "friends",),
           ],
            onChanged: (value) => setState(() {
              widget._dropdownValue = value;
              widget._filterValue = "$value";
              context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterValue, "1", widget._mode);
            })),
       /* Switch.adaptive(value: widget._filterValue, onChanged:
            (value) {setState(() => widget._filterValue = value);
          context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterValue, "1", widget._mode);
        }, activeColor: my_colors.Palette.pink, inactiveThumbColor: my_colors.Palette.purple ), // friends filter*/
        SizedBox(width: 10,),
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
              onSubmitted: (_) => context.read<RankingsCubit>().loadRankings(widget._filter, widget._filterValue, _textController.text.trim(), widget._mode), // filter by page
            )),
        SizedBox(width: 10,),
      ],
    );

  }
}