import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';
import 'package:nodelabs_movie_case/shared/theme/color/dark_color_theme.dart';
import 'package:nodelabs_movie_case/shared/theme/color/light_color_theme.dart';
import 'package:nodelabs_movie_case/shared/theme/extensions/button_styles/button_style_extension.dart';
import 'package:nodelabs_movie_case/shared/theme/text/dart_text_theme.dart';
import 'package:nodelabs_movie_case/shared/theme/text/light_text_theme.dart';

part 'extensions/button_styles/button_style_factory.dart';

@immutable
final class AppDarkTheme extends Theme {
  AppDarkTheme({super.key})
      : super(
          data: ThemeData(
            colorScheme: _colorScheme,
            scaffoldBackgroundColor: _colorScheme.surface,
            textTheme: _textTheme,
            useMaterial3: true,
            extensions: [
              _appButtonStyles,
            ],
          ),
          child: const SizedBox(),
        );

  static const _colorScheme = DarkColorScheme();
  static const _textTheme = DarkTextTheme();
  static final _appButtonStyles = _createAppButtonStyles(_colorScheme, _textTheme);
}

@immutable
final class AppLightTheme extends Theme {
  AppLightTheme({super.key})
      : super(
          data: ThemeData(
            colorScheme: _colorScheme,
            scaffoldBackgroundColor: _colorScheme.surface,
            textTheme: _textTheme,
            useMaterial3: true,
            extensions: [
              _appButtonStyles,
            ],
          ),
          child: const SizedBox(),
        );
  static const _colorScheme = LightColorScheme();
  static const _textTheme = LightTextTheme();
  static final _appButtonStyles = _createAppButtonStyles(_colorScheme, _textTheme);
}
