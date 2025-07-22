import 'package:flutter/material.dart';

///
/// App Buttons Styles
@immutable
class AppButtonStyles extends ThemeExtension<AppButtonStyles> {
  const AppButtonStyles({
    required this.textPrimaryFilledStyle,
    required this.textSecondaryOutlinedStyle,
    required this.iconTextPrimaryFilledStyle,
    required this.iconTextSecondaryOutlinedStyle,
    required this.iconSquarePrimaryFilledStyle,
    required this.iconSquareSecondaryOutlinedStyle,
    required this.iconActionStyle,
    required this.destructiveTextOutlinedStyle,
    required this.miniTransparentStyle,
  });

  //
  // MARK: --- Button Styles ---
  //

  /// {@macro AppButtonStyles.textPrimaryFilledStyle}
  final ButtonStyle textPrimaryFilledStyle;

  /// {@macro AppButtonStyles.textSecondaryOutlinedStyle}
  final ButtonStyle textSecondaryOutlinedStyle;

  /// {@macro AppButtonStyles.iconTextPrimaryFilledStyle}
  final ButtonStyle iconTextPrimaryFilledStyle;

  /// {@macro AppButtonStyles.iconTextSecondaryOutlinedStyle}
  final ButtonStyle iconTextSecondaryOutlinedStyle;

  /// {@macro AppButtonStyles.iconSquarePrimaryFilledStyle}
  final ButtonStyle iconSquarePrimaryFilledStyle;

  /// {@macro AppButtonStyles.iconSquareSecondaryOutlinedStyle}
  final ButtonStyle iconSquareSecondaryOutlinedStyle;

  /// {@macro AppButtonStyles.iconActionStyle}
  final ButtonStyle iconActionStyle;

  /// {@macro AppButtonStyles.destructiveTextOutlinedStyle}
  final ButtonStyle destructiveTextOutlinedStyle;

  /// {@macro AppButtonStyles.miniTransparentStyle}
  final ButtonStyle miniTransparentStyle;

  //
  // MARK:  --- Standard ThemeExtension Methods ---
  //

  @override
  AppButtonStyles copyWith({
    ButtonStyle? textPrimaryFilledStyle,
    ButtonStyle? textSecondaryOutlinedStyle,
    ButtonStyle? iconTextPrimaryFilledStyle,
    ButtonStyle? iconTextSecondaryOutlinedStyle,
    ButtonStyle? iconSquarePrimaryFilledStyle,
    ButtonStyle? iconSquareSecondaryOutlinedStyle,
    ButtonStyle? iconSquareTertiaryOutlinedStyle,
    ButtonStyle? iconActionStyle,
    ButtonStyle? destructiveTextOutlinedStyle,
    ButtonStyle? miniTransparentStyle,
  }) {
    return AppButtonStyles(
      textPrimaryFilledStyle: textPrimaryFilledStyle ?? this.textPrimaryFilledStyle,
      textSecondaryOutlinedStyle: textSecondaryOutlinedStyle ?? this.textSecondaryOutlinedStyle,
      iconTextPrimaryFilledStyle: iconTextPrimaryFilledStyle ?? this.iconTextPrimaryFilledStyle,
      iconTextSecondaryOutlinedStyle: iconTextSecondaryOutlinedStyle ?? this.iconTextSecondaryOutlinedStyle,
      iconSquarePrimaryFilledStyle: iconSquarePrimaryFilledStyle ?? this.iconSquarePrimaryFilledStyle,
      iconSquareSecondaryOutlinedStyle: iconSquareSecondaryOutlinedStyle ?? this.iconSquareSecondaryOutlinedStyle,
      iconActionStyle: iconActionStyle ?? this.iconActionStyle,
      destructiveTextOutlinedStyle: destructiveTextOutlinedStyle ?? this.destructiveTextOutlinedStyle,
      miniTransparentStyle: miniTransparentStyle ?? this.miniTransparentStyle,
    );
  }

  @override
  AppButtonStyles lerp(ThemeExtension<AppButtonStyles>? other, double t) {
    if (other is! AppButtonStyles) {
      return this;
    }
    return AppButtonStyles(
      textPrimaryFilledStyle: ButtonStyle.lerp(textPrimaryFilledStyle, other.textPrimaryFilledStyle, t)!,
      textSecondaryOutlinedStyle: ButtonStyle.lerp(textSecondaryOutlinedStyle, other.textSecondaryOutlinedStyle, t)!,
      iconTextPrimaryFilledStyle: ButtonStyle.lerp(iconTextPrimaryFilledStyle, other.iconTextPrimaryFilledStyle, t)!,
      iconTextSecondaryOutlinedStyle:
          ButtonStyle.lerp(iconTextSecondaryOutlinedStyle, other.iconTextSecondaryOutlinedStyle, t)!,
      iconSquarePrimaryFilledStyle:
          ButtonStyle.lerp(iconSquarePrimaryFilledStyle, other.iconSquarePrimaryFilledStyle, t)!,
      iconSquareSecondaryOutlinedStyle:
          ButtonStyle.lerp(iconSquareSecondaryOutlinedStyle, other.iconSquareSecondaryOutlinedStyle, t)!,
      iconActionStyle: ButtonStyle.lerp(iconActionStyle, other.iconActionStyle, t)!,
      destructiveTextOutlinedStyle:
          ButtonStyle.lerp(destructiveTextOutlinedStyle, other.destructiveTextOutlinedStyle, t)!,
      miniTransparentStyle: ButtonStyle.lerp(miniTransparentStyle, other.miniTransparentStyle, t)!,
    );
  }

  @override
  int get hashCode => Object.hash(
        textPrimaryFilledStyle,
        textSecondaryOutlinedStyle,
        iconTextPrimaryFilledStyle,
        iconTextSecondaryOutlinedStyle,
        iconSquarePrimaryFilledStyle,
        iconSquareSecondaryOutlinedStyle,
        iconActionStyle,
        destructiveTextOutlinedStyle,
        miniTransparentStyle,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppButtonStyles &&
        other.textPrimaryFilledStyle == textPrimaryFilledStyle &&
        other.textSecondaryOutlinedStyle == textSecondaryOutlinedStyle &&
        other.iconTextPrimaryFilledStyle == iconTextPrimaryFilledStyle &&
        other.iconTextSecondaryOutlinedStyle == iconTextSecondaryOutlinedStyle &&
        other.iconSquarePrimaryFilledStyle == iconSquarePrimaryFilledStyle &&
        other.iconSquareSecondaryOutlinedStyle == iconSquareSecondaryOutlinedStyle &&
        other.iconActionStyle == iconActionStyle &&
        other.destructiveTextOutlinedStyle == destructiveTextOutlinedStyle &&
        other.miniTransparentStyle == miniTransparentStyle;
  }
}
