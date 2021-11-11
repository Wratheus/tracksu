import 'package:flutter/material.dart';
import '../../models/news.dart';

import '../../utils/color_contrasts.dart' as my_colors;
import '../../pages/cubit/news_cubit.dart';


//Widget newsWidget(News item, BuildContext context, NewsLoadedState state) {
class newsWidget extends StatelessWidget {

  final News _item;

  const newsWidget({Key? key, required News item}):
        _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Card(
      color: my_colors.Palette.brown.shade100,
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 8, left: 8, right: 8),
        child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${_item.publishedAt}".substring(0, 10),
                        style: const TextStyle(
                            color: my_colors.Palette.yellow,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2')
                    )
                  ]
              ),
              const SizedBox(height: 5,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width / 1.30,
                      height: height / 11,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${_item.firstImage}"),
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
                    Text("${_item.title}",
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
                  Text("${_item.author}",
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
                  Text("${_item.preview}",
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
      ),
    );
  }
}