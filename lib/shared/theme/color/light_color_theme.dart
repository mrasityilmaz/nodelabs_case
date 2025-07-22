import 'package:flutter/material.dart';

@immutable
final class LightColorScheme extends ColorScheme {
  const LightColorScheme() : super.light();

  @override
  Color get primary => const Color(0xFFE50914);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  /// Background
  @override
  Color get surface => const Color(0xFFFEFEFE);

  @override
  Color get surfaceContainerLow => Colors.white.withOpacity(.2);

  /// Foreground
  @override
  Color get onSurface => const Color(0xFF090909);

  /// Containers & TextFields & Buttons & etc. Background
  @override
  Color get surfaceContainer => onSurface.withOpacity(.08);

  /// Containers & TextFields & Buttons & etc. Foreground
  @override
  Color get onSurfaceVariant => onSurface.withOpacity(.6);

  /// Containers & TextFields & Buttons & etc. Border & Divider
  @override
  Color get outline => onSurface.withOpacity(.15);
}
