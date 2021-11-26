import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../pages/user_page.dart';
import '../../models/rankings.dart';

part 'rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit() : super(RankingsInitial());

  Future<void> informInitial() async {
    print('RankingsPage loading');
  }

  Future<void> loadRankings(page) async {
    try {
      emit(RankingsLoadedState(await getRankings(
          (await UserSecureStorage.getTokenFromStorage())!, page))); // request news
      print('Rankings loaded');
    } catch (e) {
      emit(RankingsErrorState('Failed Rankings Load $e'));
    }
  }

  Future<void> reloadRankings() async {
    emit(RankingsInitial());
  }

  Future<void> loadUserFromRankings(String username, context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => UserPage(username: username)));
  }
}