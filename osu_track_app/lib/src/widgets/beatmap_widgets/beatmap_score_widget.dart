import 'package:flutter/material.dart';

import '../../utils/color_contrasts.dart' as my_colors;
import '../../models/beatmap_score.dart';
import'../../models/beatmap.dart';


class BeatmapScoreWidget extends StatelessWidget {

  final BeatmapScore _item;
  final int _index;
  final Beatmap _beatmapItem;
  const BeatmapScoreWidget({Key? key, required BeatmapScore item, required int index, required Beatmap beatmapItem})
      :
        _item = item,
        _index = index + 1,
        _beatmapItem = beatmapItem,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    String accuracy = "${_item.accuracy}";
    final List<Image> mods_icons = [];

    if("${_item.accuracy}".length > 5){
      accuracy = "${_item.accuracy * 100}".substring(0,5);
    }
    else if("${_item.accuracy}".length == 5){
      accuracy = "${_item.accuracy * 100}".substring(0,4);
    }
    else {
      accuracy = "${_item.accuracy * 100}";
    }

    if (_item.mods != []) {
      for (int i = 0; i < _item.mods.length; i++) {
        String modeStr = "assets/icon_mods/mod_${_item.mods[i]
            .toLowerCase()}.png";
        mods_icons.add(Image.asset(modeStr, scale: 1));
      }
    }
    if (_item.mods.isEmpty == true) mods_icons.add(Image.asset(
        "assets/icon_mods/mod_nm.png", scale: 1)); // for no-mod score

    if (_item.gainedPP == null) {
      _item.gainedPP = 0;
    }
    return Card(
      color: my_colors.Palette.brown.shade100,
      elevation: 15.0,
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                    children: [
                      Text(
                      "${_index}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: my_colors.Palette.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo 2',
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(_item.avatarURL),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ]
                      ),
                      const SizedBox(width: 5.0,),
                      Expanded(child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_item.username,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Exo 2')
                            ),
                            const SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Image.asset('icons/flags/png/${_item.countryCode
                                    .toLowerCase()}.png', package: 'country_icons',
                                    scale: 4.5),
                                const SizedBox(width: 10.0,),
                              ],
                            ),
                          ]
                        ),
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icon_score_types/grade_' +
                                      "${_item.mapRank}".toLowerCase() +
                                      ".png", scale: 1.25,),
                              ],
                            ),
                            SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gained:",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Exo 2')
                                ),
                                Text("Accuracy:",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Exo 2')
                                ),
                              ]
                      ),
                            const SizedBox(width: 10.0,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${_item.gainedPP.round()}pp",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: my_colors.Palette.hotPink,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Exo 2')
                                ),
                                Text(accuracy + "%",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Exo 2')
                                ),
                            ]
                      ),
                          ],
                        ),
                      const SizedBox(width: 35.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Combo:",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("Mods:",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                        ],
                      ),
                      const SizedBox(width: 5.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text("${_item.maxCombo}x ",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Exo 2')
                              ),
                              Text("(${_beatmapItem.maxCombo}x)",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: my_colors.Palette.red,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Exo 2')
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: mods_icons.length,
                                itemBuilder: (context, index) {
                                  return mods_icons[index];
                                }),
                          )
                        ],
                      ),
                      const SizedBox(width: 10.0,),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Text("Date of score:    ",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
                Text("${_item.dateOfScore}".substring(0, 10),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}