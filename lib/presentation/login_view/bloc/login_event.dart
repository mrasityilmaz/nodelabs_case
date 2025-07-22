import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class LoginViewEvent extends Equatable {
  const LoginViewEvent();
  @override
  List<Object?> get props => [];
}

@immutable
final class LoginViewSubmitted extends LoginViewEvent {
  const LoginViewSubmitted();
}

@immutable
final class LoginViewObscurePasswordPressed extends LoginViewEvent {
  const LoginViewObscurePasswordPressed();
}

@immutable
final class LoginViewEmailChanged extends LoginViewEvent {
  const LoginViewEmailChanged({required this.email});
  final String email;
}

@immutable
final class LoginViewPasswordChanged extends LoginViewEvent {
  const LoginViewPasswordChanged({required this.password});
  final String password;
}
