import 'package:flutter/material.dart';

import '../../widgets/beatmap_widgets/beatmap_play_widget.dart';
import '../../models/beatmap.dart';
import '../../utils/color_contrasts.dart' as my_colors;
import '../../pages/user_tab_page.dart';

class BeatmapCardWidget extends StatelessWidget {
  final Beatmap _beatmap;
  const BeatmapCardWidget({Key? key, required Beatmap beatmap})
      :
        _beatmap = beatmap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
/*    var minuteStr = (_beatmap.beatmapLength ~/ 60).toString().padLeft(2, '0');
    var secondStr = (_beatmap.beatmapLength % 60).toString().padLeft(2, '0');
    var _timeStr = '$minuteStr:$secondStr';
    final double width = MediaQuery
        .of(context)
        .size
        .width;*/
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            height: height / 8.0,
            decoration: BoxDecoration(
              color: my_colors.Palette.brown.shade100,
              image: DecorationImage(
                image: NetworkImage("${_beatmap.coversJPG}"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.24), BlendMode.dstATop),
              ),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                  offset: Offset(7, 5),
                  spreadRadius: 2,
                  blurRadius: 3,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BeatmapPlayWidget(beatmap: _beatmap),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_beatmap.mapTitle}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.white,
                                      fontFamily: 'Exo 2',
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                          offset: Offset(7, 5),
                                          blurRadius: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "by ${_beatmap.artistName}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: my_colors.Palette.red,
                                      fontFamily: 'Exo 2',
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                          offset: Offset(7, 5),
                                          blurRadius: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                           ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabPage(username: _beatmap.mapper.username!))),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width:  45.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                        offset: Offset(7, 5),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(_beatmap.mapper.avatarURL),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),

                                  ),
                                ),
                                SizedBox(width: 6,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        "Submitted: ${_beatmap.submittedDate}".substring(0, 20),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontFamily: 'Exo 2',
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                              offset: Offset(7, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${_beatmap.rankedStatus}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontFamily: 'Exo 2',
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                              offset: Offset(7, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "mapped by ${_beatmap.mapper.username}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: Colors.white,
                                          fontFamily: 'Exo 2',
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                              offset: Offset(7, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.30), spreadRadius: 1)],
                          color: _beatmap.colorOfRankedStatus!.withOpacity(0.75),),
                        child: Text(
                          "${_beatmap.shortRankedStatus}".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontFamily: 'Exo 2',
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                offset: Offset(7, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                              'assets/utils/yellow_star.png',
                              color: my_colors.Palette.yellow,
                              scale: 2.9),
                          SizedBox(width: 5,),
                          Text(
                            "${_beatmap.difficultyRating}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'Exo 2',
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                  offset: Offset(7, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                              'assets/utils/heart-solid.png',
                              color: my_colors.Palette.hotPink,
                              scale: 42),
                          SizedBox(width: 5,),
                          Text(
                            "${_beatmap.favouriteCount}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'Exo 2',
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                  offset: Offset(7, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                              'assets/utils/play-circle-solid.png',
                              color: my_colors.Palette.yellow,
                              scale: 42),
                          SizedBox(width: 5,),
                          Text(
                            "${_beatmap.playCount}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'Exo 2',
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                  offset: Offset(7, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }
}