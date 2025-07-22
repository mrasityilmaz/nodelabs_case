import 'package:flutter/foundation.dart';
import 'package:vexana/vexana.dart';

@immutable
class ListResultDTO<T extends INetworkModel<T>> extends INetworkModel<ListResultDTO<T>> {
  const ListResultDTO({
    required this.data,
    this.itemFromJson,
  });

  final List<T> data;
  final T Function(Map<String, dynamic>)? itemFromJson;

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }

  @override
  ListResultDTO<T> fromJson(Map<String, dynamic> json) {
    final jsonData = json['data'] as List?;

    // Eğer data boş ise itemFromJson'a ihtiyaç yok
    if (jsonData == null || jsonData.isEmpty) {
      return ListResultDTO<T>(
        data: const [],
        itemFromJson: itemFromJson,
      );
    }

    // Data var ama itemFromJson yok ise hata fırlat
    if (itemFromJson == null) {
      throw ArgumentError('itemFromJson factory function must be provided when data is not empty');
    }

    return ListResultDTO<T>(
      data: jsonData.map((e) => itemFromJson!(e as Map<String, dynamic>)).toList(),
      itemFromJson: itemFromJson,
    );
  }
}
