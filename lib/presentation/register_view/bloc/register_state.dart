import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:nodelabs_movie_case/presentation/register_view/models/models.dart';

part 'register_state.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.copy,
)
final class RegisterViewState extends Equatable with RegisterViewStateMappable {
  const RegisterViewState({
    this.status = FormzSubmissionStatus.initial,
    this.nameSurname = const RegisterNameSurname.pure(),
    this.email = const RegisterEmail.pure(),
    this.password = const RegisterPassword.pure(),
    this.confirmPassword = const RegisterConfirmPassword.pure(),
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.isValid = false,
    this.errorMessage,
  });

  final FormzSubmissionStatus status;
  final RegisterNameSurname nameSurname;
  final RegisterEmail email;
  final RegisterPassword password;
  final RegisterConfirmPassword confirmPassword;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        nameSurname,
        email,
        password,
        confirmPassword,
        obscurePassword,
        obscureConfirmPassword,
        isValid,
        errorMessage,
      ];
}
