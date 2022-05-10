import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/error_page.dart';
import '../pages/rankings_tab_page.dart';
import '../widgets/rankings_widgets/rankings_search_by_page_widget.dart';
import '../pages/cubit/rankings_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/rankings_widgets/rankings_widget.dart';
import '../pages/user_tab_page.dart';

class RankingsPage extends StatelessWidget {
  final String? mode;
  const RankingsPage({Key? key, this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RankingsCubit(),
      child: new _RankingsPage(mode: mode),
    );
  }
}

class _RankingsPage extends StatelessWidget {
  final String? mode;
  const _RankingsPage({Key? key, this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingsCubit, RankingsState>(builder: (context, state){
      if(state is RankingsInitial){ // run Circular progress bar while rankings is loading
        context.read<RankingsCubit>().informInitial();
        context.read<RankingsCubit>().loadRankings(state.filter, state.filterFriendsValue, state.page, mode!);
        return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
            backgroundColor: my_colors.Palette.brown.shade100
        );
    };

      if(state is RankingsErrorState){ //// Throw error if state is RankingsError
        return ErrorPage(exceptionPageName: RankingsTabPage(), errorMessage: state.errorMessage);
      }
      if(state is RankingsLoadedState){ //// Reload rankings if state is RankingsReload (wheel page down)
        return RefreshIndicator(
          backgroundColor: my_colors.Palette.brown.shade100,
          child: Scaffold(
            backgroundColor: my_colors.Palette.brown.shade200,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  RankingsSearchByPageWidget(state.filter, state.filterFriendsValue, mode),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.rankingsList.length,
                    itemBuilder: (context, index){
                    return InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabPage(username: state.rankingsList[index].username))),
                      child: RankingsWidget(item: state.rankingsList[index])
                  );}
                ),
                ],
              ),
            ),
          ),
          onRefresh: () => context.read<RankingsCubit>().reloadRankings(state.filter, state.filterFriendsValue, state.page, mode),
        );
      }
      return Container();
    });
  }
}

