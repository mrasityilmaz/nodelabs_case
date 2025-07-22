import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';

/// This hook is used to ignore fields in the JSON.
///
/// This is useful when you want to ignore fields in the JSON that you don't want to be mapped.
///
/// For example, you can use this hook to ignore the `id` field in the JSON.
///
/// ```dart
/// @MappableClass(hooks: [IgnoreFieldHook(['id'])])
/// class Product {
///   final String id;
///   final String name;
/// }
/// ```
///
/// This will ignore the `id` field in the JSON.
///
/// Output:
/// ```json
/// {
///   "name": "Product"
/// }
/// ```
///
@immutable
final class IgnoreFieldHook extends MappingHook {
  const IgnoreFieldHook(this.fields);
  final List<String> fields;

  @override
  Object? afterEncode(Object? value) {
    if (value is Map<String, dynamic>) {
      for (final field in fields) {
        if (value.containsKey(field)) {
          value.remove(field);
        }
      }
    }
    return value;
  }
}
