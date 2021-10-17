import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());


  Future<void> loadNews() async {
    try{
      emit(NewsLoadedState(await getNews((await UserSecureStorage.getTokenFromStorage())!))); // request news
    }catch (e){
      emit(NewsErrorState('Failed News Load'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }

}
