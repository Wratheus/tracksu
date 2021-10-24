import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'package:osu_track_app/src/objects/news.dart';

import'../../objects/rankings.dart';
import '../../utils/color_contrasts.dart' as my_colors;
import '../../pages/cubit/news_cubit.dart';


Widget newsWidget(News item, BuildContext context, NewsLoadedState state) {
  return Card(
      color: my_colors.Palette.brown.shade100,
      elevation: 10.0,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 8, left: 8, right: 8),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("${item.publishedAt}".substring(0, 10),
                  style: const TextStyle(
                      color: my_colors.Palette.yellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2')
                )]
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                width: 350.0,
                height: 80.0,
                alignment: Alignment.center,
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${item.firstImage}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
                const SizedBox(
                  width: 5.0,
                ),
                ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child:
                    Text("${item.title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    ),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                     Expanded(child:
                        Text("${item.author}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                            ),
                     ),

              ],
            ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:
                  Text("${item.preview}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Exo 2')
                  ),
                  ),
                  const SizedBox(height: 20,),
                ],
              )
            ]
        ),
      )
    );
}