import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';

part 'rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit() : super(RankingsInitial());

  Future<void> loadRankings() async {
    try {
      emit(RankingsLoadedState(await getRankings(
          (await UserSecureStorage.getTokenFromStorage())!))); // request news
    } catch (e) {
      emit(RankingsErrorState('Failed Rankings Load'));
    }
  }

  Future<void> reloadRankings() async {
    emit(RankingsInitial());
  }
}

