import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../pages/user_page.dart';
import '../../models/rankings.dart';

part 'rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit() : super(RankingsInitial("all", false, "1"));

  Future<void> informInitial() async {
    print('RankingsPage loading');
  }

  Future<void> loadRankings(filter, filterFriendsValue, page) async {
    if (filterFriendsValue == true) {filter = "friends";};
    if (filterFriendsValue == false) {filter = "all";};
    try {
      emit(RankingsLoadedState(await getRankings(
          (await UserSecureStorage.getTokenFromStorage())!, page, filter),
          filter,
          filterFriendsValue,
          page));
      print('Rankings loaded');
    } catch (e) {
      emit(RankingsErrorState('Failed Rankings Load $e'));
    }
  }

  Future<void> reloadRankings(filter, filterFriendsValue, page) async {
    emit(RankingsInitial(filter, filterFriendsValue, page));
  }

  Future<void> loadUserFromRankings(String username, context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => UserPage(username: username)));
  }
}