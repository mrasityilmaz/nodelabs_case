import 'package:formz/formz.dart';

enum RegisterNameSurnameValidationError { empty, invalid, minLength, maxLength }

class RegisterNameSurname extends FormzInput<String, RegisterNameSurnameValidationError> {
  const RegisterNameSurname.pure() : super.pure('');
  const RegisterNameSurname.dirty([super.value = '']) : super.dirty();

  @override
  RegisterNameSurnameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return RegisterNameSurnameValidationError.empty;
    if (value.length < 3) return RegisterNameSurnameValidationError.minLength;
    if (value.length > 50) return RegisterNameSurnameValidationError.maxLength;
    if (!RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]+$').hasMatch(value)) {
      return RegisterNameSurnameValidationError.invalid;
    }
    return null;
  }
}
