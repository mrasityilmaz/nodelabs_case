import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
final class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage(ImagePickSizeEnum pickSize) async {
    return _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: pickSize.quality,
      maxHeight: pickSize.height,
      maxWidth: pickSize.width,
      requestFullMetadata: false,
    );
  }

  Future<List<XFile>?> pickImages(ImagePickSizeEnum pickSize) async {
    return _picker.pickMultiImage(
      limit: 10,
      imageQuality: pickSize.quality,
      maxHeight: pickSize.height,
      maxWidth: pickSize.width,
      requestFullMetadata: false,
    );
  }
}

enum ImagePickSizeEnum {
  /// For Movie Image's
  movieImage(width: 1080, height: 1080, quality: 80),
  profileImage(width: 600, height: 600, quality: 90);

  const ImagePickSizeEnum({
    required this.width,
    required this.height,
    required this.quality,
  });

  final double width;
  final double height;
  final int quality;
}
