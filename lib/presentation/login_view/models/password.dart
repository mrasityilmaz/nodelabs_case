import 'package:formz/formz.dart';

enum LoginPasswordValidationError { empty, tooShort, tooLong, weak }

class LoginPassword extends FormzInput<String, LoginPasswordValidationError> {
  const LoginPassword.pure() : super.pure('');
  const LoginPassword.dirty([super.value = '']) : super.dirty();

  @override
  LoginPasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return LoginPasswordValidationError.empty;

    return null;
  }
}
