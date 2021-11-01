import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/cubit/user_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../pages/error_page.dart';
import '../widgets/user_widgets/user_search_widget.dart';
import '../widgets/user_widgets/user_widget.dart';
import '../widgets/user_widgets/user_score_list.dart';

class UserPage extends StatelessWidget {
  final String? username;
  const UserPage({Key? key, this.username}) :super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocProvider(
          create: (_) => UserCubit(),
          child: new _UserPage(username: username),);
    }
  }

class _UserPage extends StatelessWidget {
  final String? username;
  const _UserPage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {

        if (state is UserInitial) {
          if (username != null) {
            context.read<UserCubit>().loadUser(username!);
          }
            context.read<UserCubit>().informInitial();
            return RefreshIndicator(child:
              Scaffold(
                appBar: AppBar(
                    backgroundColor: my_colors.Palette.purple,
                    title: const Text("User statistics!",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'Exo 2',
                        fontWeight: FontWeight.bold,
                      ),),
                    leading: Image.asset('assets/utils/cloud_logo.png')),
                body: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UserSearchWidget() // search bar widget
                          ]
                      ),
                    ],
                  ),
                ),
                backgroundColor: my_colors.Palette.brown.shade100,
              ),
                onRefresh: () => context.read<UserCubit>().reloadUser(),
              );
            }
        if (state is UserErrorState) { // Throw error if state is UserError
          return ErrorPage(
              exceptionPageName: UserPage(), errorMessage: state.errorMessage);
        }
        if (state is UserLoadedState) {// Reload News if state is UserReload (wheel page down)
          return RefreshIndicator(child:
            Scaffold(
              backgroundColor: my_colors.Palette.brown.shade100,
              appBar: AppBar(
                  backgroundColor: my_colors.Palette.purple,
                  title: Text(state.userInstance.username,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.bold,
                    ),),
                  leading: Image.asset('assets/utils/cloud_logo.png')),
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      UserInfoWidget(context, state.userInstance),
                      UserBestScoresList(state.userBestScoresInstance, context),
                      UserFirstScoresList(state.userFirstScoresInstance, context),
                    ],
                  ),
                ), //user panel Info widget and searchbar
              ),
            ),
              onRefresh: () => context.read<UserCubit>().reloadUser(),
          );
        }
        else
          return Container();
      }
    );
  }
}