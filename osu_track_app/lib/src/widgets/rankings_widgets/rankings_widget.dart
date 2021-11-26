import 'package:flutter/material.dart';

import'../../models/rankings.dart';
import '../../utils/color_contrasts.dart' as my_colors;


class RankingsWidget extends StatelessWidget {

  final Rankings _item;

  const RankingsWidget({Key? key, required Rankings item})
      :
        _item = item,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    String accuracy = "${_item.hitAccuracy}";
    if (accuracy.length > 5) {
      accuracy = accuracy.substring(0, 5);
    }
    return Card(
      color: my_colors.Palette.brown.shade200,
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
                          image: NetworkImage(_item.avatarURL),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ]),
              const SizedBox(width: 5.0,),
              Expanded(child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${_item.globalRank}",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: my_colors.Palette.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo 2',
                      ),
                    ),
                    Text(_item.username,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    const SizedBox(height: 15.0,),
                    Container(
                      height: 18,
                      width: 30,
                      child: Image.asset('icons/flags/png/${_item.countryCode
                          .toLowerCase()}.png', package: 'country_icons', fit: BoxFit.fill,
                          scale: 2.5),
                    ),

                  ]
              ),
              ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Performance points:",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    Text("Accuracy:",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    Text("Play count:",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    Text("Maximum combo:",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                    Text("Replay count:",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    ),
                  ]
              ),
              SizedBox(width: 20),
              Container(
                width: 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${(_item.PP).round()}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text(accuracy+"%",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("${_item.playCount}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("${_item.maximumCombo}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                      Text("${_item.replaysWatchedByOthers}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: my_colors.Palette.yellow,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo 2')
                      ),
                    ]
                ),
              ),
            ]
        ),
      ),
    );
  }
}