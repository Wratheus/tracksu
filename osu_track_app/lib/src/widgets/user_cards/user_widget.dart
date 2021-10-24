import 'package:flutter/material.dart';
import '../../objects/user.dart';
import '../../utils/color_contrasts.dart' as my_colors;
import 'user_search_widget.dart';

  Widget UserInfoWidget(User item){
    return Column(
        children: [
          const SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserSearchWidget()
          ]
        ),
          // User avatar rank and country bloc
          const SizedBox(height: 30.0,),
          Container(
            width: 350,
            alignment: Alignment.center,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
            child:
              Row(
                children: [
                  Column(children:[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.avatarURL),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),]),
                  const SizedBox(width: 5.0,),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item.username}",
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontFamily: 'Exo 2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text("#${item.globalRank}",
                              style: const TextStyle(
                                  color: my_colors.Palette.yellow,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          const SizedBox(height: 10.0,),
                          Image.asset('icons/flags/png/${item.countryCode.toLowerCase()}.png', package: 'country_icons', scale: 2),
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
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ranked Score:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("Hit Accuracy:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("Play Count:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("Total Hits:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("Maximum Combo:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("Replay count:",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                    ],
                  ),
                  Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${item.rankedScore}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("${item.hitAccuracy}".substring(0, 5)+"%",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("${item.playCount}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: my_colors.Palette.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("${item.totalHits}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: my_colors.Palette.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("${item.maximumCombo}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: my_colors.Palette.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
                          ),
                          Text("${item.replaysWatched}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: my_colors.Palette.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo 2')
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: my_colors.Palette.hotPink, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(height: 5,),
                Text("Total Play Time",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
                SizedBox(height: 5,),
                Text("${(item.playTime/3600).ceil()} hours",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 20,),
              Column(children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: my_colors.Palette.red.shade300, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(height: 5,),
                Text("Performance Points",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
                SizedBox(height: 5,),
                Text("${(item.totalPP).ceil()}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
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
                Container(child: Image.asset('assets/icon_score_types/grade_ss_silver.png'),),
                SizedBox(height: 5,),
                Text("${item.amountOfSSH}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(child: Image.asset('assets/icon_score_types/grade_ss.png'),),
                SizedBox(height: 5,),
                Text("${item.amountOfSS}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(child: Image.asset('assets/icon_score_types/grade_s_silver.png'),),
                SizedBox(height: 5,),
                Text("${item.amountOfSh}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(child: Image.asset('assets/icon_score_types/grade_s.png'),),
                SizedBox(height: 5,),
                Text("${item.amountOfS}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 10,),
              Column(children: [
                Container(child: Image.asset('assets/icon_score_types/grade_a.png'),),
                SizedBox(height: 5,),
                Text("${item.amountOfA}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.cyanAccent, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(height: 5,),
                Text("World rank",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
                SizedBox(height: 5,),
                Text("#${item.globalRank}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: my_colors.Palette.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
              SizedBox(width: 20,),
              Column(children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.lightGreenAccent, spreadRadius: 1)], color: my_colors.Palette.brown.shade200),
                  alignment: Alignment.center,),
                SizedBox(height: 5,),
                Text("Country rank",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
                SizedBox(height: 5,),
                Text("#${item.countryRank}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: my_colors.Palette.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
                ),
              ]),
            ],
          ),
          SizedBox(height: 20),

        ]
    );
  }

