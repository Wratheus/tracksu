import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/beatmap_score.dart';
import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../models/beatmap.dart';
import '../../models/user.dart';

part 'beatmap_state.dart';

class BeatmapCubit extends Cubit<BeatmapState> {

  BeatmapCubit() : super(BeatmapInitial());

  Future<void> informInitial() async {
    print('BeatmapPage loaded');
  }

  Future<void> loadBeatmap(int? itemBeatmapId, String? itemBeatmapName, String? itemMapperName) async {
    print("in LoadBeatmap : ${itemBeatmapId}");
    print("in LoadBeatmap : ${itemBeatmapName}");
    print("in LoadBeatmap : ${itemMapperName}");
    try {
      if (isClosed == false) {
        emit(BeatmapLoadedState(
            await getBeatmap((await UserSecureStorage.getTokenFromStorage())!,
                "${itemBeatmapId}"),
            await getBeatmapScores(
                (await UserSecureStorage.getTokenFromStorage())!,
                "${itemBeatmapId}"),
            await getUser((await UserSecureStorage.getTokenFromStorage())!,
                "${itemMapperName}", 'osu')));
      }
      print('beatmap $itemBeatmapName loaded');
    } catch (e) {
      if (isClosed == false) {
        emit(BeatmapErrorState('Failed Beatmap Load $e'));
      }
    }
  }
  Future<void> reloadBeatmap() async {
    if (isClosed == false) {
      emit(BeatmapInitial());
    }
  }
}