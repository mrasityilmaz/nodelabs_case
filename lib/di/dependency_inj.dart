import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nodelabs_movie_case/bloc/theme_bloc/theme_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/config/router/router_observer.dart';
import 'package:nodelabs_movie_case/config/router/splash_guard.dart';
import 'package:nodelabs_movie_case/data/repositories/movie_repository_impl.dart';
import 'package:nodelabs_movie_case/data/repositories/user_repository_impl.dart';
import 'package:nodelabs_movie_case/domain/repositories/movie_repository.dart';
import 'package:nodelabs_movie_case/domain/repositories/user_repository.dart';
import 'package:nodelabs_movie_case/services/network_manager/network_manager.dart';
import 'package:nodelabs_movie_case/services/token_service.dart';
import 'package:provider/provider.dart';

@immutable
final class DependencyInjectionWrapper extends StatelessWidget {
  const DependencyInjectionWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlutterSecureStorage>(
          create: (_) => const FlutterSecureStorage(),
        ),
        ProxyProvider<FlutterSecureStorage, TokenService>(
          update: (_, secureStorage, previous) => previous ?? TokenService.create(secureStorage),
        ),
        ProxyProvider<TokenService, NetworkService>(
          dispose: (_, networkService) => networkService.close(force: true),
          update: (_, tokenService, previous) => previous ?? NetworkService.create(tokenService),
          lazy: true,
        ),
        ProxyProvider<NetworkService, UserRemoteDataSource>(
          update: (_, networkService, previous) => previous ?? UserRemoteDataSourceImpl(networkService),
          lazy: true,
        ),
        ProxyProvider<UserRemoteDataSource, UserRepository>(
          update: (_, dataSource, previous) => previous ?? UserRepositoryImpl(dataSource),
          lazy: true,
        ),
        ProxyProvider<NetworkService, MovieRemoteDataSource>(
          update: (_, networkService, previous) => previous ?? MovieRemoteDataSourceImpl(networkService),
          lazy: true,
        ),
        ProxyProvider<MovieRemoteDataSource, MovieRepository>(
          update: (_, dataSource, previous) => previous ?? MovieRepositoryImpl(dataSource),
          lazy: true,
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc.create(
            context.read<UserRepository>(),
            context.read<TokenService>(),
          ),
        ),
        Provider<AppRouterObserver>(
          create: (_) => AppRouterObserver.create(),
          lazy: true,
        ),
        ProxyProvider<UserBloc, SplashGuard>(
          update: (_, userBloc, previous) => previous ?? SplashGuard(userBloc),
          lazy: true,
        ),
        ListenableProxyProvider<SplashGuard, AppRouter>(
          update: (_, splashGuard, previous) => previous ?? AppRouter.create(splashGuard),
          lazy: true,
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: child,
    );
  }
}
