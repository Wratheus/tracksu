import 'package:flutter/material.dart';

import 'user_score_card.dart';
import '../../utils/color_contrasts.dart' as my_colors;


Widget UserBestScoresList(List<dynamic> userBestScoresInstance, context) {
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
                  style:TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo 2',
                  )
              ),
              SizedBox(height: 50,)
            ],
          ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: userBestScoresInstance.length-5,
            itemBuilder: (context, index){
              while(index<5) {
                print("best scores $index");
                return InkWell(
                    onTap: () => {},
                    child: ScoreCardWidget(
                        userBestScoresInstance[index], context)
                );
              }
              return Container();
            }),
        ExpansionTile(
          iconColor: my_colors.Palette.pink,
          collapsedIconColor: my_colors.Palette.pink,
          title: Row(
            children: [
              Text("Show more scores",
                  style:TextStyle(
                    fontSize: 16.0,
                    color: my_colors.Palette.pink,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Exo 2',
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
                itemCount: userBestScoresInstance.length-5,
                itemBuilder: (context, index){
                  index+=5;
                  return InkWell(
                      onTap: () => {},
                      child: ScoreCardWidget(userBestScoresInstance[index], context)
                  );
                }
            ),
          ],
        )
      ],
    ),
  );
}


Widget UserFirstScoresList(List<dynamic> userFirstScoresInstance, context) {
  // check if user have first place scores
  if (userFirstScoresInstance.isEmpty == true) {
    print(userFirstScoresInstance);
    return Container();
  }
  else {
    // if user have more than 5 first place scores
    if (userFirstScoresInstance.length > 5) {
      print(userFirstScoresInstance);
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
                Text("First Place Ranks",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2',
                    )
                ),
                SizedBox(height: 50,)
              ],
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: userFirstScoresInstance.length-3,
                itemBuilder: (context, index){
                  while(index<3) {
                    print("best scores $index");
                    return InkWell(
                        onTap: () => {},
                        child: ScoreCardWidget(
                            userFirstScoresInstance[index], context)
                    );
                  }
                  return Container();
                }),

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
                    itemCount: userFirstScoresInstance.length - 3,
                    itemBuilder: (context, index) {
                      index += 3;
                      return InkWell(
                          onTap: () => {},
                          child: ScoreCardWidget(
                              userFirstScoresInstance[index], context)
                      );
                    }),
              ],
            )
          ],
        ),
      );
    }
    // if user have less than 5 scores
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
                      )
                  ),
                  SizedBox(height: 50,)
                ],
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: userFirstScoresInstance.length,
                  itemBuilder: (context, index) {
                    while (index < userFirstScoresInstance.length) {
                      return InkWell(
                          onTap: () => {},
                          child: ScoreCardWidget(
                              userFirstScoresInstance[index], context)
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