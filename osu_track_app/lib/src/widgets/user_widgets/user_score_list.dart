import 'package:flutter/material.dart';
import 'package:osu_track_app/src/pages/cubit/user_cubit.dart';
import 'package:provider/src/provider.dart';

import 'user_score_card.dart';
import '../../utils/color_contrasts.dart' as my_colors;

class UserBestScoresList extends StatelessWidget {

  final List<dynamic> _userBestScoresInstance;

  const UserBestScoresList({Key? key, required List<dynamic> userBestScoresInstance}):
        _userBestScoresInstance = userBestScoresInstance,
        super(key: key);
// commented code makes 5 scores from best performance and first-places scores to be unwrapped by default
  @override
  Widget build(BuildContext context) {
/*    if (_userBestScoresInstance.length < 5) {
      return Container(
        child:
        Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: my_colors.Palette.hotPink, spreadRadius: 1)
                      ],
                      color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(width: 10,),
                Text("Best Performance",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                      shadows: [
                        Shadow(
                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                          offset: Offset(7, 5),
                          blurRadius: 10,
                        )
                      ],
                    )
                ),
                SizedBox(height: 50,)
              ],
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _userBestScoresInstance.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => context.read<UserCubit>().loadBeatmapFromUser(_userBestScoresInstance[index], context),
                      child: ScoreCardWidget(
                          item: _userBestScoresInstance[index])
                  );
                }
            )
          ],
        ),
      );
    }
    else {*/
      return Container(
        child:
        Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: my_colors.Palette.hotPink, spreadRadius: 1)
                      ],
                      color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(width: 10,),
                Text("Best Performance",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                      shadows: [
                        Shadow(
                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                          offset: Offset(7, 5),
                          blurRadius: 10,
                        )
                      ],
                    )
                ),
                SizedBox(height: 50,)
              ],
            ),
            // ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     physics: ClampingScrollPhysics(),
            //     itemCount: _userBestScoresInstance.length - 5,
            //     itemBuilder: (context, index) {
            //       while (index < 5) {
            //         return InkWell(
            //             onTap: () => context.read<UserCubit>().loadUserFromRankings(_userBestScoresInstance[index], context),
            //             child: ScoreCardWidget(
            //                 item: _userBestScoresInstance[index])
            //         );
            //       }
            //       return Container();
            //     }),
            ExpansionTile(
              iconColor: my_colors.Palette.pink,
              collapsedIconColor: my_colors.Palette.pink,
              title: Row(
                children: [
                  Text("Show best performance scores",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: my_colors.Palette.pink,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                        shadows: [
                          Shadow(
                            color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                            offset: Offset(7, 5),
                            blurRadius: 10,
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 50,)
                ],
              ),
              children: [
                SizedBox(height: 10),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    // itemCount: _userBestScoresInstance.length - 5,
                    itemCount: _userBestScoresInstance.length,
                    itemBuilder: (context, index) {
                      // index += 5;
                      index += 0;
                      return InkWell(
                          onTap: () => context.read<UserCubit>().loadBeatmapFromUser(_userBestScoresInstance[index], context),
                          child: ScoreCardWidget(
                              item: _userBestScoresInstance[index])
                      );
                    }
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  class UserFirstScoresList extends StatelessWidget {

    final List<dynamic> _userFirstScoresInstance;

    const UserFirstScoresList(
        {Key? key, required List<dynamic> userFirstScoresInstance})
        :
          _userFirstScoresInstance = userFirstScoresInstance,
          super(key: key);

    @override
    Widget build(BuildContext context) {
      if (_userFirstScoresInstance.isEmpty == true) {
        return Container();
      }
      else {
        return Container(
          child:
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: my_colors.Palette.hotPink, spreadRadius: 1)
                        ],
                        color: my_colors.Palette.brown.shade200),
                    alignment: Alignment.center,),
                  SizedBox(width: 10,),
                  Text("Show first-place scores",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                        shadows: [
                          Shadow(
                            color: my_colors.Palette.hotPink.shade900
                                .withOpacity(
                                0.25),
                            offset: Offset(7, 5),
                            blurRadius: 10,
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 50,)
                ],
              ),

/*                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _userFirstScoresInstance.length - 3,
                    itemBuilder: (context, index) {
                      while (index < 3) {
                        return InkWell(
                            onTap: () => context.read<UserCubit>().loadUserFromRankings(_userFirstScoresInstance[index], context),
                            child: ScoreCardWidget(item: _userFirstScoresInstance[index])
                        );
                      }
                      return Container();
                    }),*/

              ExpansionTile(
                iconColor: my_colors.Palette.pink,
                collapsedIconColor: my_colors.Palette.pink,
                title: Row(
                  children: [
                    Text("Show more scores",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: my_colors.Palette.pink,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo 2',
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900
                                  .withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      // itemCount: _userFirstScoresInstance.length - 3,
                      itemCount: _userFirstScoresInstance.length,
                      itemBuilder: (context, index) {
                        // index += 3;
                        index += 0;
                        return InkWell(
                            onTap: () =>
                                context.read<UserCubit>().loadBeatmapFromUser(
                                    _userFirstScoresInstance[index], context),
                            child: ScoreCardWidget(
                                item: _userFirstScoresInstance[index])
                        );
                      }),
                ],
              )
            ],
          ),
        );
      }
    }
  /* // if user have less than 5 scores
      else {
        return
          Container(
            child:
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: my_colors.Palette.hotPink, spreadRadius: 1)
                          ],
                          color: my_colors.Palette.brown.shade200),
                      alignment: Alignment.center,),
                    SizedBox(width: 10,),
                    Text("First Place Ranks",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo 2',
                          shadows: [
                            Shadow(
                              color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                              offset: Offset(7, 5),
                              blurRadius: 10,
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _userFirstScoresInstance.length,
                    itemBuilder: (context, index) {
                      while (index < _userFirstScoresInstance.length) {
                        return InkWell(
                            onTap: () => context.read<UserCubit>().loadBeatmapFromUser(_userFirstScoresInstance[index], context),
                            child: ScoreCardWidget(item: _userFirstScoresInstance[index])
                        );
                      }
                      return Container();
                    }),
              ],
            ),
          );
      }
    }
  }
}*/
  }
