import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/pages/error_page.dart';

import '../pages/cubit/rankings_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/rankings_widgets/list_widget.dart';


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
        return const Center(child: CircularProgressIndicator(),);

    };
      if(state is RankingsErrorState){ //// Throw error if state is RankingsError
        return ErrorPage(exceptionPageName: RankingsPage(), errorMessage: state.errorMessage,);
      }
      if(state is RankingsLoadedState){ //// Reload rankings if state is RankingsReload (wheel page down)
        return RefreshIndicator(
          backgroundColor: my_colors.Palette.brown.shade100,
          child: Scaffold(
            appBar: AppBar(backgroundColor: my_colors.Palette.purple,
                title: const Text("Osu! Leaderboard",
                  style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontFamily: 'Exo 2',
                  fontWeight: FontWeight.bold,
                ),), leading: Image.asset('assets/utils/cloud_logo.png')),
            body: ListView.builder(
              itemCount: state.rankingsList.length,
              itemBuilder: (context, index){
              return InkWell(
                onTap: () => context.read<RankingsCubit>().loadUserFromRankings(state.rankingsList[index].username, context),
                child: listWidget(item: state.rankingsList[index])
            );}
          ),
            backgroundColor: my_colors.Palette.brown.shade100,
          ),
          onRefresh: () => context.read<RankingsCubit>().reloadRankings(),
        );
      }
      return Container();
    });
  }
}

