part of 'beatmap_cubit.dart';


@immutable
abstract class BeatmapState {}

class BeatmapInitial extends BeatmapState {

}

class BeatmapLoadedState extends BeatmapState {
  final User mapperInstance;
  final Beatmap beatmapInstance;
  final List<BeatmapScore> beatmapLeaderboard;
  final bool isPlay;

  BeatmapLoadedState(this.beatmapInstance, this.beatmapLeaderboard, this.mapperInstance, this.isPlay);
}

class BeatmapErrorState extends BeatmapState {
  final String errorMessage;

  BeatmapErrorState(this.errorMessage);
}


