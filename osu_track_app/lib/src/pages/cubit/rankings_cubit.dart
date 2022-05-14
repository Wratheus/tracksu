import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../models/rankings.dart';

part 'rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit() : super(RankingsInitial("all", "default", "1"));

  Future<void> informInitial() async {
    print('RankingsPage loading');
  }

  Future<void> loadRankings(filter, filterValue, page, mode) async {
    if (filterValue == "friends") {filter = "friends";};
    if (filterValue == "default") {filter = "all";};
    try {
      if (isClosed == false) {
        emit(RankingsLoadedState(
            await getRankings((await UserSecureStorage.getTokenFromStorage())!,
                page, filter, mode),
            filter,
            filterValue,
            page));
      }
      print('Rankings loaded');
    } catch (e) {
      if (isClosed == false) {
        emit(RankingsErrorState('Failed Rankings Load $e'));
      }
    }
  }

  Future<void> reloadRankings(filter, filterFriendsValue, page, mode) async {
    if (isClosed == false) {
      emit(RankingsInitial(filter, filterFriendsValue, page));
    }
  }

}