import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/utils/url_launch.dart';
import '../pages/cubit/rankings_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../objects/rankings.dart' as rankings;
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
      if(state is RankingsInitial){ // run Circular progress bar while news is loading state is newsInitial
        context.read<RankingsCubit>().loadRankings();
        return const Center(child: CircularProgressIndicator(backgroundColor: my_colors.Palette.brown),);

    };
      if(state is RankingsErrorState){ // Throw error if state is NewsError
        return Center(
          child: Scaffold(
            body: Text(state.errorMessage, textAlign: TextAlign.center, style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2'),),
            bottomNavigationBar: Image.asset('assets/error.jpg'),
          ),
        );
      }
      if(state is RankingsLoadedState){ // Reload News if state is NewsReload (wheel page down)
        return RefreshIndicator(
          child: ListView.builder(
              itemCount: state.rankingsList.length,
              itemBuilder: (context, index){
            return InkWell(
            onTap: () {},
              child: listWidget(state.rankingsList[index])
            );}
          ),
          onRefresh: () => context.read<RankingsCubit>().reloadRankings(),
        );
      }
      return Container();
    });
  }
}

