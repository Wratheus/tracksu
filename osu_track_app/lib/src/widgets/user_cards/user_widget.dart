import 'package:flutter/material.dart';
import '../../objects/user.dart';
import '../../utils/color_contrasts.dart' as my_colors;

  Widget UserInfoWidget(User item){
    return Row(
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
                      fontSize: 20.0,
                      color: my_colors.Palette.yellow,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(item.username,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
        ],
    );
  }
