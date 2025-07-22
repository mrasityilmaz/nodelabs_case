import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';

@immutable
final class AutoLogoutWrapper extends StatelessWidget implements AutoRouteWrapper {
  const AutoLogoutWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      bloc: context.read<UserBloc>(),
      listener: (context, state) {
        // Logout tamamlandığında LoginRoute'a git
        if (!state.isLoading && !state.isAuthenticated && !state.hasError) {
          context.read<AppRouter>().pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        }
      },
      child: child,
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return build(context);
  }
}
