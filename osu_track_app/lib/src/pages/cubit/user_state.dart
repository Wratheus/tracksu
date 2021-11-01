part of 'user_cubit.dart';


@immutable
abstract class UserState {}

class UserInitial extends UserState {

}

class UserLoadedState extends UserState {
  final User userInstance;
  final List<dynamic> userBestScoresInstance;
  final List<dynamic> userFirstScoresInstance;

  UserLoadedState(this.userInstance, this.userBestScoresInstance, this.userFirstScoresInstance);
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState(this.errorMessage);
}


