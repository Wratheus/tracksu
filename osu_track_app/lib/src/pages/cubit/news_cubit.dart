import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../requests/requests.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());


  Future<void> loadNews() async {
    try{
      Map<String, dynamic> token = await getTokenAsOwner(); // receive news object
      print(token['access_token']);
      var currenNews = await getNews(token['access_token']); // request news
      print(currenNews);
      emit(NewsLoadedState(currenNews)); // activate newsLoaded state
    }catch (e){
      emit(NewsErrorState('Failed News Load'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }

}
