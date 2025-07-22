import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nodelabs_movie_case/bloc/theme_bloc/theme_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/config/router/router_observer.dart';
import 'package:nodelabs_movie_case/core/contants/locales.dart';
import 'package:nodelabs_movie_case/di/dependency_inj.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/main_initializer.dart';
import 'package:nodelabs_movie_case/presentation/core/wrappers/auto_logout_wrapper.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await MainInitializer.initialize();
      runApp(
        const DependencyInjectionWrapper(child: MovieCaseApp()),
      );
    },
    MainInitializer.onErrorZone,
  );
}

@immutable
final class MovieCaseApp extends StatelessWidget {
  const MovieCaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: BlocBuilder<UserBloc, UserState>(
        bloc: context.read<UserBloc>(),
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            bloc: context.read<ThemeBloc>(),
            builder: (context, state) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: state.themeData.data,
              darkTheme: state.themeData.data,
              themeMode: state.themeMode,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Locales.values.map((e) => e.locale).toList(),
              routerConfig: context.read<AppRouter>().config(
                    navigatorObservers: () => [context.read<AppRouterObserver>()],
                  ),
              builder: (context, child) {
                return AutoLogoutWrapper(child: child ?? const SizedBox.shrink());
              },
            ),
          );
        },
      ),
    );
  }
}
