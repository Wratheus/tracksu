import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osu_track_app/src/widgets/user_cards/user_score_widget.dart';

import '../pages/cubit/user_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../pages/error_page.dart';
import '../widgets/user_cards/user_search_widget.dart';
import '../widgets/user_cards/user_widget.dart';

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
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: my_colors.Palette.hotPink, spreadRadius: 1)
                              ],
                              color: my_colors.Palette.brown.shade200),
                          alignment: Alignment.center,),
                        SizedBox(width: 10,),
                        Text("Best Performance",
                            style:TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo 2',
                          )
                        ),
                        SizedBox(height: 50,)
                      ],
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.scoresInstance.length,
                        itemBuilder: (context, index){
                        return InkWell(
                        onTap: () => {},
                        child: ScoreWidget(state.scoresInstance[index]));
                        })
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