import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracksu/src/pages/error_page.dart';

import '../pages/cubit/news_cubit.dart';
import '../utils/url_launch.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/news_widgets/news_widget.dart';

class LastNewsPage extends StatelessWidget {
  const LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: const _LastNewsPage(),
    );
  }
}

class _LastNewsPage extends StatelessWidget {
  const _LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state){
      if(state is NewsInitial){
      context.read<NewsCubit>().informInitial();
        context.read<NewsCubit>().loadNews(); // run Circular progress bar while news is loading
        return Scaffold(
            appBar: AppBar(
                backgroundColor: my_colors.Palette.purple,
                title: Text("News",
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
            ),
                backgroundColor: my_colors.Palette.brown.shade100,
                body: const Center(child: CircularProgressIndicator())
        );
      }
      if(state is NewsErrorState){ // Throw error if state is NewsError
        return ErrorPage(exceptionPageName: LastNewsPage(), errorMessage: state.errorMessage,);
      }
      if(state is NewsLoadedState){ // Reload News if state is NewsReload (wheel page down)
        return RefreshIndicator(
          backgroundColor: my_colors.Palette.brown.shade100,
          child:
          Scaffold(
              backgroundColor:my_colors.Palette.brown.shade200,
              body: Center(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      title: Text("News",
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
                          ListView.builder(
                              padding: EdgeInsets.all(0.0),
                              itemCount: state.newsList.length,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return InkWell(
                                    onTap: () => launchUniversalLink(Uri.parse(state.newsList[index].editURL!)),
                                    child: NewsWidget(item: state.newsList[index])
                                );}
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
            onRefresh: () => context.read<NewsCubit>().reloadNews(),
        );
      }
      return Container();
    });
  }
}


