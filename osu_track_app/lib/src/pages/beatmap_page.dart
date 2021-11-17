import 'package:flutter/cupertino.dart';
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
          context.read<BeatmapCubit>().loadBeatmap(_item.beatmapSetMapId, _item.mapTitle, _item.mapperName);
          return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
          backgroundColor: my_colors.Palette.brown.shade100,);
        }
        if (state is BeatmapErrorState) { // Throw error if state is UserError
          return ErrorPage(
              exceptionPageName: BeatmapPage(item: _item),
              errorMessage: state.errorMessage);
        }
        if (state is BeatmapLoadedState) { // Reload News if state is UserReload (wheel page down)
          return RefreshIndicator(
            backgroundColor: my_colors.Palette.brown.shade100,
            child: Scaffold(
                appBar: AppBar(backgroundColor: my_colors.Palette.purple,
                    title: Text("Beatmap loaded successful"), leading: Image.asset('assets/utils/cloud_logo.png')),
                backgroundColor:my_colors.Palette.brown.shade100,
                body: Center(
                  child: Column(
                      children: [
                        BeatmapInfoWidget(beatmap: state.beatmapInstance, mapperInstance: state.mapperInstance,),
                        SizedBox(height: 10),
                        Container(
                          height: 30,
                          width: 90,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: () => toMainScreen(context),
                              child: Text("Return",
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Exo 2',),
                                textAlign: TextAlign.center,
                              )
                          ),
                        ),
                      ]
                  ),
                )
            ),
            onRefresh: () => context.read<BeatmapCubit>().loadBeatmap(_item.beatmapSetMapId, _item.mapTitle, _item.mapperName),
          );
        }
        else return Container();
      }
    );
  }
}