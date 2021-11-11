import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../models/beatmap.dart';

part 'beatmap_state.dart';

class BeatmapCubit extends Cubit<BeatmapState> {

  BeatmapCubit() : super(BeatmapInitial());

  Future<void> informInitial() async {
    print('BeatmapPage loaded');
  }

  Future<void> loadBeatmap(int? itemBeatmapId, String? itemBeatmapName) async {
    print("in LoadBeatmap : ${itemBeatmapId}");
    print("in LoadBeatmap : ${itemBeatmapName}");
    try {
      emit(BeatmapLoadedState(
          await getBeatmap((await UserSecureStorage.getTokenFromStorage())!, "${itemBeatmapId}"),
          await getBeatmapScores((await UserSecureStorage.getTokenFromStorage())!, "${itemBeatmapId}")));
      print('beatmap $itemBeatmapName loaded');
    }catch (e){
      emit(BeatmapErrorState('Failed Beatmap Load $e'));
    }
  }

  Future<void> reloadBeatmap() async {
    emit(BeatmapInitial());
  }
}