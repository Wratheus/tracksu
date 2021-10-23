import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../requests/requests.dart';
import '../../utils/secure_storage.dart';
import '../../objects/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super(UserInitial());

  Future<void> informInitial() async {
    print('UserPage loaded');
  }

  Future<void> loadUser(String username) async {
    try {
      emit(UserLoadedState(await getUser((await UserSecureStorage.getTokenFromStorage())!, username)));
      print('User loaded');
    }catch (e){
      emit(UserErrorState('Failed User Load'));
    }
  }

  Future<void> reloadUser() async {
    emit(UserInitial());
  }

}