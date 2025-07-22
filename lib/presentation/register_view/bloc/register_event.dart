import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

sealed class RegisterViewEvent extends Equatable {
  const RegisterViewEvent();
  @override
  List<Object?> get props => [];
}

@immutable
final class RegisterViewRegisterPressed extends RegisterViewEvent {
  const RegisterViewRegisterPressed();
}

@immutable
final class RegisterViewObscurePasswordPressed extends RegisterViewEvent {
  const RegisterViewObscurePasswordPressed();
}

@immutable
final class RegisterViewObscureConfirmPasswordPressed extends RegisterViewEvent {
  const RegisterViewObscureConfirmPasswordPressed();
}

@immutable
final class RegisterViewFormChanged<F extends FormzInput<String, Enum>> extends RegisterViewEvent {
  const RegisterViewFormChanged({required this.value});
  final String value;
}
