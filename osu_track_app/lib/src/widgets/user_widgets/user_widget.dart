import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../utils/color_contrasts.dart' as my_colors;

class UserInfoWidget extends StatelessWidget {

  final User _user;

  const UserInfoWidget({Key? key, required User user}):
        _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if ("${_user.hitAccuracy}".length > 5) {
      _user.hitAccuracy = "${_user.hitAccuracy}".substring(0,5);
    }
    if(_user.globalRank == null){
      _user.globalRank = "Inactive";
      _user.countryRank = "Inactive";
    }
    else if ("${_user.globalRank}"[0] != "#") {
      _user.globalRank = "#${_user.globalRank}";
      _user.countryRank = "#${_user.countryRank}";
    }
    return Column(
        children: [
          const SizedBox(height: 15.0,),
          // User avatar rank and country bloc
          Container(
            width: 350,
            alignment: Alignment.center,
            child:
            Row(
              children: [
                Column(children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_user.avatarURL),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                          offset: Offset(7, 5),
                          spreadRadius: 2,
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ]),
                const SizedBox(width: 5.0,),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_user.username}",
                          style: TextStyle(
                            fontSize: 22.0,
                            shadows: [
                              Shadow(
                                color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                offset: Offset(7, 5),
                                blurRadius: 10,
                              )
                            ],
                            color: Colors.white,
                            fontFamily: 'Exo 2',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        Text("${_user.globalRank}",
                            style: TextStyle(
                                color: my_colors.Palette.yellow,
                                fontSize: 18.0,
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
                        const SizedBox(height: 10.0,),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                offset: Offset(7, 5),
                                spreadRadius: 2,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          height: 25,
                          width: 41.66,
                          child: Image.asset('icons/flags/png/${_user.countryCode
                              .toLowerCase()}.png', package: 'country_icons', fit: BoxFit.fill,
                              scale: 2),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
          // User information bloc
          const SizedBox(height: 15.0,),
          Container(
            width: 350,
            height: 135,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: my_colors.Palette.brown.shade200,
                image: DecorationImage(
                image: (_user.customCoverURL == null) ? NetworkImage("${_user.defaultCoverURL}") : NetworkImage("${_user.customCoverURL}"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.24), BlendMode.dstATop),
                ),
              boxShadow: [
                BoxShadow(
                  color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                  offset: Offset(7, 5),
                  spreadRadius: 2,
                  blurRadius: 3,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ranked Score:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    Text("Hit Accuracy:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    Text("Play Count:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("Total Hits:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("Maximum Combo:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("Replay count:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${_user.rankedScore}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    Text("${_user.hitAccuracy}%",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
                    Text("${_user.playCount}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("${_user.totalHits}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("${_user.maximumCombo}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                    Text("${_user.replaysWatched}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
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
                  ],
                ),
              ],
            ),
          ),
          // colored strips under user statistics
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  width: 150,
                  height: 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: my_colors.Palette.hotPink,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                          offset: Offset(7, 5),
                          spreadRadius: 2,
                          blurRadius: 3,
                        )
                      ],
                  ),
                ),
                SizedBox(height: 5,),
                Text("Total Play Time",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                SizedBox(height: 5,),
                Text("${(_user.playTime / 3600).ceil()} hours",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
              ]),
              SizedBox(width: 20,),
              Column(children: [
                Container(
                  width: 150,
                  height: 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: my_colors.Palette.red.shade300,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                        offset: Offset(7, 5),
                        spreadRadius: 2,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text("Performance Points",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                SizedBox(height: 5,),
                Text("${(_user.totalPP).round()}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
              ]),
            ],
          ),
          SizedBox(height: 20),

          // score-types bloc
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
                        offset: Offset(7, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/icon_score_types/grade_xh.png'),),
                SizedBox(height: 5,),
                Text("${_user.amountOfSSH}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
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
                    )
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
                        offset: Offset(7, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/icon_score_types/grade_x.png'),),
                SizedBox(height: 5,),
                Text("${_user.amountOfSS}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
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
                    )
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
                        offset: Offset(7, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/icon_score_types/grade_sh.png'),),
                SizedBox(height: 5,),
                Text("${_user.amountOfSh}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
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
                    )
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
                        offset: Offset(7, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset('assets/icon_score_types/grade_s.png'),),
                SizedBox(height: 5,),
                Text("${_user.amountOfS}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
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
                    )
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.1),
                        offset: Offset(7, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset('assets/icon_score_types/grade_a.png'),),
                SizedBox(height: 5,),
                Text("${_user.amountOfA}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                      shadows: [
                        Shadow(
                          color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                          offset: Offset(7, 5),
                          blurRadius: 10,
                        )
                      ],)
                ),
              ]),
            ],
          ),

          // ranking in the world and country bloc
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  width: 150,
                  height: 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                        offset: Offset(7, 5),
                        spreadRadius: 2,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text("World rank",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                SizedBox(height: 5,),
                Text("${_user.globalRank}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: my_colors.Palette.yellow,
                        fontSize: 16,
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
              ]),
              SizedBox(width: 20,),
              Column(children: [
                Container(
                  width: 150,
                  height: 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                        offset: Offset(7, 5),
                        spreadRadius: 2,
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text("Country rank",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                SizedBox(height: 5,),
                Text("${_user.countryRank}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: my_colors.Palette.yellow,
                        fontSize: 16,
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
              ]),
            ],
          ),
          SizedBox(height: 20),
        ]
    );
  }
}
