import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../models/user.dart';
import '../beatmap_page.dart';
import '../../models/scores.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super(UserInitial());

  Future<void> informInitial() async {
    print('UserPage loaded');
  }

  Future<void> loadUser(String username) async {
    try {
      emit(UserLoadingState());
      final user = await getUser((await UserSecureStorage.getTokenFromStorage())!, username);
      final userBestScores = await getUserScore((await UserSecureStorage.getTokenFromStorage())!, username, '100', '0', 'best');
      final userFirstScores = await getUserScore((await UserSecureStorage.getTokenFromStorage())!, username, '100', '0', 'firsts');
      emit(UserLoadedState(user, userBestScores, userFirstScores));
      print('User $username loaded');
    } catch (e){
      emit(UserErrorState('Failed User Load $e'));
    }
  }

  Future<void> loadUserMe() async {
    try {
      emit(UserLoadingState());
      final user = await getUserMe((await UserSecureStorage.getTokenFromStorage())!);
      final userBestScores = await getUserScore((await UserSecureStorage.getTokenFromStorage())!, user.username, '100', '0', 'best');
      final userFirstScores = await getUserScore((await UserSecureStorage.getTokenFromStorage())!, user.username, '100', '0', 'firsts');
      emit(UserLoadedState(user, userBestScores, userFirstScores));
      print('User ME(${user.username}) loaded');
    } catch (e){
      emit(UserErrorState('Failed User Load $e'));
    }
  }

  Future<void> reloadUser() async {
    emit(UserInitial());
  }

  Future<void> loadUserFromRankings(Scores item,
      BuildContext context) async {
    print(item);
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => BeatmapPage(item: item)));
  }
}