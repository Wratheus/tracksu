import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/cubit/user_cubit.dart';
import '../utils/color_contrasts.dart' as my_colors;
import '../pages/error_page.dart';
import '../widgets/user_cards/user_search_widget.dart';
import '../widgets/user_cards/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: const _UserPage(),
    );
  }
}

class _UserPage extends StatelessWidget {
  const _UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserInitial) {
        context.read<UserCubit>().informInitial();
        return RefreshIndicator(child:
          Scaffold(
            appBar: AppBar(
                backgroundColor: my_colors.Palette.pink,
                title: const Text("User statistics"),
                leading: Image.asset('assets/cloud_logo.png')),
            body: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserSearchWidget()
                      ]
                  ),
                ],
              ),
            ),
            backgroundColor: my_colors.Palette.brown,
          ),
            onRefresh: () => context.read<UserCubit>().reloadUser(),
          );
      }
      if (state is UserErrorState) { // Throw error if state is UserError
        return ErrorPage(exceptionPageName: UserPage());
      }
      if (state is UserLoadedState) { // Reload News if state is UserReload (wheel page down)
        return RefreshIndicator(child:
          Scaffold(
            appBar: AppBar(
                backgroundColor: my_colors.Palette.pink,
                title: const Text("User statistics"),
                leading: Image.asset('assets/cloud_logo.png')),
            body: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserSearchWidget()
                      ]
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 1)], color: my_colors.Palette.brown),
                    child: UserInfoWidget(state.userInstance),
                  ),
                ]
              ),
            ),
            backgroundColor: my_colors.Palette.brown,
          ),
            onRefresh: () => context.read<UserCubit>().reloadUser(),
          );
        }
      else return Container();
    });
  }
}