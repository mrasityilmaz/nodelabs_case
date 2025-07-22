import 'package:flutter/material.dart';

@immutable
final class DarkColorScheme extends ColorScheme {
  const DarkColorScheme() : super.dark();

  @override
  Color get primary => const Color(0xFFE50914);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  /// Background
  @override
  Color get surface => const Color(0xFF090909);

  @override
  Color get surfaceContainerLow => Colors.black.withOpacity(.2);

  /// Foreground
  @override
  Color get onSurface => const Color(0xFFFFFFFF);

  /// Containers & TextFields & Buttons & etc. Background
  @override
  Color get surfaceContainer => onSurface.withOpacity(.1);

  /// Containers & TextFields & Buttons & etc. Foreground
  @override
  Color get onSurfaceVariant => onSurface.withOpacity(.5);

  /// Containers & TextFields & Buttons & etc. Border & Divider
  @override
  Color get outline => onSurface.withOpacity(.2);
}
