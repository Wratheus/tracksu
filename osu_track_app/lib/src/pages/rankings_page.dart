import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/pages/error_page.dart';
import 'package:osu_track_app/src/widgets/rankings_widgets/rankings_search_by_page_widget.dart';

import '../pages/cubit/rankings_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/rankings_widgets/rankings_widget.dart';


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
        context.read<RankingsCubit>().loadRankings(state.filter, state.filterFriendsValue, state.page);
        return Scaffold(
            appBar: AppBar(backgroundColor: my_colors.Palette.purple,
                title: Text("Leaderboard",
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'Exo 2',
                    fontWeight: FontWeight.bold,
                  ),), leading: Image.asset('assets/utils/cloud_logo.png')),
            body: Center(child: CircularProgressIndicator(),),
            backgroundColor: my_colors.Palette.brown.shade100
        );
    };

      if(state is RankingsErrorState){ //// Throw error if state is RankingsError
        return ErrorPage(exceptionPageName: RankingsPage(), errorMessage: state.errorMessage);
      }
      if(state is RankingsLoadedState){ //// Reload rankings if state is RankingsReload (wheel page down)
        return RefreshIndicator(
          backgroundColor: my_colors.Palette.brown.shade100,
          child: Scaffold(
            appBar: AppBar(backgroundColor: my_colors.Palette.purple,
                title: Text("Leaderboard",
                  style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontFamily: 'Exo 2',
                  fontWeight: FontWeight.bold,
                ),), leading: Image.asset('assets/utils/cloud_logo.png')),
            backgroundColor: my_colors.Palette.brown.shade200,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  RankingsSearchByPageWidget(state.filter, state.filterFriendsValue),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.rankingsList.length,
                    itemBuilder: (context, index){
                    return InkWell(
                      onTap: () => context.read<RankingsCubit>().loadUserFromRankings(state.rankingsList[index].username, context),
                      child: RankingsWidget(item: state.rankingsList[index])
                  );}
                ),
                ],
              ),
            ),
          ),
          onRefresh: () => context.read<RankingsCubit>().reloadRankings(state.filter, state.filterFriendsValue, state.page),
        );
      }
      return Container();
    });
  }
}

