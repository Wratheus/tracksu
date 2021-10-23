import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/pages/error_page.dart';

import '../pages/cubit/rankings_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/rankings_cards/list_widget.dart';



class RankingsPage extends StatelessWidget {
  const RankingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RankingsCubit(),
      child: const _RankingsPage(),
    );
  }
}

class _RankingsPage extends StatelessWidget {
  const _RankingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingsCubit, RankingsState>(builder: (context, state){
      if(state is RankingsInitial){ // run Circular progress bar while rankings is loading
        context.read<RankingsCubit>().informInitial();
        context.read<RankingsCubit>().loadRankings();
        return const Center(child: CircularProgressIndicator(backgroundColor: my_colors.Palette.brown),);

    };
      if(state is RankingsErrorState){ // Throw error if state is RankingsError
        return ErrorPage(exceptionPageName: RankingsPage());
      }
      if(state is RankingsLoadedState){ // Reload rankings if state is RankingsReload (wheel page down)
        return RefreshIndicator(
          child: Scaffold(
            appBar: AppBar(backgroundColor: my_colors.Palette.pink,
                title: const Text("Osu! Leaderboard"), leading: Image.asset('assets/cloud_logo.png')),
            body: ListView.builder(
              itemCount: state.rankingsList.length,
              itemBuilder: (context, index){
              return InkWell(
                onTap: () {},
                child: listWidget(state.rankingsList[index])
            );}
          ),
            backgroundColor: my_colors.Palette.brown,
          ),
          onRefresh: () => context.read<RankingsCubit>().reloadRankings(),
        );
      }
      return Container();
    });
  }
}

