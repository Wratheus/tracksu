import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

import'../../objects/rankings.dart';
import '../../utils/color_contrasts.dart' as my_colors;


Widget listWidget(Rankings item) {
  return Card(
    color: my_colors.Palette.brown,
    elevation: 2.0,
    margin: const EdgeInsets.only(bottom: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.avatarURL),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
      ),
        const SizedBox(
          width: 5.0,
      ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              "#${item.globalRank}",
                  style: const TextStyle(
                      fontSize: 24.0,
                      color: my_colors.Palette.yellow,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.bold,
                  ),
              ),
              Text(item.username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo 2')
                  ),
              Image.asset('icons/flags/png/${item.countryCode.toLowerCase()}.png', package: 'country_icons', scale: 2),
              const SizedBox(
                width: 10.0,
              ),

               ]
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${item.PP}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2')
              ),
              ]
          ),
        ]
      ),
    ),
  );
}