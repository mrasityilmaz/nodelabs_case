import 'package:flutter/foundation.dart';
import 'package:vexana/vexana.dart';

@immutable
final class FormDataDTO extends INetworkModel<FormDataDTO> with IFormDataModel {
  FormDataDTO({this.file});
  final MultipartFile? file;

  @override
  FormDataDTO fromJson(Map<String, dynamic> json) {
    return FormDataDTO(file: json['file'] as MultipartFile?);
  }

  @override
  Map<String, dynamic>? toJson() {
    return {'file': file};
  }
}

@immutable
final class MultiFormDataDTO extends INetworkModel<MultiFormDataDTO> with IFormDataModel {
  MultiFormDataDTO({this.files});
  final List<MultipartFile>? files;

  @override
  MultiFormDataDTO fromJson(Map<String, dynamic> json) {
    return MultiFormDataDTO(files: json['files'] as List<MultipartFile>?);
  }

  @override
  Map<String, dynamic>? toJson() {
    return {'files': files};
  }
}
