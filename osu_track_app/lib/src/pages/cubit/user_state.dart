part of 'user_cubit.dart';


@immutable
abstract class UserState {}

class UserInitial extends UserState {

}

class UserLoadedState extends UserState {
  final User userInstance;
  final List<dynamic> scoresInstance;

  UserLoadedState(this.userInstance, this.scoresInstance);
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState(this.errorMessage);
}


