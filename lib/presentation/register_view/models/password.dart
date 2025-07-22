import 'package:formz/formz.dart';

enum RegisterPasswordValidationError { empty, tooShort, tooLong, weak, notMatch }

class RegisterPassword extends FormzInput<String, RegisterPasswordValidationError> {
  const RegisterPassword.pure({this.password = ''}) : super.pure('');
  const RegisterPassword.dirty([super.value = '', this.password = '']) : super.dirty();

  final String password;

  @override
  RegisterPasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return RegisterPasswordValidationError.empty;
    if (value.length < 8) return RegisterPasswordValidationError.tooShort;
    if (value.length > 20) return RegisterPasswordValidationError.tooLong;
    if (!(value.contains(RegExp('[A-Z]')) &&
        value.contains(RegExp('[a-z]')) &&
        value.contains(RegExp('[0-9]')) &&
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
      return RegisterPasswordValidationError.weak;
    }
    if (value != password && password.isNotEmpty) return RegisterPasswordValidationError.notMatch;
    return null;
  }
}

class RegisterConfirmPassword extends FormzInput<String, RegisterPasswordValidationError> {
  const RegisterConfirmPassword.pure({this.password = ''}) : super.pure('');
  const RegisterConfirmPassword.dirty([super.value = '', this.password = '']) : super.dirty();

  final String password;

  @override
  RegisterPasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return RegisterPasswordValidationError.empty;
    if (value.length < 8) return RegisterPasswordValidationError.tooShort;
    if (value.length > 20) return RegisterPasswordValidationError.tooLong;
    if (!(value.contains(RegExp('[A-Z]')) &&
        value.contains(RegExp('[a-z]')) &&
        value.contains(RegExp('[0-9]')) &&
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
      return RegisterPasswordValidationError.weak;
    }
    if (value != password) return RegisterPasswordValidationError.notMatch;
    return null;
  }
}
