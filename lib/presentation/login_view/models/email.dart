import 'package:formz/formz.dart';

enum LoginEmailValidationError { empty, invalid }

class LoginEmail extends FormzInput<String, LoginEmailValidationError> {
  const LoginEmail.pure() : super.pure('');
  const LoginEmail.dirty([super.value = '']) : super.dirty();

  @override
  LoginEmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return LoginEmailValidationError.empty;
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return LoginEmailValidationError.invalid;
    }
    return null;
  }
}
