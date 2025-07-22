import 'package:formz/formz.dart';

enum RegisterEmailValidationError { empty, invalid }

class RegisterEmail extends FormzInput<String, RegisterEmailValidationError> {
  const RegisterEmail.pure() : super.pure('');
  const RegisterEmail.dirty([super.value = '']) : super.dirty();

  @override
  RegisterEmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return RegisterEmailValidationError.empty;
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return RegisterEmailValidationError.invalid;
    }
    return null;
  }
}
