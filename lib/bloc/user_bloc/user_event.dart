import 'package:equatable/equatable.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

// ✅ Authentication Events
class UserInitializeRequested extends UserEvent {
  const UserInitializeRequested();
}

class UserLoginRequested extends UserEvent {
  const UserLoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class UserRegisterRequested extends UserEvent {
  const UserRegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}

class UserProfileLoadRequested extends UserEvent {
  const UserProfileLoadRequested();
}

class UserPhotoUpdateRequested extends UserEvent {
  const UserPhotoUpdateRequested();
}

class UserLogoutRequested extends UserEvent {
  const UserLogoutRequested();
}
