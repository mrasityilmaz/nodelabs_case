import 'package:flutter/material.dart';

@immutable
final class SizeConstants {
  const SizeConstants._();

  /// Value: 4
  static const double tiny = 4;

  /// Value: 8
  static const double low = 8;

  /// Value: 16
  static const double normal = low * 2;

  /// Value: 24
  static const double medium = low * 3;

  /// Value: 32
  static const double high = low * 4;

  /// App Button Height
  /// Value: 54
  static const double projectButtonHeight = 54;

  static const Size projectSquareBigButtonSize = Size.square(60);
}
