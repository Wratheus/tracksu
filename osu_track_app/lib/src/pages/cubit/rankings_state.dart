part of 'rankings_cubit.dart';

@immutable
abstract class RankingsState {}

class RankingsInitial extends RankingsState {}

class RankingsLoadedState extends RankingsState {
  final List<Rankings> rankingsList;

  RankingsLoadedState(this.rankingsList);
}

class RankingsErrorState extends RankingsState {
  final String errorMessage;

  RankingsErrorState(this.errorMessage);
}
