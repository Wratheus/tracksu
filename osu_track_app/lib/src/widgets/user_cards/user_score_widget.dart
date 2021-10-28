import 'package:flutter/material.dart';

import '../../models/scores.dart';
import '../../utils/color_contrasts.dart' as my_colors;


Widget ScoreWidget(Scores item) {
  return Container(
    child: Card(
      color: my_colors.Palette.brown.shade100,
      elevation: 25.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            children: [
              Column(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${item.coversJPG}"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),]),
              const SizedBox(width: 5.0,),
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/icon_score_types/grade_' + "${item.mapRank}".toLowerCase() + ".png"),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    Text("${(item.mapTitle)} by ${(item.artistName)}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${(item.difficultyName)}",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: my_colors.Palette.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Exo 2')
                              ),
                              Row(
                                  children: [
                                    Image.asset('assets/utils/yellow_star.png', scale:25),
                                    Text("${(item.difficultyRating)}",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: my_colors.Palette.yellow,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Exo 2')
                                    ),
                                  ]
                              ),


                            ],
                          ),
                        ),
                        Text("${(item.dateOfScore)}".substring(0, 10),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white30,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Exo 2')
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text("${(item.accuracy*100).round()}%",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: my_colors.Palette.yellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Exo 2')
                            ),
                            Text("${(item.mods.join(' '))}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: my_colors.Palette.yellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Exo 2')
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Text("${(item.gainedPP).round()}pp",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: my_colors.Palette.hotPink,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Exo 2')
                        ),
                      ],
                    )

                  ],
                ),
              )
            ]
        ),
      ),
    ),
  );
}