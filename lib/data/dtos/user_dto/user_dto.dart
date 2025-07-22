import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';

part 'user_dto.mapper.dart';

@immutable
@MappableClass()
class UserDTO extends INetworkModel<UserDTO> with UserDTOMappable {
  const UserDTO({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.token,
  });

  final String? id;
  final String? name;
  final String? email;
  @MappableField(key: 'photoUrl')
  final String? photoUrl;
  final String? token;

  static const fromJsonString = UserDTOMapper.fromJsonString;
  static const fromJsonStatic = UserDTOMapper.fromJson;

  @override
  UserDTO fromJson(Map<String, dynamic> json) {
    return UserDTOMapper.fromJson(json);
  }
}
