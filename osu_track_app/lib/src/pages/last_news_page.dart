import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/pages/cubit/news_cubit.dart';
import '/src/utils/url_launch.dart';
import '../utils/load_news_image.dart';
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
      if(state is NewsInitial){ // run Circular progress bar while news is loading state is newsInitial
        context.read<NewsCubit>().loadNews();
        return const Center(child: CircularProgressIndicator(backgroundColor: my_colors.Palette.brown),);
      }
      if(state is NewsErrorState){ // Throw error if state is NewsError
        return Center(
          child: Scaffold(
              body: Text(state.errorMessage, textAlign: TextAlign.center, style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Exo 2'),),
            bottomNavigationBar: Image.asset('assets/error.jpg'),
        ),
        );
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

  Widget listBuilder(BuildContext context, NewsLoadedState state){ // News page appearance constructor
    return Scaffold(
      appBar: AppBar(backgroundColor: my_colors.Palette.pink,
        title: const Text("Osu News!"), leading: Image.asset('assets/cloud_logo.png'),
      ),
      body: ListView.builder(
        itemCount: state.newsList.length,
        itemBuilder: (BuildContext context, int index) { // select one by one element from the List of News-objects from GetNewsRequest()
          final item = state.newsList[index];
          return ListTile(
            title: Text(item.title!, // News.title
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'Exo 2'),
              maxLines: 20,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            tileColor: my_colors.Palette.brown,
            trailing: const Icon(Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 20,),
            contentPadding: const EdgeInsets.all(5),
            onTap: () => launchUniversalLink(item.editURL!), // News.editURL
            leading: ImageNewsWidget(urlImage: item.firstImage!)
          );
        })
    );
  }

}
