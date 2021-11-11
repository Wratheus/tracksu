import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/cubit/beatmap_cubit.dart';
import '../pages/error_page.dart';
import '../models/scores.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/beatmap_widgets/beatmap_score_widget.dart';
import '../widgets/beatmap_widgets/beatmap_widget.dart';

class BeatmapPage extends StatelessWidget {
  final Scores _item; // UserScore from UserPage contains information about map ID and map Name for future requests
  const BeatmapPage({Key? key, required item}):
        _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BeatmapCubit(),
      child: new _BeatmapPage(item: _item),);
  }
}

class _BeatmapPage extends StatelessWidget {
  final Scores _item;
  const _BeatmapPage({Key? key, required item}) :
        _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BeatmapCubit, BeatmapState>(builder: (context, state) {
      if (state is BeatmapInitial) {
          context.read<BeatmapCubit>().loadBeatmap(_item.beatmapSetMapId, _item.mapTitle);
        }
        if (state is BeatmapErrorState) { // Throw error if state is UserError
          return ErrorPage(
              exceptionPageName: BeatmapPage(item: _item),
              errorMessage: state.errorMessage);
        }
        if (state is BeatmapLoadedState) { // Reload News if state is UserReload (wheel page down)
          return Scaffold(
              appBar: AppBar(backgroundColor: my_colors.Palette.pink,
                  title: Text("Beatmap loaded successful"), leading: Image.asset('assets/utils/cloud_logo.png')),
              backgroundColor:my_colors.Palette.brown,
              body: Center(
                child: Column(
                    children: [
                      Container(
                          child: Image.asset('assets/utils/error.jpg')),
                      SizedBox(height: 100),
                      Expanded(child: Text("in development",
                          textAlign: TextAlign.center ,
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',)),),
                      SizedBox(height: 50),
                      ElevatedButton(onPressed: () => toMainScreen(context),
                          child: const Text("Return",
                              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',))),
                    ]
                ),
              )
          );
        }
        else return Container();
      }
    );
  }
}