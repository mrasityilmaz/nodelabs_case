import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:nodelabs_movie_case/presentation/login_view/models/email.dart';
import 'package:nodelabs_movie_case/presentation/login_view/models/password.dart';

part 'login_state.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.copy,
)
final class LoginViewState extends Equatable with LoginViewStateMappable {
  const LoginViewState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const LoginEmail.pure(),
    this.password = const LoginPassword.pure(),
    this.obscurePassword = true,
    this.isValid = false,
    this.errorMessage,
  });

  final FormzSubmissionStatus status;
  final LoginEmail email;
  final LoginPassword password;
  final bool obscurePassword;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, email, password, obscurePassword, isValid, errorMessage];
}
