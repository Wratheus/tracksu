import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/cubit/beatmap_cubit.dart';
import '../pages/error_page.dart';
import '../models/scores.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/beatmap_widgets/beatmap_score_widget.dart';
import '../widgets/beatmap_widgets/beatmap_widget.dart';
import '../pages/user_tab_page.dart';

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
                backgroundColor:my_colors.Palette.brown.shade200,
                body: Center(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        leading: Image.asset('assets/utils/cloud_logo.png'),
                        title: Text((state.beatmapInstance.mapTitle)!,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontFamily: 'Exo 2',
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: my_colors.Palette.hotPink.shade900.withOpacity(0.25),
                                offset: Offset(7, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                        backgroundColor: my_colors.Palette.purple,
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            BeatmapInfoWidget(beatmap: state.beatmapInstance, mapperInstance: state.mapperInstance,),
                            SizedBox(height: 5,),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: state.beatmapLeaderboard.length,
                                itemBuilder: (context, index){
                                  return InkWell(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabPage(username: state.beatmapLeaderboard[index].username))),
                                      child: BeatmapScoreWidget(item: state.beatmapLeaderboard[index], index: index, beatmapItem: state.beatmapInstance,)
                                  );}
                            ),
                          ]
                        ),
                      )
                    ],
                  ),
                )
            ),
            onRefresh: () => context.read<BeatmapCubit>().reloadBeatmap(),
          );
        }
        else return Container();
      }
    );
  }
}