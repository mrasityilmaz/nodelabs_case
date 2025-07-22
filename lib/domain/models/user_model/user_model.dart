import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/data/dtos/user_dto/user_dto.dart';

@immutable
final class UserModel extends UserDTO {
  const UserModel({
    super.id,
    super.name,
    super.email,
    super.photoUrl,
    super.token,
  });

  factory UserModel.fromDTO(UserDTO dto) {
    return UserModel(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      photoUrl: dto.photoUrl,
      token: dto.token,
    );
  }
}
