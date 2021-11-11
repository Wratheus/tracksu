import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/pages/error_page.dart';

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
        return const Center(child: CircularProgressIndicator(backgroundColor: my_colors.Palette.brown),);
      }
      if(state is NewsErrorState){ // Throw error if state is NewsError
        return ErrorPage(exceptionPageName: LastNewsPage(), errorMessage: state.errorMessage,);
      }
      if(state is NewsLoadedState){ // Reload News if state is NewsReload (wheel page down)
        return RefreshIndicator(child:
            Scaffold(
              appBar: AppBar(backgroundColor: my_colors.Palette.purple,
                  title: const Text("Osu! News",
                    style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'Exo 2',
                    fontWeight: FontWeight.bold,
                  ),), leading: Image.asset('assets/utils/cloud_logo.png')),
              body: ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () => launchUniversalLink(state.newsList[index].editURL!),
                        child: newsWidget(item: state.newsList[index])
              );}
              ),
              backgroundColor: my_colors.Palette.brown.shade200,
            ),
            onRefresh: () => context.read<NewsCubit>().reloadNews(),
        );
      }
      return Container();
    });
  }
}
