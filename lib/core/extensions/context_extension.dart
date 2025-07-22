import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/shared/theme/extensions/button_styles/button_style_extension.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => MediaQuery.sizeOf(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// {@macro LightTextTheme}
  /// {@macro DarkTextTheme}
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppButtonStyles get buttonStyles => theme.extension<AppButtonStyles>()!;
}
