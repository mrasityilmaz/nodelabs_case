import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_movie_case/config/api/api_paths.dart';
import 'package:nodelabs_movie_case/data/dtos/form_data_dto/form_data_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/raw_response_dto/raw_response_dto.dart';
import 'package:nodelabs_movie_case/data/dtos/user_dto/user_dto.dart';
import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';
import 'package:vexana/vexana.dart';

@immutable
final class LoginRequest extends BaseRequestModel<UserDTO> {
  LoginRequest({super.apiPath = ApiPaths.login, required this.email, required this.password})
      : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const UserDTO(),
          headers: apiPath.defaultHeaders,
          body: {
            "email": email,
            "password": password,
          },
        );

  final String email;
  final String password;
}

@immutable
final class UserProfileRequest extends BaseRequestModel<UserDTO> {
  UserProfileRequest({super.apiPath = ApiPaths.profile})
      : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const UserDTO(),
          headers: apiPath.defaultHeaders,
        );
}

@immutable
final class RegisterRequest extends BaseRequestModel<UserDTO> {
  RegisterRequest({
    super.apiPath = ApiPaths.register,
    required this.email,
    required this.name,
    required this.password,
  }) : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const UserDTO(),
          headers: apiPath.defaultHeaders,
          body: {
            "email": email,
            "name": name,
            "password": password,
          },
        );

  final String email;
  final String name;
  final String password;
}

@immutable
final class UpdateProfilePhotoRequest extends BaseRequestModel<RawResponseDTO> {
  UpdateProfilePhotoRequest({required this.photo, super.apiPath = ApiPaths.uploadPhoto})
      : super(
          path: apiPath.path,
          requestMethod: apiPath.requestType,
          parseModel: const RawResponseDTO(),
          headers: {
            ...apiPath.defaultHeaders,
            HttpHeaders.contentTypeHeader: ContentType.parse('multipart/form-data').toString(),
          },
          body: FormDataDTO(
            file: MultipartFile.fromFileSync(
              photo.path,
              filename: photo.name,
              contentType: DioMediaType.parse(photo.mimeType ?? 'image/jpeg'),
            ),
          ),
        );
  final XFile photo;
}


// @immutable
// final class RegisterRequest extends BaseRequestModel<RawResponseDTO> {
//   RegisterRequest({super.apiPath = ApiPaths.register})
//     : super(
//         path: apiPath.path,
//         requestMethod: apiPath.requestType,
//         parseModel: const RawResponseDTO(),
//         headers: apiPath.defaultHeaders,

//       );
// }



// //  login('$_user/login', requestType: RequestType.POST),

// //   register('$_user/register', requestType: RequestType.POST),

// //   profile('$_user/profile', requestType: RequestType.GET),

// //   uploadPhoto('$_user/upload_photo', requestType: RequestType.POST),
