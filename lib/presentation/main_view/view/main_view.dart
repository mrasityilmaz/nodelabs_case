import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/domain/repositories/movie_repository.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/index.dart';
import 'package:nodelabs_movie_case/presentation/home_view/bloc/home_bloc.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_bloc.dart';

part 'widgets/bottom_nav_bar.dart';

@immutable
@RoutePage()
final class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileBloc(context.read<MovieRepository>(), context.read<UserBloc>())),
        BlocProvider(create: (context) => HomeBloc(context.read<MovieRepository>(), context.read<ProfileBloc>())),
      ],
      child: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          ProfileRoute(),
        ],
        homeIndex: 0,
        bottomNavigationBuilder: (context, tabsRouter) => _BottomNavBar(tabsRouter: tabsRouter),
      ),
    );
  }
}
