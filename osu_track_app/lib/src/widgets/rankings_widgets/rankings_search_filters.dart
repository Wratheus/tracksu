import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../models/country.dart';
import '../../pages/cubit/rankings_cubit.dart';
import '../../utils/color_contrasts.dart' as my_colors;

// ignore: must_be_immutable
class RankingsSearchFiltersWidget extends StatefulWidget {
  String? _mode = "osu";
  String _filterValue;
  Object? _dropdownValue;
  Country? _dropdownCountryValue;
  List<Country> _countryList;

  RankingsSearchFiltersWidget(String filterValue, String? mode, List<Country> countryList, Country? countryValue)
      :
        _filterValue = filterValue,
        _mode = mode,
        _countryList = countryList;

  @override
  State<RankingsSearchFiltersWidget> createState() => _RankingsSearchFiltersWidgetState();
}

class _RankingsSearchFiltersWidgetState extends State<RankingsSearchFiltersWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget._dropdownValue = widget._filterValue;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Country: ", style: TextStyle(
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
              DropdownButton(
                  dropdownColor: my_colors.Palette.brown,
                  // countryItem is Iter throw mapped countryList, gave this widget from cubit state
                  value: widget._dropdownCountryValue,
                  items: widget._countryList.map<DropdownMenuItem<Country>>((countryItem) =>
                      DropdownMenuItem(
                        value: countryItem,
                        child: Row(
                          children: [
                            Image.asset('assets/icon_country_flags/${countryItem.code}.png',scale: 4),
                            SizedBox(width: 10),
                            Text(countryItem.name, style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Exo 2',
                                shadows: [
                                  Shadow(
                                    color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                    offset: Offset(7, 5),
                                    blurRadius: 10,
                                  )
                                ],
                                color: Colors.white
                            )),
                          ],
                        )
                      )
                  ).toList(),
                  onChanged: (value) => setState(() {
                    widget._dropdownCountryValue = value as Country?;
                    print("selected : ${widget._dropdownCountryValue!.name}");
                    context.read<RankingsCubit>().loadRankings(widget._dropdownCountryValue, widget._filterValue, "1", widget._mode);
                  })
              ),
              SizedBox(width: 10,),
              Text("Friends: ", style: TextStyle(
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
              DropdownButton(
                dropdownColor: my_colors.Palette.brown,
                  value: widget._dropdownValue,
                  items: [
                    DropdownMenuItem(child: Text("All", style: TextStyle(
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
                        color: Colors.white)), value: "all",),
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
                    context.read<RankingsCubit>().loadRankings(widget._dropdownCountryValue, widget._filterValue, "1", widget._mode);
                  })),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    onSubmitted: (_) => context.read<RankingsCubit>().loadRankings(widget._dropdownCountryValue, widget._filterValue, _textController.text.trim(), widget._mode), // filter by page
                  )),
              SizedBox(width: 10,),
            ],
          )
        ],
      ),
    );

  }
}