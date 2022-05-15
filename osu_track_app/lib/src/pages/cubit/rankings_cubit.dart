import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/country.dart';
import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../models/rankings.dart';

part 'rankings_state.dart';

class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit() : super(RankingsInitial("all", "default", "1", null));

  Future<void> informInitial() async {
    print('RankingsPage loading');
  }

  Future<void> loadRankings(Country? countryValue, String filter, String filterValue, String page, String? mode) async {
    if (filterValue == "friends") {filter = "friends";};
    if (filterValue == "default") {filter = "all";};
    try {
      if (isClosed == false) {
        emit(RankingsLoadedState(
            await getRankings((await UserSecureStorage.getTokenFromStorage())!, page, filter, mode, countryValue),
            filter,
            filterValue,
            page,
            countryValue,
            await generateCountriesList())
        );
      }
      print('Rankings loaded');
    } catch (e) {
      if (isClosed == false) {
        emit(RankingsErrorState('Failed Rankings Load $e'));
      }
    }
  }

  Future<void> reloadRankings(String filter, String filterFriendsValue, page, String mode, Country? country) async {
    if (isClosed == false) {
      emit(RankingsInitial(filter, filterFriendsValue, page, country));
    }
  }

}