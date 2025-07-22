import 'package:flutter/material.dart';

/// {@template LightTextTheme}
/// **Light Text Theme**
/// ```dart
/// displayLarge: const TextStyle(fontSize: 36),
/// displayMedium: const TextStyle(fontSize: 32),
/// displaySmall: const TextStyle(fontSize: 28),
/// headlineLarge: const TextStyle(fontSize: 24),
/// headlineMedium: const TextStyle(fontSize: 20),
/// headlineSmall: const TextStyle(fontSize: 18),
/// titleLarge: const TextStyle(fontSize: 22),
/// titleMedium: const TextStyle(fontSize: 18),
/// titleSmall: const TextStyle(fontSize: 16),
/// bodyLarge: const TextStyle(fontSize: 16),
/// bodyMedium: const TextStyle(fontSize: 15),
/// bodySmall: const TextStyle(fontSize: 13),
/// labelLarge: const TextStyle(fontSize: 15),
/// labelMedium: const TextStyle(fontSize: 14),
/// labelSmall: const TextStyle(fontSize: 12),
/// ```
/// {@endtemplate}
@immutable
final class LightTextTheme extends TextTheme {
  const LightTextTheme()
      : super(
          displayLarge: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 36),
          displayMedium: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 32),
          displaySmall: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 28),
          headlineLarge: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 24),
          headlineMedium: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 20),
          headlineSmall: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 18),
          titleLarge: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 22),
          titleMedium: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 18),
          titleSmall: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 16),
          bodyLarge: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 16),
          bodyMedium: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 15),
          bodySmall: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 13),
          labelLarge: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 15),
          labelMedium: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 14),
          labelSmall: const TextStyle(fontFamily: 'Euclid Circular A', fontSize: 12),
        );
}
