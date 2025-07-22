import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

final class ProfileInitialEvent extends ProfileEvent {
  const ProfileInitialEvent();
}

final class ProfileUploadImageEvent extends ProfileEvent {
  const ProfileUploadImageEvent();

  @override
  List<Object?> get props => [];
}
