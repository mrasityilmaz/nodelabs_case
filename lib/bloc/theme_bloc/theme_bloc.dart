import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/shared/theme/app_theme.dart';

enum ThemeEvent { toggleDark, toggleLight }

class ThemeState extends Equatable {
  const ThemeState(this.themeData);
  final Theme themeData;

  static ThemeState get darkTheme => ThemeState(AppDarkTheme());

  static ThemeState get lightTheme => ThemeState(AppLightTheme());

  bool get isDark => themeData.data.brightness == Brightness.dark;

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  @override
  List<Object?> get props => [themeData];
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.darkTheme) {
    on<ThemeEvent>((event, emit) {
      switch (event) {
        case ThemeEvent.toggleDark:
          emit(ThemeState.darkTheme);
        case ThemeEvent.toggleLight:
          emit(ThemeState.lightTheme);
      }
    });
  }
}
