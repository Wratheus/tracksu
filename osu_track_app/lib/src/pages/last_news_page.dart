import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/pages/error_page.dart';

import '/src/pages/cubit/news_cubit.dart';
import '/src/utils/url_launch.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../widgets/news_cards/news_widget.dart';

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
        return const Center(child: CircularProgressIndicator(backgroundColor: my_colors.Palette.brown),);
      }
      if(state is NewsErrorState){ // Throw error if state is NewsError
        return ErrorPage(exceptionPageName: LastNewsPage());
      }
      if(state is NewsLoadedState){ // Reload News if state is NewsReload (wheel page down)
        return RefreshIndicator(child:
            Scaffold(
              appBar: AppBar(backgroundColor: my_colors.Palette.pink,
                  title: const Text("Osu News!"), leading: Image.asset('assets/cloud_logo.png')),
              body: ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () => launchUniversalLink(state.newsList[index].editURL!),
                        child: newsWidget(state.newsList[index], context, state)
              );}
              ),
              backgroundColor: my_colors.Palette.brown,
            ),
            onRefresh: () => context.read<NewsCubit>().reloadNews(),
        );
      }
      return Container();
    });
  }
}
