part of 'rankings_cubit.dart';

@immutable
abstract class RankingsState {}

class RankingsInitial extends RankingsState {
  final String filter;
  final String filterValue;
  final String page;

  RankingsInitial(this.filter, this.filterValue, this.page);
}

class RankingsLoadedState extends RankingsState {
  final List<Rankings> rankingsList;
  final String filter;
  final String filterValue;
  final String page;
  RankingsLoadedState(this.rankingsList, this.filter, this.filterValue, this.page);
}

class RankingsErrorState extends RankingsState {
  final String errorMessage;

  RankingsErrorState(this.errorMessage);
}
